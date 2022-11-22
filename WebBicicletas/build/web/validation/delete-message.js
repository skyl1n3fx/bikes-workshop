/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deleteEntity(name, pk) {
    Swal.fire({
        icon: 'warning',
        title: '¿Estás Seguro?',
        text: '¡No podrás deshacer la acción!',
        showCancelButton: true,
        cancelButtonColor: "#d33",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Eliminar",
    }).then((result) => {
        if (result.value) {
            Swal.fire(
                    '¡Eliminado!',
                    name + ' Eliminado correctamente',
                    'success'
                    ).then(function () {
                window.location.href = "../../servlet" + (name) + "?pk=" + (pk);
            })
        }
    })
}


function logout() {
    Swal.fire({
        icon: 'warning',
        title: 'Cerrar sesion',
        text: 'Estas seguro?',
        showCancelButton: true,
        cancelButtonColor: "#d33",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Cerrar sesion",
    }).then((result) => {
        if (result.value) {
            Swal.fire(
                    '¡Logout!',
                    'Ha cerrado sesion',
                    'success'
                    ).then(function () {
                window.location.href = "login";
            })
        }
    })
}