<?php
  include("../_conexion.php");

  //$imagen = $_FILES['file'];
  $titulo = $_POST['title-nota'];
  $categoria = $_POST['opcion-cat'];
  $tipo = $_POST['option-tipo'];
  $descripcion = $_POST['txt-descripcion'];
  //$descripcion = $_POST['txt-descripcion'];
  $id = $_POST['hidden'];

  $sql = "UPDATE notas SET titulo= '$titulo' ,descripcion= '$descripcion', idCategoria = '$categoria', idTipo = '$tipo' WHERE id = $id";

    $resultado = mysqli_query($con, $sql);
    if(!$resultado){
      echo "Actualización no realizada";
      exit;
    }

    echo "Actualización realizada";
