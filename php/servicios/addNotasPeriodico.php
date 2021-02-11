<?php
  include("../_conexion.php");

  $idNota = $_POST['id'];
  $idPeriodico = $_POST['idPeriodico'];

  $sql = "INSERT INTO periodico_detalles(idPeriodico, idNota) VALUES ($idPeriodico, $idNota)";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";