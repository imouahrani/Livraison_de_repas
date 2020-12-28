<?php

	require "../connexion/connexion.php";


	if( isset($_POST['livreur_register']) )
	{
		$nom = $_POST['nom'];
		$prenom = $_POST['prenom'];
		$rue = $_POST['rue'];
		$ville = $_POST['ville'];
		$username = $_POST['username'];
		$password = $_POST['password'];
		$telephone = $_POST['telephone'];
		
		
		if($nom == "" || $prenom == "" || $username == "" || $rue == "" || $ville == "" || $password == "" || $telephone == "" )
		{
			echo "vous n'avez pas rempli toutes les cases " ;
			die();
		}
		
		$idaq = ' SELECT * from acceuil where VILLE_ACCEUIL = "' . $ville . '" ';
		$res = mysqli_query($con, $idaq);
		
	
		if( !$res ) 
		{
			die( mysqli_error( 'hgjghgkg'));
		}
	
		if( ($count = mysqli_num_rows( $res )) < 1 )
		{
			echo " il y a pas d'agence dans votre ville :(";
			die();
		}
			
		$line = mysqli_fetch_array( $res );
		$sql = "INSERT INTO livreur( ID_ACCEUIL, NOM_LIVREUR, PRENOM_LIVREUR, RUE_LIVREUR, VILLE_LIVREUR, NUM_TEL_LIVREUR, USERNAME_LIVREUR, PASSWORD_LIVREUR) VALUES($line[ID_ACCEUIL], '$nom', '$prenom', '$rue', '$ville', '$telephone', '$username', '$password')";
		
		$res = mysqli_query($con, $sql);	
		if( !($res) )
		{
			echo "error";
			die(mysqli_error($con));
		}
			
			
		echo "bienvenue :) $prenom $nom" ;
			
		
	}
		
		
		
	
	

?>
