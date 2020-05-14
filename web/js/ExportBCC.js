 function export_table_to_excel(id, type, fn) {
var wb = XLSX.utils.table_to_book(document.getElementById(id), {sheet:"Planilla_FM"});
var wbout = XLSX.write(wb, {bookType:type, bookSST:true, type: 'binary'});
var fname = fn || 'BCCDetail.' + type;
try {
	saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), fname);
} catch(e) { if(typeof console != 'undefined') console.log(e, wbout); }
return wbout;
}

function s2ab(s) {
	if(typeof ArrayBuffer !== 'undefined') {
		var buf = new ArrayBuffer(s.length);

		var view = new Uint8Array(buf);
		for (var i=0; i!=s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
		
		return buf;
	} else {
		var buf = new Array(s.length);
		for (var i=0; i!=s.length; ++i) buf[i] = s.charCodeAt(i) & 0xFF;
		return buf;
	}
}

function doit(type, fn) { return export_table_to_excel('mydatatable', type || 'xlsx', fn); }



 excelCell.s = {
	    fill: {
		patternType: "none", // none / solid
		fgColor: {rgb: "FF000000"},
		bgColor: {rgb: "FFFFFFFF"}
	    },
	    font: {
		name: 'Times New Roman',
		sz: 16,
		color: {rgb: "#FF000000"},
		bold: false,
		italic: false,
		underline: false
	    },
	    border: {
		top: {style: "thin", color: {auto: 1}},
		right: {style: "thin", color: {auto: 1}},
		bottom: {style: "thin", color: {auto: 1}},
		left: {style: "thin", color: {auto: 1}}
	    }
	};