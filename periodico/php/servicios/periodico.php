<?php
  include("../_conexion.php");

  $date = $_POST['date'];
  $sql = "INSERT INTO periodico (fecha) 
    SELECT '$date' 
    FROM periodico 
    WHERE NOT EXISTS (SELECT id FROM periodico WHERE fecha = '$date') 
    LIMIT 1";

  mysqli_query($con, $sql);

  $sql = "SELECT * FROM periodico WHERE fecha = '$date'";
  $resultado = mysqli_query($con, $sql);
  
  $row = mysqli_fetch_array($resultado);
  echo $row['id'];
  mysqli_close($con);

 


