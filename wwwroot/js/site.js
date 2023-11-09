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

    
    