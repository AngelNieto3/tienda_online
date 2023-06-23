<?php

session_start();

$servername = "tiendaonline.cqpzcejl6imp.us-east-2.rds.amazonaws.com";
$username = "admin";
$password = "Crash_09";
$dbname = "tienda_online";

$id = $_POST['id'];
$conn = mysqli_connect($servername, $username, $password, $dbname);

$cantidadG = "SELECT cantidad FROM peliculas WHERE id= $id;";
$ejctval = mysqli_query($conn, $cantidadG);
if ($ejctval->num_rows > 0) {
    // Obtener el dato
    $row = $ejctval->fetch_assoc();
    $dato = $row["cantidad"];
}
print $dato;

if($_SERVER['REQUEST_METHOD'] ==='POST'){
    require 'funciones.php';
    $cantidad = $_POST['cantidad'];

    if($cantidad > $dato){
        header('Location: carrito.php');
    }else{
        if(is_numeric($cantidad )){

            if(array_key_exists($id,$_SESSION['carrito']))
                actualizarPelicula($id,$cantidad);
        }
      
        header('Location: carrito.php');
    }
}
?>


 