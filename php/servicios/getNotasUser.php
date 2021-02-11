<?php
  include("../_conexion.php");

  $response = new stdClass();
  $datos = [];
  $idUser = $_POST['id'];

  $sql = "SELECT n.id, n.titulo, n.descripcion, c.categoria, t.tipo, n.fecha FROM notas n, categorias c, tipo t WHERE n.idCategoria = c.id AND n.idTipo = t.id AND n.idEmpleado = $idUser";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "No hay registros";
    exit;
  }
  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->titulo = $row['titulo'];
    $obj->descripcion = $row['descripcion'];
    $obj->cat = $row['categoria'];
    $obj->tipo = $row['tipo'];
    $obj->date = $row['fecha'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);