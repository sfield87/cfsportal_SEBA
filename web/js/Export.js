/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    function doit(type, fn, dl, name) {
      var elt = document.getElementById('mydatatable');
      var wb = XLSX.utils.table_to_book(elt,{
        sheet: "Servicios"
      });
      return dl ?
        XLSX.write(wb, {
          bookType: type,
          bookSST: true,
          type: 'base64'
        }) :
        XLSX.writeFile(wb, fn || (name + (type || 'xlsx')));
        //XLSX.writeFile(wb, fn || ('Servicios_Activos.' + (type || 'xlsx')));
    }

