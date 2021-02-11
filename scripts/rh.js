let bodyEmpleados = document.getElementById("body-empleados");
let bodyCategorias = document.getElementById("body-categorias");
let info;
getUsuarios();
getNotas();
let update = 0;
let index_editar;

const limpiarInputs = () =>{
  $("#name-emp").val(" ");
  $("#ap-emp").val(" ");
  $("#user-em").val(" ");
  $("#puesto-emp option[value='Recursos Humanos']").attr("selected",true)
  password = "";
}

function getUsuarios(){
  $("#body-empleados").html(" ");
  $.ajax({
    url: "../php/servicios/getEmpleados.php",
    type: "POST",
    data: {},
    success: function(response){
      info = JSON.parse(response);
      let html = "";
      for (let index = 0; index < info.informacion.length; index++) {
        html += "<tr>"+
                  "<td>"+info.informacion[index].nombre+"</td>"+
                  "<td>"+info.informacion[index].apellidos+"</td>"+
                  "<td>"+info.informacion[index].puesto+"</td>"+
                  "<td>"+
                    "<button class='btn-eliminar' data-id='"+info.informacion[index].id+"' data-index='"+index+"'>Eliminar</button>"+
                    "<button class='btn-editar' data-id='"+info.informacion[index].id+"' data-index='"+index+"'>Editar</button>"+
                  "</td>"+
                "</tr>"
      }
      $("#body-empleados").html(html);
      addEven();
    }
  });
}

function getNotas(){
  $("#body-categorias").html(" ");
  $.ajax({
    url: "../php/servicios/getCategoria.php",
    type: "POST",
    data: {},
    success: function(response){
      let info_categorias = JSON.parse(response);
      let html = "";
      //console.log(info);
      for (let index = 0; index < info_categorias.data.length; index++) {
        let item = parseInt(index + 1);
        html += "<tr>"+
                  "<td>"+item+"</td>"+
                  "<td>"+info_categorias.data[index].nombre+"</td>"+
                  "<td>"+
                    "<button class='btn-eliminar-cat' data-id='"+info_categorias.data[index].id+"'>Eliminar</button>"+
                  "</td>"+
                "</tr>"
      }
      $("#body-categorias").html(html);
      addEven();
    }
  });
}

function addEven(){
  $(".btn-eliminar").unbind();

  $(".btn-eliminar").on('click', function(e){
    let id = $(this).attr('data-id');
    $.ajax({
      url: "../php/servicios/deleteEmpleado.php",
      type: "POST",
      data: {id, id},
      success: function(response){
        if(response == "200"){
          alert("Usuario eliminado");
          getUsuarios();
        }else{
          alert("El usuario no se pudo eliminar");
        }
      }
    });
  });

  $(".btn-editar").click(function(){
    let index = $(this).attr('data-index');
    update = 1;
    index_editar = $(this).attr('data-index');
    $(".form-employes").css("display", "block");
    $("#name-emp").val(info.informacion[index].nombre);
    $("#ap-emp").val(info.informacion[index].apellidos);
    $("#puesto-emp").val(info.informacion[index].puesto);
  });

  $(".btn-eliminar-cat").click(function(){
    let id = $(this).attr('data-id');
    $.ajax({
      url: "../php/servicios/deleteCategoria.php",
      type: "POST",
      data: {id, id},
      success: function(response){
        if(response == "200"){
          alert("Categoria eliminada");
          getNotas();
        }else{
          alert("Categoria no eliminada");
        }
      }
    });
  })
}

