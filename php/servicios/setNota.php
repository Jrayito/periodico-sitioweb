<?php

  include ("../_conexion.php");

  $id = $_POST['hidden'];
  $imagen = $_FILES['file'];
  $titulo = $_POST['title-nota'];
  $categoria = $_POST['opcion-cat'];
  $tipo = $_POST['option-tipo'];
  $fecha = $_POST['fecha'];
  $descripcion = $_POST['txt-descripcion'];

  if($imagen['type'] == "image/jpg" or $imagen['type'] == "image/jpeg"){
    $nom_enc = md5($imagen['tmp_name']).".jpg";
    $ruta = "../../recursos/".$nom_enc;
    move_uploaded_file($imagen['tmp_name'], $ruta);
    $sql = "INSERT INTO notas (id,idEmpleado,idCategoria,idTipo,imagen,titulo,descripcion,fecha, estado) 
      VALUES (null, $id, $categoria, $tipo, '$nom_enc', '$titulo', '$descripcion', '$fecha', 0)";

    $resultado = mysqli_query($con, $sql);
    if(!$resultado){
      echo "insert no realizado";
      exit;
    }
    echo "Insersión valida";
  }else{
    echo "Seleccionar una imagen";
  }