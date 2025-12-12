const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
    sequelize.define('Miembro',{
        id_miembro: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4
        },
        nombre: {
            type: DataTypes.UUID,
            allowNull: false,
        }
    }, {timestamps: false})
}