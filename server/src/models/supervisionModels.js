const {DataTypes, UUIDV4} = require('sequelize');

module.exports = (sequelize) => {
    sequelize.define('Supervision', {
        id_super: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: UUIDV4,
        },
        nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        redFK: {
            type: DataTypes.UUID,
            allowNull: false,
        }
    }, {timestamps: false})
}