const {DataTypes} = require('sequelize');

const rolEnum = ['Pastor', 'Supervisor', 'Coordinador', 'Oveja','Tutor', 'Maestro']

module.exports = (sequelize) => {
    sequelize.define('Rol', {
        id_rol: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4,
        },
        nombre: {
            type: DataTypes.ENUM(...rolEnum),
            allowNull: false,
        }
    }, {timestamps: false})
}