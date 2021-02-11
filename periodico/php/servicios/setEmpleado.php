<?php
  include("../_conexion.php");

  $nombre = $_POST['nombre'];
  $ap =  $_POST['ap'];
  $user =  $_POST['user'];
  $puesto =  $_POST['puesto'];
  $password = $_POST['password'];

  $sql = "INSERT INTO empleados (nombre, apellidos, puesto, user, password) 
    VALUES ('$nombre','$ap','$puesto','$user','$password')";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  mysqli_close($con);
  echo "200";
