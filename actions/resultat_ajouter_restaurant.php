<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<link rel="stylesheet" type="text/css" href="style_resultat_ajoue_restaurant.css"/>
		<title></title>
		 
		
		
		
		
	</head>
	<?php

	$host = "localhost";
	$user = "root" ;
	$pass = "";
	$bd = "ubereat";
	$objet = new mysqli( $host, $user, $pass, $bd);
	
	if ($objet->connect_errno) 
	{
    	echo "Echec lors de la connexion à MySQL : " . $mysqli->connect_error;
	}

	if( isset($_POST["ajouter"]) )
	{
		$nomRES = $_POST['nomRES'];
		$nomPROP = $_POST['nomPROP'];
		$prenomPROP = $_POST['prenomPROP'];
		$rue = $_POST['rue'];
		$ville = $_POST['ville'];
		$telephone = $_POST['telephone'];
		
		if($nomRES == "" || $nomPROP == "" || $prenomPROP == "" || $rue == "" || $ville == "" || $telephone == "" )
		{
			echo "vous n'avez pas rempli toutes les cases " ;
			die ();
		}
		
		//$sql = "INSERT INTO client(NOM_CLIENT, PRENOM_CLIENT, RUE_CLIENT, VILLE_CLIENT, NUM_TEL_CLIENT, USERNAME_CLIENT, PASSWORD_CLIENT) VALUES('" . $nom . "', '" . $prenom . "', '" . $rue . "', '" . $ville . "', '" . $telephone . "', '" . $username . "', '" . $password . "')";
		
		$sql = "INSERT INTO restaurant(NOM_RESTO, NOM_PROP, PRENOM_PROP, RUE_RESTO, VILLE_RESTO, NUM_TEL_RESTO ) VALUES('$nomRES', '$nomPROP', '$prenomPROP', '$rue', '$ville', '$telephone' )";
		
		$res = mysqli_query($objet, $sql);
		
		if( !$res )
		{
			die(mysqli_error($objet));
		}
		echo "<p class = 'resultat_ajoue_resto'> $nomRES est bien ajouter dans la base de donnee</p>";
	}
	

?>




	<body>
	</body>
</html>
