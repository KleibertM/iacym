const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
    sequelize.define('Miembro',{
        id_miembro: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4
        },
        membresia: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        nombre: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        apellido: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        telefono: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        dni: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
        hijo: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        estCivilFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        correo: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        direccion: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        fechaNac: {
            type: DataTypes.DATEONLY,
            allowNull: true,
        },
        supervisionFK: {
            type: DataTypes.UUID,
            allowNull: true,
        },
        rolFK: {
            type: DataTypes.UUID,
            allowNull: false,
        }
    }, {timestamps: false})
}