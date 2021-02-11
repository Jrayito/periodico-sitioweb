<?php
    include("../_conexion.php");

    $id = $_POST['id'];
    $response = new stdClass();
    $datos = [];

    $sql = "SELECT n.imagen, n.descripcion, n.titulo, t.tipo, e.nombre, e.apellidos, n.fecha FROM notas n, tipo t, empleados e WHERE n.id = $id and n.idTipo = t.id AND e.id = n.idEmpleado";
    $resultado = mysqli_query($con, $sql);

    if(!$resultado){
        echo "400";
        exit;
    }

    while($row = mysqli_fetch_array($resultado)){
        $obj = new stdClass();
        $obj->imagen = $row['imagen'];
        $obj->descripcion = $row['descripcion'];
        $obj->titulo = $row['titulo'];
        $obj->tipo = $row['tipo'];
        $obj->nombre = $row['nombre'];
        $obj->apellidos = $row['apellidos'];
        $obj->fecha = $row['fecha'];
        $datos[0] = $obj;
    }

    $response -> data = $datos;
    mysqli_close($con);
    echo json_encode($response);