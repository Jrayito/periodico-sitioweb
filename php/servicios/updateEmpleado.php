<?php
  include("../_conexion.php");

  $id = $_POST['id'];
  $nombre = $_POST['nombre'];
  $ap = $_POST['ap'];
  $puesto = $_POST['puesto'];

  $sql = "UPDATE empleados SET nombre= '$nombre' ,apellidos= '$ap', puesto = '$puesto' WHERE id = $id";

    $resultado = mysqli_query($con, $sql);
    if(!$resultado){
      echo "400";
      exit;
    }

    echo "200";
