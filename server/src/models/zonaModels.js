const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
    sequelize.define('Zona', {
        id_zonaPK: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4
        },
        nombre: {
            type: DataTypes.STRING,
            allowNul: false,
        },
        numero: {
            type: DataTypes.INTEGER,
            allowNul: false,
        }
    }, {timestamps: false})
}