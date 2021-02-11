<?php

  include ("../_conexion.php");

  $nombre = $_POST['nombre'];
  $apellidos = $_POST['apellidos'];
  $email = $_POST['email'];
  $pass = $_POST['password'];


  //Consulta sql para guardar datos
  $sql = "INSERT INTO usuarios (user, password, nombre, apellidos) VALUES ('$email', '$pass', '$nombre', '$apellidos')";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo 'No se puede realizar el guardado';
    exit;
  }

  echo 1;