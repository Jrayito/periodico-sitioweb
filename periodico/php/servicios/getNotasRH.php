
<?php
  include("../_conexion.php");

  $response = new stdClass();
  $datos = [];

  $id = $_POST['id'];

  $sql = "SELECT n.id, n.titulo FROM notas n, periodico_detalles p WHERE p.idPeriodico = $id AND n.id = p.idNota";
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
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);