
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="public/css/normalize.css">
    <link rel="stylesheet" href="public/css/styles_2.css">
     <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <script src="public/js/jquery.min.js"></script>       
    
   
    <title>{{page_title}}</title>
    <link rel="shortcut icon" href="public/imgs/logo_upnfm.png" type="image/x-icon">
    {{foreach css_ref}}
                <link rel="stylesheet" href="{{uri}}" />
            {{endfor css_ref}}
</head>
<body>
    <header class="header-dividido">
        
            <div class="lado-contenido lado">
                
                <a href="\">
                    <img src="public/imgs/letras_upnfm.png" alt="">
                </a>
                
            </div>
            
            <div class="lado lado-contenido2" style="justify-content: flex-end; padding-right: 3rem;">
                
                <nav>
                        {{foreach appmenu}}
                         <a href="index.php?page={{mdlprg}}">{{mdldsc}}</a>
                        {{endfor appmenu}}
                        <a href="index.php?page=logout">Cerrar Sesión</a>
                </nav>
            </div>
    </header>
    

    {{{page_content}}}
   
    

    <footer class="footer">
        <div class="contenedor-footer">
            <div class="final">
                <h2>Ubicación</h2>
                <p>Universidad Pedagógica Nacional Francisco Morazán</p>
                <p>Colonia el Dorado, Frente a Plaza Miraflores</p>

            </div>

            <div class="final">
                <a target="_blank" href="https://www.google.com/maps/@14.0758122,-87.18711,18z"><img class="ima"
                        src="public/imgs/direccion.png" alt="Dirección"></a>
                <div class="redes">
                    <div class="redes-hija">
                        <a target="_blank" href="https://www.facebook.com/"><img class="foo-ima"
                                src="public/imgs/logo-facebook-2.png" alt="Logo Facebook"></a>
                    </div>
                    <div class="redes-hija">
                        <a target="_blank" href="https://twitter.com/"><img class="foo-ima" src="public/imgs/logo-twitter-2.png"
                                alt="Logo Twitter"></a>
                    </div>
                    <div class="redes-hija">
                        <a target="_blank" href="https://web.telegram.org/"><img class="foo-ima"
                                src="public/imgs/logo-telegram-2.png" alt="Logo Telegram"></a>
                    </div>
                    <div class="redes-hija">
                        <a target="_blank" href="https://www.instagram.com/"><img class="foo-ima"
                                src="public/imgs/logo-instagram-2.png" alt="Logo Instagram"></a>
                    </div>
                </div>
            </div>

            <div class="final">
                <h2>Contactanos</h2>
                <p>Tel. 2239-8842 / 2235-8349 / 2239-8002 / 2235-6062</p>
                <p>Fax. 2231-1257</p>
            </div>
        </div>

        <p class="centro">Todos los derechos reservados &copy;</p>
    </footer>
     {{foreach js_ref}}
                <script src="{{uri}}"></script>
    {{endfor js_ref}}

    

</body>
</html>