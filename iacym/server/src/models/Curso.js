const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
    sequelize.define('Curso', {
        id_curso: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        zonaFK:  {
            type: DataTypes.UUID,
            allowNull: false,
        },
        miembroFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        maestroFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        horario: {
            type: DataTypes.DATE,
            allowNull: false,
        }, 
        estadoFK: {
            type: DataTypes.UUID,
            allowNull: false,
        }
    }, {timestamps: false})
}