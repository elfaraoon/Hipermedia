<?php
$host = 'kisbel.myuniversalcompany.com';
$user = 'admin_kisbel';
$pass = 'Kisbel5953**';
$db   = 'hipermedia1';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("❌ Error de conexión: " . $conn->connect_error);
}
echo "✅ ¡Conexión exitosa a la base de datos!";
$conn->close();
