const deleteMiembroControllers = async (id_miembro) => {
    const deleteMiembro = await miembroModels.findOne({
        where: {
            id_miembro: id_miembro
        }
    })

    if (deleteMiembro) {
        const deleteData = await miembroModels.destroy({
            where: {
                id_miembro: id_miembro
            }
        })
        ({message: 'Miembro Eliminado'})
        return deleteData;
    } else {
        throw Error (`No se encontro el miembro con id: ${id_miembro}`)
    }
}

module.exports =deleteMiembroControllers;