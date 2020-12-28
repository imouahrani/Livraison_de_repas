<?php

	require "../connexion/connexion.php";
	
	if( isset($_POST["client_register"]) )
	{
		$nom = $_POST['nom'];
		$prenom = $_POST['prenom'];
		$username = $_POST['username'];
		$rue = $_POST['rue'];
		$ville = $_POST['ville'];
		$password = $_POST['password'];
		$telephone = $_POST['telephone'];
		
		if($nom == "" || $prenom == "" || $username == "" || $rue == "" || $ville == "" || $password == "" || $telephone == "" )
		{
			echo "vous n'avez pas rempli toutes les cases " ;
			die ();
		}
		
		//$sql = "INSERT INTO client(NOM_CLIENT, PRENOM_CLIENT, RUE_CLIENT, VILLE_CLIENT, NUM_TEL_CLIENT, USERNAME_CLIENT, PASSWORD_CLIENT) VALUES('" . $nom . "', '" . $prenom . "', '" . $rue . "', '" . $ville . "', '" . $telephone . "', '" . $username . "', '" . $password . "')";
		
		$sql = "INSERT INTO client(NOM_CLIENT, PRENOM_CLIENT, RUE_CLIENT, VILLE_CLIENT, NUM_TEL_CLIENT, USERNAME_CLIENT, PASSWORD_CLIENT) VALUES('$nom', '$prenom', '$rue', '$ville', '$telephone', '$username', '$password')";
		
		$res = mysqli_query($con, $sql);
		
		if( !$res )
		{
			die(mysqli_error($con));
		}
	}
	else
	{
		header("location: http://localhost/projet/index.php");
		exit(0);
	}
	

?>
