
$("#btn_iniciar").click(function(){
  let infoLogin = {
    email: $("#user").val(),
    password: $("#pass").val()
  }

  $.ajax({
    url: "../php/servicios/getEmpleado.php",
    type: "POST",
    data: infoLogin,
    success: function (response) {
      data = JSON.parse(response);
      console.log(data);
      if (data.data[0].id != 1000) {
        if (data.data[0].puesto == "Periodista") {
          localStorage.setItem("user", response);
          location.href = "empleado.htm";
        } else if (data.data[0].puesto == "Editor"){
          localStorage.setItem("user", response);
          location.href = "editor.htm";
        }else if(data.data[0].puesto == "Recursos Humanos"){
          localStorage.setItem("user", response);
          location.href = "rh.html";
        }
      } else {
        alert("Usuario no encontrado");
      }
    }
  });
});

