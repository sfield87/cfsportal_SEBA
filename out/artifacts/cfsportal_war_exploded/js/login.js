/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


        window.addEventListener('load',function(){
            document.getElementById('btnIniciar').addEventListener('click', function(){
                var user = document.getElementById('txtUser').value;
                var password = document.getElementById('txtpass').value;

                const urlParams = new URLSearchParams(window.location.search);
                const myParam = urlParams.get('redirect');

                document.getElementById("url").value = myParam;

                var flag = false;
                if(user.length > 0 && password.length >0){
                    flag=true;
                }
                if(flag){
                    document.getElementById('frmIniciar').submit();
                }else{
                    alert('Complete los Campos por favor');
                }
    });
});