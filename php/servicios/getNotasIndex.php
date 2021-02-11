<?php
  include ("../_conexion.php");

  $response = new stdClass();
  $datos = [];

  $sql = "SELECT n.id, n.imagen, n.titulo, t.tipo FROM notas n, tipo t WHERE n.idTipo = t.id AND n.estado = 1 ORDER BY n.id DESC";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "Consulta no realizada";
    exit;
  }

  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->imagen = $row['imagen'];
    $obj->titulo = $row['titulo'];
    $obj->tipo = $row['tipo'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);
