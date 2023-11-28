﻿    
    function validarContraseña() { const campoContraseña = document.getElementById('contraseña').value,
    campoContraseña2 = document.getElementById('contraseña2').value;
    let validar = false
    const incorrecta1 = document.getElementById('incorrecta1')
    incorrecta1.innerHTML = ""
    const incorrecta2 = document.getElementById('incorrecta2')
    incorrecta2.innerHTML = ""
    if (validar = true) {
        if(campoContraseña != campoContraseña2){
            incorrecta1.innerHTML = "Las contraseñas no coinciden"
            return false;
        }
        else{

            if (campoContraseña.length < 8 || campoContraseña2.length < 8) {
              incorrecta1.innerHTML = 'La contraseña debe tener al menos 8 caracteres.';
              return false;  }  
              else {
                    return true;
                   }
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
    
    function alertaReserva() {
        Swal.fire({
            title: "Reserva enviada",
            text: "  Reserva enviada con exito!!",
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
    function alertaReseña() {
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
  
    
    function GuardarReseña(IDCliente) {
      let IdRes = $('#IdRestaurante').val();
      let comentario = $('#comentario').val();
      let valoracion = $("input[type=radio][name=Valoracion]:checked").val();

      $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Dennys/GuardarReseñaAjax',
            data: { IdCliente: IDCliente, IdRestaurante: IdRes, Comentario: comentario, Valoracion: valoracion},
            success:
                function (response) 
                {
                  alertaReseña();
                }
        });
    }


    function GuardarReserva(IDCliente) {
      let IdRes = $('#IdRestaurante').val();
      const fecha = localStorage.getItem("fecha-reserva"),
        personas = localStorage.getItem("personas-reserva"),
        horario = localStorage.getItem("horario-reserva");

      $.ajax(
        {
            type: 'POST',
            dataType: 'JSON',
            url: '/Dennys/GuardarReservaAjax',
            data: { IdRestaurante: IdRes, IdCliente: IDCliente, fechaReserva: fecha, personasReserva: personas, horarioReserva: horario},
            success:
                function (response) 
                {

                }
        });
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
            localStorage.setItem("fecha-reserva", date);
          })()
}
   

    function SeleccionarCantidadPersonas() {
        (async () => {
          const { value: personas } = await Swal.fire({
            title: "Seleccione la cantidad de personas para la reserva",
            input: "select",
            inputOptions: {
              1: "1 persona",
              2: "2 personas",
              3: "3 personas",
              4: "4 personas",
              5: "5 personas",
              6: "6 personas",
              7: "7 personas",
              8: "8 personas",
            },
            inputPlaceholder: "Seleccione la cantidad de personas",
            showCancelButton: true,
          });
      
          if (personas) {
            Swal.fire(`Reserva para ${personas}`);
          }
          localStorage.setItem("personas-reserva", personas);
        })();
      }

      function SeleccionarHorario() {
        (async () => {
          const { value: horario } = await Swal.fire({
            title: "Seleccione el horario para la reserva",
            input: "select",
            inputOptions: {
              "12:00 PM": "12:00 PM",
              "1:00 PM": "1:00 PM",
              "2:00 PM": "2:00 PM",
              "6:00 PM": "6:00 PM",
              "7:00 PM": "7:00 PM",
              "8:00 PM": "8:00 PM",
              "9:00 PM": "9:00 PM",
              "10:00 PM": "10:00 PM",
            },
            inputPlaceholder: "Seleccione el horario",
            showCancelButton: true,
          });
      
          if (horario) {
            Swal.fire(`Reserva para las ${horario}`);
          }
          localStorage.setItem("horario-reserva", horario);
        })();
      }


      function validarLongitud(elemento) {
        var maxCaracteres = 500;
        var longitudActual = elemento.value.length;
        var caracteresRestantes = maxCaracteres - longitudActual;
  
        var contador = document.getElementById('contador');
        contador.textContent = caracteresRestantes + '/500';
  
        if (caracteresRestantes < 0) {
          contador.classList.add('excedido');
        } else {
          contador.classList.remove('excedido');
        }
      }

