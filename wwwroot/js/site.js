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
    
    function alerta() {
        Swal.fire({
            title: "Reseña enviada",
            text: "  Reseña enviada con exito!!",
            //html:"",
            icon: 'success',
            confirmButtonText: 'Volver',
            footer: '<span class="rojo"> Esta  informacion es importante!</span>',
            //width: '90%',
            // padding:
            // background:
            //grow: 'fullscreen'
            // backdrop:
            timer: 100000,
            timerProgressBar: true,
            // toast:
            // position:
            allowOutsideClick: false,
            allowEscapeKey: true,
            allowEnterKey: true,
            stopKeydownPropagation: false,
        
            // input:
            // inputPlaceholder:
            // inputValue:
            // inputOptions:
            
            //  customClass:
            // 	container:
            // 	popup:
            // 	header:
            // 	title:
            // 	closeButton:
            // 	icon:
            // 	image:
            // 	content:
            // 	input:
            // 	actions:
            // 	confirmButton:
            // 	cancelButton:
            // 	footer:	
        
            // showConfirmButton:
            // confirmButtonColor:
            // confirmButtonAriaLabel:
        
            // showCancelButton:
            // cancelButtonText:
            // cancelButtonColor:
            // cancelButtonAriaLabel:
            
            // buttonsStyling:
            // showCloseButton:
            // closeButtonAriaLabel:
        
        
            // imageUrl:
            // imageWidth:
            // imageHeight:
            // imageAlt:
        });
    }
    
  


    function GuardarReserva() {
        // Aquí puedes agregar lógica para guardar la fecha de reserva
        const fechaReserva = document.getElementById('fechaReserva').value;
        // Puedes realizar acciones adicionales aquí, por ejemplo, enviar la fecha al servidor
        console.log('Fecha de reserva:', fechaReserva);
    }

    function Calendario() {
        (async () => {
            const { value: date } = await Swal.fire({
              title: "Elegi una fecha para la reserva! ",
              input: "date",
              didOpen: () => {
                const today = (new Date()).toISOString();
                Swal.getInput().min = today.split("T")[0];
              }
            });
            if (date) {
              Swal.fire("Fecha de Reserva", date);
            }
          })()
    }
    

    