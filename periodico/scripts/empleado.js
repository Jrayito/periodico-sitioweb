
let actualizar = 0;
let data;
let categorias;
let usuario;

getCategorias();
getCategoriaAdd();

if(localStorage.getItem('user')){
  usuario = JSON.parse(localStorage.getItem('user'));
  getNotasUser();
}

function getNotasUser() {
  $("#body-user").html(" ");
  let html = " ";
  $.ajax({
    url: "../php/servicios/getNotasUser.php",
    type: "POST",
    data: { id: usuario.data[0].id },//Cambiar por el inicio de sesión
    success: function (response) {
      data = JSON.parse(response);
      for (let index = 0; index < data.data.length; index++) {
        html += "<tr>" +
          "<td>" + data.data[index].titulo + "</td>" +
          "<td>" + data.data[index].cat + "</td>" +
          "<td>" + data.data[index].tipo + "</td>" +
          "<td>" + data.data[index].date + "</td>" +
          "<td>" +
          "<button class='btn-eliminar-nota' data-id='" + data.data[index].id + "'>Eliminar</button>" +
          "<button class='btn-editar-nota' data-id='" + data.data[index].id + "' data-index='" + index + "'>Editar</button>" +
          "</td>" +
          "</tr>";
      }
      $("#body-user").html(html);
      addEvent();
    }
  })
}

function addEvent() {

  $(".btn-eliminar-nota").on('click', function () {
    //Podemos abrir un modal de eliminación
    let idRemove = $(this).attr('data-id');
    $.ajax({
      url: "../php/servicios/deleteNota.php",
      type: "POST",
      data: { id: idRemove },
      success: function (response) {
        alert(response);
        getNotasUser();
      }
    })

  });

  $(".btn-editar-nota").on('click', function () {
    actualizar = 1;
    const dataIndex = $(this).attr('data-index');
    const dataId = $(this).attr('data-id');
    let idCategoria;
    let idTipo;

    for (let i = 0; i < categorias.data.length; i++) {
      if (data.data[dataIndex].cat == categorias.data[i].nombre) {
        idCategoria = categorias.data[i].id;
      }
    }
    switch (data.data[dataIndex].tipo) {
      case 'Local':
        idTipo = 1;
        break;
      case 'Nacional':
        idTipo = 2;
        break;
      case 'Internacional':
        idTipo = 3;
        break;
    }

    $("#hidden").val(data.data[dataIndex].id);
    $("#title-nota").val(data.data[dataIndex].titulo);
    $("#option-cat").val(idCategoria);
    $("#option-tipo").val(idTipo);
    $("#desc").val(data.data[dataIndex].descripcion);
    $(".modal").css('opacity', '1');
    $(".modal").css('visibility', 'visible');
  });

}

$("#btn-guardar").click(function (e) {
  e.preventDefault();
  let form = new FormData($("#form-nota")[0]);
  let ruta = "../php/servicios/setNota.php"
  if (actualizar == 1) {
    ruta = "../php/servicios/updateNota.php";
    actualizar = 0;
  }

  $.ajax({
    url: ruta,
    data: form,
    type: "POST",
    contentType: false,
    processData: false,
    success: function (response) {
      alert(response);
      $(".modal").css('opacity', '0');
      $(".modal").css('visibility', 'hidden');
      getNotasUser();
    }
  });

});

function getCategorias() {
  $("#option-cat-buscador option").each(function () {
    $(this).remove();
  });
  $.ajax({
    url: "../php/servicios/getCategoria.php",
    type: "POST",
    data: {},
    success: function (response) {
      let data = JSON.parse(response);

      for (let i = 0; i < data.data.length; i++) {
        let item = $("<option />", { text: data.data[i].nombre, value: data.data[i].id });
        $("#option-cat-buscador").append(item);
      }

    }
  });
}

function getCategoriaAdd() {
  $("#option-cat option").each(function () {
    $(this).remove();
  });
  $.ajax({
    url: "../php/servicios/getCategoria.php",
    type: "POST",
    data: {},
    success: function (response) {
      categorias = JSON.parse(response);

      for (let i = 0; i < categorias.data.length; i++) {
        let item = $("<option />", { text: categorias.data[i].nombre, value: categorias.data[i].id });
        $("#option-cat").append(item);
      }
    }
  })
}

