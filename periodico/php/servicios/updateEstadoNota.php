<?php
  include("../_conexion.php");

  $id = $_POST['id'];
  $sql = "UPDATE notas SET estado = 1 WHERE id = $id";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";