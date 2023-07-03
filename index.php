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
    <link rel="stylesheet" href="../prueba/style.css">
    <style>
        
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
