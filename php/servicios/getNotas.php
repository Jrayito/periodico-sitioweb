<?php
  include ("../_conexion.php");

  $response = new stdClass();
  $datos = [];

  $sql = "SELECT n.id, c.categoria, t.tipo, n.titulo FROM notas n, categorias c, tipo t WHERE n.idCategoria = c.id AND t.id = n.idTipo AND n.estado = 0";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "Consulta no realizada";
    exit;
  }

  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->categoria = $row['categoria'];
    $obj->tipo = $row['tipo'];
    $obj->titulo = $row['titulo'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);