$("#btn_new").click(function () {
  getFecha();
  $("#hidden").val(usuario.data[0].id);
  $("#title-nota").val("");
  $("#desc").val("");
  getCategoriaAdd();
  $(".modal").css('opacity', '1');
  $(".modal").css('visibility', 'visible');
});

const getFecha = () =>{
  let date = new Date();
  let day = date.getDate();
  let mes = date.getMonth()+1;
  let year = date.getFullYear();

  let dateP = year+"-"+mes+"-"+day;
  $("#fecha").val(dateP);
}

$(".close-modal").click(function () {
  $(".modal").css('opacity', '0');
  $(".modal").css('visibility', 'hidden');
});

$("#search").change(function(){
  
  let html = "";
  $.ajax({
    url: "../php/servicios/getNotasKey.php",
    type: "POST",
    data: { key: $("#search").val() },
    success: function (response) {
      $("#body-user").html(" ");
      console.log(response);
      data = JSON.parse(response);
      for (let index = 0; index < data.data.length; index++) {
        html += "<tr>"+
                   "<td>"+data.data[index].titulo+"</td>"+
                   "<td>"+data.data[index].cat+"</td>"+
                   "<td>"+data.data[index].tipo+"</td>"+
                   "<td>"+data.data[index].date+"</td>"+
                   "<td>"+    
                      "<button class='btn-eliminar-nota' data-id='"+data.data[index].id+"'>Eliminar</button>"+
                     "<button class='btn-editar-nota' data-id='"+data.data[index].id+"' data-index='"+index+"'>Editar</button>"+
                   "</td>"+
                 "</tr>"; 
      }
      $("#body-user").html(html);
      addEvent();
    }
  });
});


$("#option-cat-buscador").change(function(){
  console.log("cambio");
  let idCat = $("#option-cat-buscador option:selected").val();
  let html = "";
  $.ajax({
    url: "../php/servicios/getNotaCategoria.php",
    type: "POST",
    data: { key: idCat,
            idUser: usuario.data[0].id},
    success: function (response) {
      $("#body-user").html(" ");
      data = JSON.parse(response);
      for (let index = 0; index < data.data.length; index++) {
        html += "<tr>"+
                   "<td>"+data.data[index].titulo+"</td>"+
                   "<td>"+data.data[index].cat+"</td>"+
                   "<td>"+data.data[index].tipo+"</td>"+
                   "<td>"+data.data[index].date+"</td>"+
                   "<td>"+    
                      "<button class='btn-eliminar-nota' data-id='"+data.data[index].id+"'>Eliminar</button>"+
                     "<button class='btn-editar-nota' data-id='"+data.data[index].id+"' data-index='"+index+"'>Editar</button>"+
                   "</td>"+
                 "</tr>"; 
      }
      $("#body-user").html(html);
      addEvent();
    }
  });
});

$("#option-tipo-buscador").change(function(){
  console.log("cambio");
  let idTipo = $("#option-tipo-buscador option:selected").val();
  let html = "";
  $("#body-user").html(" ");
  $.ajax({
    url: "../php/servicios/getNotasTipo.php",
    type: "POST",
    data: { key: idTipo,
            idUser: usuario.data[0].id},
    success: function (response) {
      data = JSON.parse(response);
      for (let index = 0; index < data.data.length; index++) {
        html += "<tr>"+
                   "<td>"+data.data[index].titulo+"</td>"+
                   "<td>"+data.data[index].cat+"</td>"+
                   "<td>"+data.data[index].tipo+"</td>"+
                   "<td>"+data.data[index].date+"</td>"+
                   "<td>"+    
                      "<button class='btn-eliminar-nota' data-id='"+data.data[index].id+"'>Eliminar</button>"+
                     "<button class='btn-editar-nota' data-id='"+data.data[index].id+"' data-index='"+index+"'>Editar</button>"+
                   "</td>"+
                 "</tr>"; 
      }
      $("#body-user").html(html);
      addEvent();
    }
  });
});

