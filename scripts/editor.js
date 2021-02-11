let notas = {};
let data;
let idPeriodico;
$(document).ready(function () {
 
});

extraerNotas();
obtenerPeriodico();

function extraerNotas() {
  $("#body-periodico-notas").html(" ");
  let html = "";
  $.ajax({
    url: "../php/servicios/getNotas.php",
    type: "POST",
    data: {},
    success: function (response) {
      data = JSON.parse(response);
      console.log(data);
      for (let index = 0; index < data.data.length; index++) {
        html += "<tr>" +
          "<td>" + data.data[index].titulo + "</td>" +
          "<td>" + data.data[index].categoria + "</td>" +
          "<td>" + data.data[index].tipo + "</td> " +
          "<td>" +
          "<button class='btn-add' data-index='" + index + "'>Agregar</button>" +
          "</td>" +
          "</tr>"
      }
      $("#body-periodico-notas").html(html);
      addEven();
    }
  })
}

function addEven() {
  $(".btn-add").on('click', function (e) {
    e.stopImmediatePropagation();
    let index = $(this).attr('data-index');
    const itemNota = {
      id: data.data[index].id,
      titulo: data.data[index].titulo,
      categoria: data.data[index].categoria,
      tipo: data.data[index].tipo
    }

    if (notas.hasOwnProperty(itemNota.id)) {
      alert("La nota ya fue agregada");
    }
    notas[itemNota.id] = { ...itemNota };
    console.log(notas);
    pintarNotasAdd();
  });

  $(".btn-remove-notas").on('click', function(){
    console.log($(this).attr("data-id"));
    delete notas[$(this).attr("data-id")];
    pintarNotasAdd();
  });
}

const pintarNotasAdd = () => {
  $("#body-periodico-anadir").html(" ");
  let html = " ";
  Object.values(notas).forEach(items => {
    html += "<tr>" +
      "<td>" + items.titulo + "</td>" +
      "<td>" + items.categoria + "</td>" +
      "<td>" + items.tipo + "</td>" +
      "<td>" +
      "<button class='btn-remove-notas' data-id='"+items.id+"'>Eliminar</button>" +
      "</td>" +
      "</tr>"
  })
  $("#body-periodico-anadir").html(html);
  addEven();
}

$("#search").change(function(){
  let key = $("#search").val();
  console.log(key);
  $("#body-periodico-notas").html(" ");
  let html = "";
  $.ajax({
    url: "../php/servicios/getKeyNotas.php",
    type: "POST",
    data: {key: key},
    success: function (response) {
      data = JSON.parse(response);
      console.log(data);
      for (let index = 0; index < data.data.length; index++) {
        html += "<tr>" +
          "<td>" + data.data[index].titulo + "</td>" +
          "<td>" + data.data[index].categoria + "</td>" +
          "<td>" + data.data[index].tipo + "</td> " +
          "<td>" +
          "<button class='btn-add' data-index='" + index + "'>Agregar</button>" +
          "</td>" +
          "</tr>"
      }
      $("#body-periodico-notas").html(html);
      addEven();
    }
  });
});

function obtenerPeriodico(){
  let date = new Date();
  let day = date.getDate();
  let mes = date.getMonth()+1;
  let year = date.getFullYear();

  let dateP = year+"-"+mes+"-"+day;
  $.ajax({
    url: "../php/servicios/periodico.php",
    type: "POST",
    data: {date: dateP},
    success: function (response) {
      idPeriodico = response;
    }
  });
}
const actualizarNota = (idNota) =>{
  $.ajax({
    url: "../php/servicios/updateEstadoNota.php",
    type: "POST",
    data: {id: idNota},
    success: function (response) {
      
    }
  });
}
const addNotaPeriodico = (idNota) =>{
  $.ajax({
    url: "../php/servicios/addNotasPeriodico.php",
    type: "POST",
    data: {id: idNota, idPeriodico: idPeriodico},
    success: function (response) {
      
    }
  });
}

$("#btn-agregar-notas").click(function(){
  $("#body-periodico-anadir").html(" ");
  Object.values(notas).forEach(items => {
    actualizarNota(items.id);
    addNotaPeriodico(items.id);
  });

  extraerNotas();
  notas = {};
});

$("#btn-actualizar-notas").click(function(){
  extraerNotas();
});