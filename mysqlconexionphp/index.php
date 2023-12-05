<?php

include_once('proyectobd.php');   // Incluye el archivo proyectobd.php dentro de este
$proyectobd = new Proyectobd(); // Crea el objeto que tiene las funciones de conexión a MySQL
$mysqli = $proyectobd->obten_conexion();    // Se obtiene la conexión

function tabla($resultado, $tabla_nombre, $tabla_descripcion)
{
    echo "<h2>Tabla {$tabla_nombre}</h2>";
    echo "<p>{$tabla_descripcion}</p>";
    $i = 0;
    echo '<table class="table table-sm table-striped table-bordered">';
    while ($fila = $resultado->fetch_assoc()) :    // Recorremos para ir fila x fila
        // Imprimimos los encabezados
        if ($i == 0) {
            echo "<thead><tr>";
            foreach (array_keys($fila) as $columna) {
                echo "<th>{$columna}</th>";
            }
            echo "</tr></thead><tbody>";
        }
        // Imprimimos los datos
        echo "<tr>";
        foreach ($fila as $dato) {
            echo "<td>{$dato}</td>";    // Se puede acceder también $fila["Id"]
        }
        echo "</tr>";
        $i++;
    endwhile;
    echo '</tbody></table>';
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultas SQL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="m-4">
    <?php    

    /*
    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "sentencia";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, 'Tabla nombre', 'Descripción');
    }
    */

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT alumno.matricula, alumno.nombre, alumno.paterno, alumno.materno, alumno.email, alumno.edad FROM alumno ORDER BY 3";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        /* ejecutar la sentencia */
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '1.', 'Listar los datos de los estudiantes de la base de datos ordenados alfabéticamente por apellido paterno (matrícula, nombre, paterno, materno, email, edad).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT alumno.nombre AS 'nombre alumno', alumno.paterno, alumno.materno, carrera.cod_carrera, carrera.nombre, materia.cod_materia, materia.nombre, materia.bloque, periodo.nombre AS periodo FROM alumno INNER JOIN alumno_oferta_academica ON alumno.matricula = alumno_oferta_academica.matricula INNER JOIN oferta_academica ON alumno_oferta_academica.nrc = oferta_academica.nrc INNER JOIN periodo ON oferta_academica.cod_periodo = periodo.cod_periodo INNER JOIN materia ON oferta_academica.cod_materia = materia.cod_materia INNER JOIN carrera ON carrera.cod_carrera = materia.cod_carrera";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '2.', 'Listar la información de todos los estudiantes de la base de datos, la carrera a la que pertenecen y las materias que han cursado (matrícula, nombre, paterno, materno, código de carrera, nombre de carrera, código de materia, nombre, bloque, periodo escolar).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT profesor.numero_personal, profesor.nombre, profesor.paterno, profesor.materno, profesor.email, grado_estudio.nombre 'grado estudios', carrera.nombre carrera, carrera.cod_carrera, materia.cod_materia, materia.nombre materia, materia.bloque, periodo.nombre periodo FROM oferta_academica INNER JOIN profesor ON oferta_academica.numero_personal = profesor.numero_personal INNER JOIN grado_estudio ON profesor.cod_grado_estudio = grado_estudio.cod_grado_estudio INNER JOIN materia ON oferta_academica.cod_materia = materia.cod_materia INNER JOIN carrera ON materia.cod_carrera = carrera.cod_carrera INNER JOIN periodo ON periodo.cod_periodo = oferta_academica.cod_periodo ORDER BY 3";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '3.', 'Listar los datos de los profesores y las materias que han impartido ordenados alfabéticamente por apellido paterno (número de personal, nombre completo, email, grado máximo de estudios, nombre de carrera, código de materia, nombre, bloque, periodo escolar).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT cod_materia, materia.nombre, bloque, carrera.nombre carrera, area.nombre área FROM materia INNER JOIN area ON area.cod_area = materia.cod_area INNER JOIN carrera ON carrera.cod_carrera = materia.cod_carrera ORDER BY 5, 2";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '4.', 'Listar todas las materias ordenadas por área de formación y nombre de materia (código de materia, nombre, bloque, nombre de carrera, área de formación).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT cod_materia, materia.nombre, bloque, carrera.nombre carrera FROM materia INNER JOIN carrera ON carrera.cod_carrera = materia.cod_carrera WHERE bloque = 3";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '5.', 'Listar solo las materias que se imparten en el tercer bloque (código de materia, nombre, bloque, nombre de carrera).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT cod_materia, materia.nombre, bloque, area.nombre área, carrera.nombre carrera FROM materia INNER JOIN area ON area.cod_area = materia.cod_area INNER JOIN carrera ON carrera.cod_carrera = materia.cod_carrera WHERE area.cod_area = 1";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '6.', 'DListar todas las materias del área de formación básica general (código de materia, nombre, bloque, área de formación, nombre de carrera).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT cod_materia, materia.nombre, bloque, area.nombre área, carrera.nombre carrera FROM materia INNER JOIN area ON area.cod_area = materia.cod_area INNER JOIN carrera ON carrera.cod_carrera = materia.cod_carrera WHERE area.cod_area = 4 OR area.cod_area = 5";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '7.', 'Listar solo las materias de las áreas de formación terminal y elección libre (código de materia, nombre, bloque, área de formación, nombre de carrera).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT alumno.matricula, alumno.nombre, alumno.paterno, alumno.materno, carrera.nombre carrera, materia.cod_materia, materia.nombre materia, periodo.nombre periodo, alumno_oferta_academica.calificacion FROM alumno INNER JOIN alumno_oferta_academica ON alumno.matricula = alumno_oferta_academica.matricula INNER JOIN oferta_academica ON alumno_oferta_academica.nrc = oferta_academica.nrc INNER JOIN periodo ON oferta_academica.cod_periodo = periodo.cod_periodo INNER JOIN materia ON oferta_academica.cod_materia = materia.cod_materia INNER JOIN carrera ON carrera.cod_carrera = materia.cod_carrera WHERE alumno_oferta_academica.calificacion < 6";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '8.', 'Listar todos los estudiantes que hayan reprobado materias en cualquier periodo escolar (matrícula, nombre, paterno, materno, nombre de carrera, código de materia, nombre, periodo, calificación).');
    }

    $resultado = null;  // Guarda el resultado de la consulta
    $consulta = "SELECT alumno.nombre, alumno.paterno, alumno.materno, alumno.matricula, profesor.numero_personal, CONCAT_WS(' ', profesor.nombre, profesor.paterno, profesor.materno) 'nombre profesor', carrera.nombre carrera, materia.nombre materia, materia.bloque, periodo.nombre periodo, alumno_oferta_academica.calificacion FROM alumno INNER JOIN alumno_oferta_academica ON alumno.matricula = alumno_oferta_academica.matricula INNER JOIN oferta_academica ON alumno_oferta_academica.nrc = oferta_academica.nrc INNER JOIN periodo ON oferta_academica.cod_periodo = periodo.cod_periodo INNER JOIN profesor ON oferta_academica.numero_personal = profesor.numero_personal INNER JOIN materia ON oferta_academica.cod_materia = materia.cod_materia INNER JOIN carrera ON carrera.cod_carrera = materia.cod_carrera";
    // Creamos la consulta
    if ($sentencia = $mysqli->prepare($consulta)) {

        // ejecutar la sentencia
        $sentencia->execute();

        // Aqui queda el resultado
        $resultado = $sentencia->get_result();
        $sentencia->close();

        // Se envia el resultado de la consulta a la funcion para su impresión
        tabla($resultado, '9.', 'Listar todos los estudiantes y las calificaciones que han obtenido en cada materia y el profesor que impartió esa materia (nombre, apellido paterno, materno, matrícula, número de personal del profesor, nombre del profesor, nombre de carrera, nombre de la materia, bloque, periodo escolar, calificación).');
    }

    ?>
</body>

</html>