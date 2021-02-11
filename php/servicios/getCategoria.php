<?php 

  include ("../_conexion.php");
  $response = new stdClass();
  $info = [];
  $sql = "SELECT * FROM categorias";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "No se puede ejecutar la consulta";
    exit;
  }
  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->nombre = $row['categoria'];

    $info[$i] = $obj;
    $i++;
  }

  $response -> data = $info;
  mysqli_close($con);

  echo json_encode($response);