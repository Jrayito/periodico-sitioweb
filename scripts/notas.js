var loc = document.location.href;
var getString = loc.split('?')[1];
var GET = getString.split('&');
var get = {};

for( var i = 0, l = GET.length; i < 1; i++){
  var tmp = GET[i].split('=');
  get[tmp[0]] = unescape(decodeURI(tmp[1]));
}


if(get['nota']){
  let idNota = get.nota;
  $.ajax({
    url: "../php/servicios/getNota.php",
    type: "POST",
    data: {id: idNota},
    success: function (response) {
      let data = JSON.parse(response);

      addNota(data);
    }
  })
}else{
  location.href = "../index.html";
}

const addNota = data =>{
  $("#nota").html(" ");
  let html = "";
  html +="<div class='content-img'>"+
  "<img src='../recursos/"+data.data[0].imagen+"'>"+
"</div>"+
"<span>Autor:"+data.data[0].nombre+" "+data.data[0].apellidos+"</span>"+
"<h1>"+data.data[0].titulo+"</h1>"+
"<h2>"+data.data[0].fecha+"</h2>"+
"<h3>"+data.data[0].tipo+"</h3>"+

"<div id='content-descripcion'>"+
  "<textarea id='text-nota' cols='30' rows='10' disabled></textarea>"+
"</div>";
$("#nota").html(html);
$("#text-nota").val(data.data[0].descripcion);
}