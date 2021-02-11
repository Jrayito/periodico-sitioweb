<?php
  include("../_conexion.php");

  $response = new stdClass();
  $info = [];

  $key = $_POST['buscar'];

  $sql = "SELECT * FROM empleados WHERE nombre LIKE '%$key%' OR apellidos like '%$key%' OR puesto like '%$key%'";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  //$row = mysqli_fetch_array($resultado);
  //if(isset($row['nombre']) || isset($row['apellidos']) || isset($row['puesto'])){
    $i = 0;
    while($row = mysqli_fetch_array($resultado)){
        $obj = new stdClass();
        $obj->id = $row['id'];
        $obj->nombre = $row['nombre'];
        $obj->apellidos = $row['apellidos'];
        $obj->puesto = $row['puesto'];
        $info[$i] = $obj;
        $i++;
    }
    $response-> informacion = $info;
    mysqli_close($con);
    echo json_encode($response);
  