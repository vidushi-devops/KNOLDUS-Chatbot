<?php

$host = "mysql-service";
$user = "root";
$pass = '';

//$db = "chat";

$con= mysqli_connect($host,$user,$pass,$db);

if(! $con)
{
	print("Not Connected");

}
else
{
	echo("Connected");
}

?>
