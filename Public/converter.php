<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Boostrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    <!--Pour utiliser les icônes Font Awesome  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    
    <!--Pour utiliser les Fonts google -->
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Source+Serif+Pro&display=swap" rel="stylesheet">

    <!--css-->
    <link rel ="stylesheet" href ="main.css">


    <title>Converter</title>


</head>

<body>
 
		
    
    <div class="container">
            <h1 class="card-title">Projet Convert</h1>
            <br><br>
            <div class="card-text">
            <h2 >CONVERTER PAGE</h2>

        <br><br>
            <div class="identifiant">
                <form  action=""   methode="post" ></form>
                
                    <div >
                        <label for="Temperature">Valeur en °C</label>
                        <input type="text" class="form-control"  name="Temperature" values="" placeholder="Entrez la valeur de la temperatuere en °C"autofocus required>
                    </div>
                    
    
            
                    <br><br>
                    
                    <div class="button">
                        <button type="submit" class="btn btn-primary">Valider</button>
                
                        <a href="converter.php" ><button type="submit" class="btn btn-secondary">Reset</button>
                    </div>

            
                   

                </form>
                
    
            </div>
           
    </div>

    <BR><BR>

        if()
        <div class="resultat">
            <p> le résultat est:</P>
        </div>  
        
        <BR><BR>
        <div class="error">
          
            <p> Attention à votre saisie, un nombre est attendu</P>
        </div> 
</body>
</html>