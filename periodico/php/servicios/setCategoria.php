<?php  
  include("../_conexion.php");

  $cat = $_POST['cat'];

  $sql = "INSERT INTO categorias(categoria) VALUES ('$cat')";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  mysqli_close($con);
  echo "200";