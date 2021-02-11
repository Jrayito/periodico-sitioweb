<?php

  include("../_conexion.php");
  $response = new stdClass();
  $datosInfo = [];

  $email = $_POST['email'];
  $password =  $_POST['password'];


  $sql = "SELECT * FROM usuarios WHERE user = '$email' AND password = '$password'";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "0";
    exit;
  }

  $dato = mysqli_fetch_row($resultado);
  /*$obj = new stdClass();
  $obj->id = $dato[0];
  $obj->nombre = $dato[3];
  $obj->apellidos = $dato[4];*/
$obj = new stdClass();
  if(isset($dato[0])){
    $obj->id = $dato[0];
    $obj->nombre = $dato[3];
    $obj->apellidos = $dato[4];
    $datosInfo[0] = $obj;
  }else{ 
    $obj->id = 1000;
    $datosInfo[0] = $obj;
  }

  $response-> data = $datosInfo;
  mysqli_close($con);
  echo json_encode($response);