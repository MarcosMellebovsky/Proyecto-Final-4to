﻿    
    function validarContraseña() {
        const campoContraseña = document.getElementById('contraseña').value,
        campoContraseña2 = document.getElementById('contraseña2').value;
        let validar = false
        const incorrecta1 = document.getElementById('incorrecta1')
        incorrecta1.innerHTML = ""
        const incorrecta2 = document.getElementById('incorrecta2')
        incorrecta2.innerHTML = ""
        if (validar = true) {
            if(campoContraseña != campoContraseña2){
                incorrecta2.innerHTML = "Las contraseñas no coinciden"
                return false;
            }
            else{
                return true;
            }
        }
    }

    function mostrarDetallesRestaurante(IdRestaurante) {
        $.ajax({
            url: '/Dennys/ObtenerDetallesRestaurante',
            data: { id: IdRestaurante },
            type: 'GET',
            success: function (response) {
                $('#modalTitulo').text(response.Nombre);
                $('#modalDescripcion').text(response.descripcion);
                $('#modalDireccion').text(response.direccion);
                $('#modalApertura').text(response.horarioApertura);
                $('#modalClausura').text(response.horarioClausura);
                $('#modalFechaFundacion').text(response.fechaFundacion);
                $('#modalImagen').attr('src', response.imagen);
            }
        });
    }

    function cargarIdRestaurante(IdRestaurante){
        $('#IdRestaurante').val(IdRestaurante)
    }
    