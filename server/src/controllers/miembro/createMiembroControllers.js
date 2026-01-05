const createMiembroControllers = async (membresia, nombre, apellido, telefono, dni,
    hijo, estCivilFK, correo, direccion, fechaNac, supervisionFK, rolFK
) => {
    const miembroExistent = await miembro.finOne({
        where: {
            dni: dni
        }
    })
    if (miembroExistent) {  throw new Error('Este DNI ya tiene un registro')}

    return await miembro.create({
        membresia: membresia,
        nombre: nombre,
        apellido: apellido,
        telefono: telefono,
        dni: dni,
        hijo: hijo,
        estCivilFK: estCivilFK,
        correo: correo,
        direccion: direccion,
        fechaNac: fechaNac,
        supervisionFK: supervisionFK,
        rolFK: rolFK
    })
}

module.exports = createMiembroControllers;