$(document).ready(function(){

  let abecedario = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9",".","-","_","$","&","#","@"];
  let password;
  $("#btn_user").click(function(){
    limpiarInputs();
    update = 0;
    let prop = $(".form-employes").css("display");
    if(prop == "none"){
      $(".form-employes").css("display", "block");
    }else{
      $(".form-employes").css("display", "none");
    }
  });

  $("#btn_cat").click(function(){
    let prop = $(".form-categoria").css("display");
    if(prop == "none"){
      $(".form-categoria").css("display", "block");
    }else{
      $(".form-categoria").css("display", "none");
    }
  });

  $("#btn-guardar-emp").click(function(){
    let infoUser = {
      nombre: $("#name-emp").val(),
      ap: $("#ap-emp").val(),
      user: $("#user-em").val(),
      puesto: $("#puesto-emp option:selected").val(),
      password: password
    }

    let url = "../php/servicios/setEmpleado.php";

    if(update == 1){
      url = "../php/servicios/updateEmpleado.php"
      infoUser = {
        id: info.informacion[index_editar].id,
        nombre: $("#name-emp").val(),
        ap: $("#ap-emp").val(),
        puesto: $("#puesto-emp option:selected").val(),
      }
    }

    $.ajax({
      url: url,
      type: "POST",
      data: infoUser,
      success: function(response){
        if(response == "200"){
          alert("Usuario Registrado");
          getUsuarios()
        }else{
          alert("El usuario no se pudo registrar");
        }
        $(".form-employes").css("display", "none");
      }
    });
  });

  $("#btn-guardar-cat").click(function(){
    $.ajax({
      url: "../php/servicios/setCategoria.php",
      type: "POST",
      data: {cat: $("#input-cat").val()},
      success: function(response){
        if(response == "200"){
          alert("Categoria registrada");
        }else{
          alert("La categoria no se pudo registrar");
        }
        $(".form-categoria").css("display", "none");
      }
    });
  });

  $("#ap-emp").change(function(){
    generarUser($("#name-emp").val(), $("#ap-emp").val());
    password = generarPassword();
  });


  const generarPassword = () =>{
    let password = "";

    for (let index = 0; index < 8; index++) {
      let aleatorio = parseInt(Math.random()*abecedario.length);
      password += abecedario[aleatorio];
    }
    $("#lbl-pass").text("Contraseña: "+password);
    return password;
  }

  const generarUser = (nombre, apellidos) =>{
    let nombre_user = nombre.split(' ');
    let ap_user = apellidos.split(' ');
    let user =  nombre_user[0].toLowerCase()+"_"+ap_user[0].toLowerCase()+"@edenoticias.com";
    $("#user-em").val(user);
    return user;
  }

  $("#search").change(function(){
    let buscar = $("#search").val();
    $.ajax({
      url: "../php/servicios/getKey.php",
      type: "POST",
      data: {buscar: buscar},
      success: function(response){
        info = JSON.parse(response);
        let html = "";
        for (let index = 0; index < info.informacion.length; index++) {
          html += "<tr>"+
                    "<td>"+info.informacion[index].nombre+"</td>"+
                    "<td>"+info.informacion[index].apellidos+"</td>"+
                    "<td>"+info.informacion[index].puesto+"</td>"+
                    "<td>"+
                      "<button class='btn-eliminar' data-id='"+info.informacion[index].id+"' data-index='"+index+"'>Eliminar</button>"+
                      "<button class='btn-editar' data-id='"+info.informacion[index].id+"' data-index='"+index+"'>Editar</button>"+
                    "</td>"+
                  "</tr>"
        }
        $("#body-empleados").html(html);
        addEven();
      }
    });
  });

  $("#btn-cerrar-sesion").click(function(){
    location.href = "../index.html";
  });

  $("#folder-periodicos").click(function(){
    $("#select-fecha-periodico option").each(function () {
      $(this).remove();
    });
    $(".modal").css('opacity', '1'),
    $(".modal").css('visibility', 'visible');
    addPeriodico();
  });


  const addPeriodico = () => {
    $.ajax({
      url: "../php/servicios/getPeriodico.php",
      type: "POST",
      data: {cat: $("#input-cat").val()},
      success: function(response){
        let periodico = JSON.parse(response);
        for (let index = 0; index < periodico.data.length; index++) {
          let item = $("<option />", { text: periodico.data[index].fecha, value: periodico.data[index].id });
          $("#select-fecha-periodico").append(item);
        }
      }
    });
  }

  $("#select-fecha-periodico").change(function(){
    let idPeriodico = $("#select-fecha-periodico option:selected").val();
    $.ajax({
      url: "../php/servicios/getNotasRH.php",
      type: "POST",
      data: {id: idPeriodico},
      success: function(response){
        let nota = JSON.parse(response);
        let html = '';
        $("#body-notas-periodico").html(' ');
        for (let index = 0; index < nota.data.length; index++) {
          html += '<tr>'+
          '<td>'+(index+1)+'</td>'+
         ' <td>'+nota.data[index].titulo+'</td>'+
          '<td>'+
            '<button title="Ver nota" class="ver-nota-rh" data-id="'+nota.data[index].id+'"><i class="material-icons">remove_red_eye</i></button>'+
          '</td>'+
        '</tr>';
        }
        
        $("#body-notas-periodico").html(html);
        addEventVerNota();
      }
    });
  });

  function addEventVerNota(){

    $(".ver-nota-rh").click(function(){
      let idNota = $(this).attr('data-id');
      location.href = "nota.htm?nota="+idNota;
    });

  }

  $(".close-modal").click(function(){
    $(".modal").css('opacity', '0'),
    $(".modal").css('visibility', 'hidden');
  })
});