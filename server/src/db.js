require('dotenv').config();
const { Sequelize, DataTypes } = require('sequelize');

// Variables de entorno
const { DB_USER, DB_PASSWORD, DB_HOST, DB_NAME, RENDER_EXTER_URL } = process.env;

const sequelize = new Sequelize(RENDER_EXTER_URL || `postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}/${DB_NAME}`, {
  logging: false,
  native: false,
  ...(RENDER_EXTER_URL && {
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false,
      }
    }
  })
});

// --- IMPORTACIÓN DE MODELOS ---
const miembroModels = require('./models/miembroModels');
const sedeModels = require('./models/sedeModels');
const redModels = require('./models/redModels');
const supervisionModels = require('./models/supervisionModels');
const rolModels = require('./models/rolModels');
const estadoCivilModels = require('./models/estadoCivilModels');
const zonaModels = require('./models/zonaModels');
const eventoModels = require('./models/eventoModels');
const cursoModels = require('./models/cursoModels');
// Nota: Si tienes un modelo 'Estado' para los estados de cursos/eventos, impórtalo aquí.

// --- INICIALIZACIÓN ---
miembroModels(sequelize);
sedeModels(sequelize);
redModels(sequelize);
supervisionModels(sequelize);
rolModels(sequelize);
estadoCivilModels(sequelize);
zonaModels(sequelize);
eventoModels(sequelize);
cursoModels(sequelize);

// --- DEFINICIÓN DE RELACIONES ---
const { 
  Miembro, Sede, Red, Supervision, Rol, 
  EstadoCivil, Zona, Evento, Curso 
} = sequelize.models;

// 1. JERARQUÍA DE LA IGLESIA (Sede -> Red -> Supervisión -> Miembro)
Sede.hasMany(Red, { foreignKey: 'sedeFK', sourceKey: 'id_sede' });
Red.belongsTo(Sede, { foreignKey: 'sedeFK', targetKey: 'id_sede' });

Red.hasMany(Supervision, { foreignKey: 'redFK', sourceKey: 'id_red' });
Supervision.belongsTo(Red, { foreignKey: 'redFK', targetKey: 'id_red' });

Supervision.hasMany(Miembro, { foreignKey: 'supervisionFK', sourceKey: 'id_super' });
Miembro.belongsTo(Supervision, { foreignKey: 'supervisionFK', targetKey: 'id_super' });

// 2. ATRIBUTOS DEL MIEMBRO
Rol.hasMany(Miembro, { foreignKey: 'rolFK', sourceKey: 'id_rol' });
Miembro.belongsTo(Rol, { foreignKey: 'rolFK', targetKey: 'id_rol' });

EstadoCivil.hasMany(Miembro, { foreignKey: 'estCivilFK', sourceKey: 'id_estCivil' });
Miembro.belongsTo(EstadoCivil, { foreignKey: 'estCivilFK', targetKey: 'id_estCivil' });

// 3. RELACIONES CON ZONAS (Ubicaciones físicas o territoriales)
Zona.hasMany(Evento, { foreignKey: 'zonaFK', sourceKey: 'id_zonaPK' });
Evento.belongsTo(Zona, { foreignKey: 'zonaFK', targetKey: 'id_zonaPK' });

Zona.hasMany(Curso, { foreignKey: 'zonaFK', sourceKey: 'id_zonaPK' });
Curso.belongsTo(Zona, { foreignKey: 'zonaFK', targetKey: 'id_zonaPK' });

// 4. RELACIONES COMPLEJAS DE EVENTOS (Múltiples vínculos con Miembro)
// Un evento tiene un Pastor, un Encargado y un Miembro principal (posible organizador)
Miembro.hasMany(Evento, { as: 'EventosComoPastor', foreignKey: 'pastorFK', sourceKey: 'id_miembro' });
Evento.belongsTo(Miembro, { as: 'Pastor', foreignKey: 'pastorFK', targetKey: 'id_miembro' });

Miembro.hasMany(Evento, { as: 'EventosComoEncargado', foreignKey: 'encargadoFK', sourceKey: 'id_miembro' });
Evento.belongsTo(Miembro, { as: 'Encargado', foreignKey: 'encargadoFK', targetKey: 'id_miembro' });

Miembro.hasMany(Evento, { as: 'EventosParticipante', foreignKey: 'miembroFK', sourceKey: 'id_miembro' });
Evento.belongsTo(Miembro, { as: 'ParticipantePrincipal', foreignKey: 'miembroFK', targetKey: 'id_miembro' });

// Vinculación de Evento con Red y Supervisión
Red.hasMany(Evento, { foreignKey: 'redFK', sourceKey: 'id_red' });
Evento.belongsTo(Red, { foreignKey: 'redFK', targetKey: 'id_red' });

Supervision.hasMany(Evento, { foreignKey: 'supervisionFK', sourceKey: 'id_super' });
Evento.belongsTo(Supervision, { foreignKey: 'supervisionFK', targetKey: 'id_super' });

// 5. RELACIONES DE CURSOS
// El maestro es un miembro
Miembro.hasMany(Curso, { as: 'CursosDictados', foreignKey: 'maestroFK', sourceKey: 'id_miembro' });
Curso.belongsTo(Miembro, { as: 'Maestro', foreignKey: 'maestroFK', targetKey: 'id_miembro' });

// El alumno principal del registro
Miembro.hasMany(Curso, { as: 'CursosInscrito', foreignKey: 'miembroFK', sourceKey: 'id_miembro' });
Curso.belongsTo(Miembro, { as: 'Alumno', foreignKey: 'miembroFK', targetKey: 'id_miembro' });


// --- SINCRONIZACIÓN ---
sequelize.authenticate()
  .then(() => {
    console.log('✅ Conexión con PostgreSQL exitosa. Sistema de Iglesia conectado.');
    return sequelize.sync({ alter: true }); // Mantiene los datos y actualiza columnas
  })
  .catch((err) => console.error('❌ Error crítico de conexión:', err));

module.exports = {
  sequelize,
  ...sequelize.models,
  conn: sequelize,
};