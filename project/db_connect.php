<?php
$servername = "localhost"; // آدرس سرور
$username = ""; // نام کاربری MySQL
$password = ""; // رمز عبور
$dbname = "database"; // نام پایگاه داده

$conn = new mysqli($servername, $username, $password, $dbname);

// بررسی اتصال
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
