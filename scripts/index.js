getNotas();
function getNotas() {
  $.ajax({
    url: "php/servicios/getNotasIndex.php",
    type: "POST",
    data: {},
    success: function (response) {
      let data = JSON.parse(response);
      pintarPrincipal(data);
      pintarNotas(data);
      console.log(data);
    }
  });
}

const pintarPrincipal = data => {
  $("#item-principal").html(" ");
  let html = "";
  html += "<div class='card horizontal'>" +
            "<div class='card-image'>" +
              "<img src='recursos/"+data.data[0].imagen+"' class='img-responsive'>" +
            "</div>" +
            "<div class='card-stacked'>" +
              "<div class='card-content'>" +
                "<h4><b>"+data.data[0].titulo+"</b></h4>" +
                "<p>"+data.data[0].tipo+"</p>" +
                "</div>" +
              "<div class='card-action'>" +
                "<button class='btn blue' data-id='"+data.data[0].id+"'>Leer más</button>" +
              " </div>" +
            "</div>" +
          "</div>";
    $("#item-principal").html(html);
    addEvent()
}

const pintarNotas = data =>{
  $("#item").html(" ");
  let html = " ";
  for (let index = 1; index < data.data.length; index++) {
    html += "<div class='col s3'>"+
   " <div class='card'>"+
      "<div class='card-image'>"+
        "<img src='recursos/"+data.data[index].imagen+"' class='img-responsive'>"+
      "</div>"+
      "<div class='card-content'>"+
        "<span class='card-title'>"+data.data[index].tipo+"</span>"+
        "<p>"+data.data[index].titulo+"</p>"+
      "</div>"+
      "<div class='card-action'>"+
        "<button class='btn blue'data-id='"+data.data[index].id+"'>Leer más</button>"+
      "</div>"+
    "</div>"+
  "</div>";
  }
  $("#item").html(html);
  addEvent()
}

function addEvent(){
  $(".btn").on('click', function(e){
    e.stopImmediatePropagation();
    let idNota = $(this).attr('data-id');
    location.href = "paginas/nota.htm?nota="+idNota;
  }); 
}