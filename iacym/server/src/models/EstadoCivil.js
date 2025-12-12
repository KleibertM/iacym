const { DataTypes } = require('sequelize');

const enumCivil = ['Solter@', 'Casad@', 'Conyuge', 'Viud@'];

module.exports = (sequelize) => {
    sequelize.define('EstadoCivil', {
        id_estCivil: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4,
        },
        nombre: {
            type: DataTypes.ENUM(...enumCivil),
            allowNull: false,
        }
    }, {timestamps: false})
}