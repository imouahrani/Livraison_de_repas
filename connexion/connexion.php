<?php

	$host = "localhost";
	$username = "root" ;
	$password = "";
	$db = "ubereat";
	
	$con = mysqli_connect($host, $username, $password, $db);
	
	if($con == false)
	{
		echo "connexion non etablie<br/>";
		die (mysqli_error($con));
	}
	
	
	

?>
