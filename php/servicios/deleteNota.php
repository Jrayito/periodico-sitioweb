<?php
  include("../_conexion.php");

  $id = $_POST['id'];

  $sql = "DELETE FROM notas WHERE id = $id";
  $resultado = mysqli_query($con, $sql);
  if(!$resultado){
    echo "No se elimino la nota";
    exit;
  }

  echo "Nota eliminada";