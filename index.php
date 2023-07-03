<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/3B TIDSM/prueba/catalogo.php">

    <style>
        body{
            background-color: #62f28b;
        }
        #banner {
            background-image: url("/3B TIDSM/css/img/abstract-black-and-neon-green-modern-material-header-metallic-technology-banner-abstract-widescreen-background-vector.jpg");
            background-size: cover;
            background-position: center;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 9999;
        }
        #banner h1 {
            font-family: Arial, sans-serif;
            font-size: 24px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
        }
        #banner2 {
            background-color: rgb(49, 49, 49);
            color: green;
            height: 55px;
        }
        #banner2 a {
            font-family: Arial, sans-serif;
            font-size: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
            color: #00FF00;
        }
        #banner2 ul li a:hover {
            background-color: #00FF00;
            color: #000;
            font-family: Arial, sans-serif;
            font-size: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
        }

        .carousel {
        position: relative;
        width: 100%;
        height: 400px;

        }
      
        .carousel-inner {
        width: 100%;
        height: 100%;
        display: flex;
        transition: transform 0.3s ease-in-out;
        }
      
        .carousel-item {
        flex-shrink: 0;
        width: 100%;
        height: 100%;
        }
      
        .carousel-item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        }
      
        .carousel-control {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 50px;
        height: 50px;
        background-color: rgba(0, 0, 0, 0.5);
        border-radius: 50%;
        cursor: pointer;
        z-index: 1;
        }     
        .carousel-control:before {
        content: "";
        display: block;
        width: 20px;
        height: 20px;
        background-color: transparent;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        border-radius: 50%;
        }
        h1 {
	    font-weight: bold;
	    margin: 0;
        font-size: 30px;
        }
        
        p {
	    font-size: 15px;
	    font-weight: 100;
	    line-height: 20px;
	    letter-spacing: 0.5px;
	    margin: 20px 0 30px;
        }
        span {
	    font-size: 10px;
        }

        button {
	    border-radius: 20px;
	    border: 1px solid #ffffff;
	    background-color: #5df238;
	    color: #FFFFFF;
	    font-size: 12px;
	    font-weight: bold;
	    padding: 12px 45px;
	    letter-spacing: 1px;
	    text-transform: uppercase;
	    transition: transform 80ms ease-in;
        }
        h2{
            text-align: center;
        }

        button:active {
	    transform: scale(0.95);
        }

        button:focus {
	    outline: none;
        }

        button.ghost {
	    background-color: rgb(27, 27, 27);
	    border-color: #10401a;
	
        }

        .form {
	    background-color: #FFFFFF;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-direction: column;
	    padding: 0 50px;
	    height: 100%;
	    text-align: center;
        }

        input {
	    background-color: #eee;
	    border: none;
	    padding: 12px 15px;
	    margin: 8px 0;
	    width: 100%;
        }

        .container {
	    background-color: #ffffff;
	    border-radius: 10px;
  	    box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	    position: relative;
	    overflow: hidden;
	    width: 768px;
	    max-width: 100%;
	    min-height: 505px;
	    background-image: url();
        }

        .form-container {
	    position: absolute;
	    top: 0;
	    height: 100%;
	    transition: all 0.6s ease-in-out;
        }

        .sign-in-container {
	    left: 0;
	    width: 50%;
	    z-index: 2;
        }

        .container.right-panel-active .sign-in-container {
	    transform: translateX(100%);
        }

        .sign-up-container {
	    left: 0;
	    width: 50%;
	    opacity: 0;
	    z-index: 1;
        }

        .container.right-panel-active .sign-up-container {
	    transform: translateX(100%);
	    opacity: 1;
	    z-index: 5;
	    animation: show 0.6s;
        }

        @keyframes show {
        	0%, 49.99% {
	        opacity: 0;
	        z-index: 1;
	        }
	
        	50%, 100% {
    		opacity: 1;
    		z-index: 5;
        	}
        }

        .overlay-container {
	    position: absolute;
	    top: 0;
	    left: 50%;
	    width: 50%;
	    height: 100%;
	    overflow: hidden;
	    transition: transform 0.6s ease-in-out;
	    z-index: 100;
        }

        .container.right-panel-active .overlay-container{
	        transform: translateX(-100%);
        }

        .overlay {
	    background: #2cd472;
	    background: -webkit-linear-gradient(to right, #11ff00, #d16120);
	    background: linear-gradient(to right, #2a2a2a, #00ff51);
	    background-repeat: no-repeat;
	    background-size: cover;
	    background-position: 0 0;
	    color: #fcfcfc;
	    position: relative;
	    left: -100%;
	    height: 100%;
	    width: 200%;
  	    transform: translateX(0);
	    transition: transform 0.6s ease-in-out;
        }

        .container.right-panel-active .overlay {
    	transform: translateX(50%);
        }

        .overlay-panel {
    	position: absolute;
       	display: flex;
    	align-items: center;
    	justify-content: center;
    	flex-direction: column;
    	padding: 0 35px;
    	text-align: center;
    	top: 0;
    	height: 100%;
    	width: 50%;
    	transform: translateX(0);
    	transition: transform 0.6s ease-in-out;
        }

        .overlay-left {
    	transform: translateX(-20%);
        }

        .container.right-panel-active .overlay-left {
    	transform: translateX(0);
        }

        .overlay-right {
    	right: 0;
    	transform: translateX(0);
        }

        .container.right-panel-active .overlay-right {
    	transform: translateX(20%);
        }

        .social-container {
    	margin: 15px 0;
        }

        .social-container a {
	    border: 1px solid #DDDDDD;
	    border-radius: 50%;
    	display: inline-flex;
    	justify-content: center;
    	align-items: center;
    	margin: 0 5px;
    	height: 40px;
    	width: 40px;
        }
    </style>
    <title>Document</title>
</head>
<body>
    <div id="banner">
        <h1>Bienvenido a TecnoWeb</h1>
    </div>
    <br>
    <div id="banner2" class="p-2">
        <ul class="nav justify-content-around navbar-expand-sm">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#tab1" >Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab2" >Catalogo</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab3" >Cotizaciones</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab4" >Citas</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab6" >Iniciar Sesion</a>
            </li>
        </ul>
    </div>
    <div class="tab-content">
        <div id="tab1" class=" tab-pane active">
            <div id="carouselExampleFade" class="carousel slide carousel-fade">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/3B TIDSM/css/img/iPhone-14-Pro-va-Pro-Max-se-tang-gia-ban.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="/3B TIDSM/css/img/Colores-del-Galaxy-S23-Ultra.webp" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="..." class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
        </div>
        <div id="tab2" class=" tab-pane fade"><br>
        <form action="catalogo.php" method="post">
    <label for="categoria">Categoria:</label>
    <select name="categorias" id="categoria" style="width: 100px;">
        <?php foreach ($categorias as $categoria): ?>
            <option value="<?php echo $categoria; ?>"><?php echo $categoria; ?></option>
        <?php endforeach; ?>
    </select>
    <br>
    <br>
    <input type="submit" value="Enviar">
</form>
        </div>
        <div id="tab3" class=" tab-pane fade"><br>
        </div>
        <div id="tab4" class=" tab-pane fade"><br>
            
        </div>
        <div id="tab6" class="container tab-pane fade"><br>
            <h2>Formulario de Inicio de Sesión y Registro</h2>
            <div class="container" id="container">
                <div class="form-container sign-up-container">
                <form action="iniciosesion2.php" method="post" autocomplete="off" class="form">
                    <h1>Crear una cuenta</h1>
                    <div class="social-container"></div>
                    <span>O use su correo electrónico para registrarse</span>
                    <input type="text" placeholder="Nombre" name="nombre">
                    <input type="text" placeholder="Apellido" name="apellido">
                    <input type="number" placeholder="Edad" name="edad">
                    <label for="genero">Género:</label>
                    <select name="genero" id="genero">
                        <option value="M">Masculino</option>
                        <option value="F">Femenino</option>
                    </select>
                    <input type="text" placeholder="Teléfono" name="telefono">
                    <input type="email" placeholder="Email" name="email">
                    <input type="password" placeholder="Password" name="password">
                    <button>Registrarse</button>
                </form>
                </div>
                <div class="form-container sign-in-container">
                    <form action="iniciosesion.php" method="post" class="form">
                        <h1>Iniciar sesión</h1>
                        <div class="social-container">
                        </div>
                        <input  type="email" placeholder="Email" name="correo" id="correo"/>
                        <input type="password" placeholder="Password" name="password" id="password"/>
                        <a href="">¿Olvidaste tu contraseña?</a>
                        <button>Iniciar Sesión</button>
                    </form>
                </div>
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-panel overlay-left">
                            <h1>Bienvenido de nuevo!</h1>
                            <p>Para mantenerse conectado con nosotros, inicie sesión con su información personal.</p>
                            <button class="ghost" id="signIn">Inicia Sesión</button>
                        </div>
                        <div class="overlay-panel overlay-right">
                            <h1>Bienvenidos</h1>
                            <p>Ingresa tus datos personales y comienza tu viaje con nosotros</p>
                            <button class="ghost" id="signUp">Registrate</button>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>

        </div>
    </div>
    <script src="/3B TIDSM/BOOSTRAP/js/bootstrap.min.js"></script>
    <script src="/3B TIDSM//prueba/main.js"></script>
</body>
</html>
