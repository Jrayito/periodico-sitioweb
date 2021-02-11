<?php 
  include ("../_conexion.php");
  $response = new stdClass();
  $info = [];

  $key = $_POST['key'];

  $sql = "SELECT n.id, c.categoria, t.tipo, n.titulo FROM notas n, categorias c, tipo t WHERE n.idCategoria = c.id AND t.id = n.idTipo AND n.estado = 0 AND n.titulo LIKE '%$key%'";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->titulo = $row['titulo'];
    $obj->categoria = $row['categoria'];
    $obj->tipo = $row['tipo'];
    $info[$i] = $obj;
    $i++;
  }

  $response -> data = $info;
  mysqli_close($con);
  echo json_encode($response);
