/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.addEventListener('load',function(){
    document.getElementById('btnupdate').addEventListener('click', function(){
       var estado = document.getElementById('rebill').checked;
       
       if(estado.checked()===true){
           alert('esta prendido');
           document.getElementById('btnupdate').submit();
       }else{
           alert('esta apagado');
       }
    });
});