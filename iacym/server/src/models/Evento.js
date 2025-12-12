const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
    sequelize.define('Evento', {
        id_evento: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4,
        }, 
        nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        fecha: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        zonaFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        miembroFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        encargadoFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        redFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        supervisionFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        pastorFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        estadoFK: {
            type: DataTypes.UUID,
            allowNull: false,
        }
    },{timestamps: false})
}