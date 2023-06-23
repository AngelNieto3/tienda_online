<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

session_start();

if($_SERVER['REQUEST_METHOD'] ==='POST'){

    require 'funciones.php';
    require 'vendor/autoload.php';

    if(isset($_SESSION['carrito']) && !empty($_SESSION['carrito'])){
        $cliente = new Kawschool\Cliente;
    
        $_params = array(
            'nombre' => $_POST['nombre'],
            'apellidos' => $_POST['apellidos'],
            'email' => $_POST['email'],
            'telefono' => $_POST['telefono'],
            'comentario' => $_POST['comentario']
        );
    
        $cliente_id = $cliente->registrar($_params);
    
        $pedido = new Kawschool\Pedido;
    
        $_params = array(
            'cliente_id'=>$cliente_id,
            'total' => calcularTotal(),
            'fecha' => date('Y-m-d')
        );
        
        $pedido_id =  $pedido->registrar($_params);
        echo ($pedido_id);

        foreach($_SESSION['carrito'] as $indice => $value){
            $_params = array(
                "pedido_id" => $pedido_id,
                "pelicula_id" => $value['id'],
                "precio" => $value['precio'],
                "cantidad" => $value['cantidad'],
            );

            $pedido->registrarDetalle($_params);
        }


        $_SESSION['carrito'] = array();

        /*______________________Intento de estructurar correo________________________ */
        $id = $pedido_id;
        $pedido = new Kawschool\Pedido;

        $info_pedido = $pedido->mostrarPorId($id);

        $info_detalle_pedido = $pedido->mostrarDetallePorIdPedido($id);


        $asunto =  "factura de pago";

        $mensaje = "Pedido a nombre de ".$info_pedido['nombre']." ". $info_pedido['apellidos']."<br>Con un total de ".$info_pedido['total'];

        $mensaje2 = '<html>
        <head>
            <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                }
                th, td {
                    padding: 8px;
                    text-align: left;
                    border-bottom: 1px solid #ddd;
                }
                th {
                    background-color: #f2f2f2;
                }
            </style>
        </head>
        <body>
            <h2>Factura de Pedido a nombre de '.$info_pedido['nombre'].' '.$info_pedido['apellidos'].'</h2>
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Titulo</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>';

        $cantidad = count($info_detalle_pedido);
        if($cantidad > 0){
          $c=0;
        for($x =0; $x < $cantidad; $x++){
            $c++;
            $item = $info_detalle_pedido[$x];
            $total = $item['precio'] * $item['cantidad'];
            $tit = $item ['titulo'];
            $prec = $item ['precio'];
            $cant = $item ['cantidad'];
            $mensaje2.= '<tr>
            <td>'.$c.'</td>
            <td>'.$tit.'</td>
            <td>'.$prec.'</td>
            <td>'.$cant.'</td>
            <td>'.$total.'</td></tr>';
        }
    }
        $mensaje2 .= '</tbody></table><br>
        <h4>Total a Pagar $'.$info_pedido["total"].'</h4>';
          $correo =  $info_pedido['email'];
        echo $mensaje2;

        /* _________________________para enviar el correo___________________________*/

        
        require "./PHPMailer-master/src/Exception.php";
        require "./PHPMailer-master/src/SMTP.php";
        require "./PHPMailer-master/src/PHPMailer.php";

        //Create an instance; passing `true` enables exceptions
        $mail = new PHPMailer(true);

        try {
            //Server settings
            //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'viewsfilmspeliculas@gmail.com';                     //SMTP username
            $mail->Password   = 'nbjlymlkwypjexhw';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
        
            //Recipients
            $mail->setFrom('viewsfilmspeliculas@gmail.com', 'Films Views');
            $mail->addAddress($correo);     //Add a recipient
        
            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = $asunto;
            $mail->Body    = $mensaje2;
        
            $mail->send();
            echo 'El correo se envio correctamente';
        } catch (Exception $e) {
            echo "Error: {$mail->ErrorInfo}";
        }


        header('Location: gracias.php');

    }
        

        

        
        
        
}