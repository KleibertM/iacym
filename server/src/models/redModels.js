const {DataTypes} = require('sequelize');

module.exports = (sequelize) => {
    sequelize.define('Red', {
        id_red: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4,
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        pastorFK: {
            type: DataTypes.UUID,
            allowNull: false,
        },
        sedeFK: {
            type: DataTypes.UUID,
            allowNull: false,
        }
    }, {timestamps: false})
}