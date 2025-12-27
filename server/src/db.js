const {sequelize} = require('sequelize')
// const seedCategories = require('./utils/venta/seedCategories');
// const { POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_DATABASE, POSTGRES_URL } = process.env;
// const { DB_USER, DB_PASSWORD, DB_HOST, DB_NAME, DATABASE_URL } = process.env;


const sedeModels = require('./models/sedeModels');
const redModels = require('./models/redModels');
const superModels = require('./models/supervisionModels')
const miembroModels = require('./models/miembroModels');
const cursoModels = require('./models/cursoModels')
const eventoModels = require('./models/eventoModels')
const zonaModels = require('./models/zonaModels')


// const sequelize = new Sequelize(process.env.RENDER_EXTER_URL, {
//   logging: false,
//   native: false,
//   dialectOptions: {
//     ssl: {
//       require: true,
//       rejectUnauthorized: false, // 👈 importante para aceptar certificado autofirmado
//     }
//   },
// });

// sequelize.authenticate()
//   .then(() => {
//     console.log('✅ Conexión con PostgreSQL exitosa.');
//     return sequelize.sync();
//   })
//   .then(() => seedCategories(sequelize)) // ✅ PASA sequelize como argumento
//   .catch((err) => console.error('❌ Error al conectar o sincronizar:', err));

cursoModels(sequelize)
eventoModels(sequelize)
miembroModels(sequelize)
redModels(sequelize)
sedeModels(sequelize)
superModels(sequelize)
zonaModels(sequelize)

const { Curso, Evento, Miembro, Red, Sede, Supervision, Zona} = sequelize.models;

module.exports = {
    sequelize,
    ...sequelize.modelsm
    conn: sequelize,
};