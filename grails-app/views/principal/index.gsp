<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
%{--
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-121607475-1"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-HQJWN3ZDKR"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-HQJWN3ZDKR');
    </script>
--}%

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:link rel="icon" href="favicon.png" type="image/x-ico"/>
    <title>InfoLíderes</title>

    %{--    <g:layoutHead/>--}%

    <!-- Bootstrap core CSS -->
%{--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" />--}%
    <asset:stylesheet src="/merc/all.min.css"/>
    <asset:stylesheet src="/merc/bootstrap.min.css"/>
    <asset:stylesheet src="/slick/slick.css"/>
    <asset:stylesheet src="/slick/slick-theme.css"/>
    <asset:stylesheet src="/merc/magnific-popup.css"/>
    <asset:stylesheet src="/merc/templatemo-dream-pulse.css"/>
    <asset:javascript src="/apli/fontawesome.all.min.js"/>

    <asset:javascript src="/merc/jquery.min.js"/>
    <asset:javascript src="/merc/jquery.singlePageNav.min.js"/>
    <asset:javascript src="/merc/parallax.min.js"/>
    <asset:javascript src="/slick/slick.min.js"/>
    <asset:javascript src="/merc/jquery.magnific-popup.min.js"/>
    <asset:javascript src="/merc/templatemo-scripts.js"/>


    <style type="text/css">
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <nav id="tmSidebar" class="tm-bg-black-transparent tm-sidebar">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-sidebar-sticky">
                <div class="tm-brand-box">
                <a href= "${createLink(controller:'principal', action: 'index', id:1)}" style="text-decoration: none">
                    <div>
                        <asset:image src="apli/portada.png" style="padding: 10px; height: 200px; width: auto"/>
                    </div>
                </a>
                </div>

                <ul id="tmMainNav" class="nav flex-column text-uppercase text-right tm-main-nav">
                    <li class="nav-item">
                        <a href="#intro" class="nav-link active">
                            <span class="d-inline-block mr-3">Nuestro Objetivo</span>
                            <span class="d-inline-block tm-white-rect"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#about" class="nav-link">
                            <span class="d-inline-block mr-3">El Instituto</span>
                            <span class="d-inline-block tm-white-rect"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#work" class="nav-link">
                            <span class="d-inline-block mr-3">Work</span>
                            <span class="d-inline-block tm-white-rect"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#clients" class="nav-link">
                            <span class="d-inline-block mr-3">Clients</span>
                            <span class="d-inline-block tm-white-rect"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#talk" class="nav-link">
                            <span class="d-inline-block mr-3">Let's Talk</span>
                            <span class="d-inline-block tm-white-rect"></span>
                        </a>
                    </li>
                </ul>

                <div style="margin-bottom: 40px">
                    <a href="http://200.93.248.62:8008/moodle" class="btn btn-light" style="padding: 10px">
                        <i class="fas fa-3x fa-user-graduate"></i>&nbsp; Instituto Virtual
                    </a>
                </div>

                <ul class="nav flex-row tm-social-links">
                    <li class="nav-item">
                        <a href="https://facebook.com" class="nav-link tm-social-link">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://twitter.com" class="nav-link tm-social-link">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://dribbble.com" class="nav-link tm-social-link">
                            <i class="fab fa-dribbble"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://linkedin.com" class="nav-link tm-social-link">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </li>
                </ul>
                <footer class="text-center text-white small">
                    <p class="mb--0 mb-2">Copyright 2020 Dream Pulse</p>
                    <p class="mb-0">Design:
                        <a rel="nofollow" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                    </p>
                </footer>
            </div>
        </nav>

        <main role="main" class="ml-sm-auto col-12">
            <div
                    class="parallax-window"
                    data-parallax="scroll"
                    data-image-src="img/dream-pulse-header.jpg">
                <div class="tm-section-wrap">
                    <section id="intro" class="tm-section">
                        <div class="tm-bg-white-transparent tm-intro">
                            <h2 class="tm-section-title mb-5 text-uppercase tm-color-primary">Objetivos</h2>
                            <p class="tm-color-gray">
                                Ejecutar un programa de desarrollo de las capacidades de liderazgo de los dirigentes
                                y activistas de los movimientos sociales, colectivos y territorios, comprometidos
                                con la transformación democrática del país, en todos los niveles de gobierno.
                            </p>
                            <p class="tm-color-gray">
                                Estructurar el programa de desarrollo de capacidades como una red nacional de
                                cooperación y alianzas de liderazgos múltiples para incidir en políticas claves de
                                los distintos niveles de gobierno.
                            </p>
                            <p class="tm-color-gray">
                                Contribuir a la formación de un movimiento de las izquierdas, de nuevo tipo, amplia
                                implantación y diversidad, y sin capillas excluyentes o propietarios.
                            </p>
                        </div>
                    </section>
                </div>
            </div>

            <div class="tm-section-wrap bg-white">
                <section id="about" class="row tm-section">
                    <div class="col-xl-5">
                        <div class="tm-section-half">
                            <div><i class="fas fa-6x fa-balance-scale mb-5 tm-section-icon"></i></div>
                            <h2 class="tm-section-title tm-color-primary mb-5">Quienes Somos</h2>
                            <p class="mb-5">
                                When first section is scrolled up, BG image will be
                                disappeared with a parallax effect. Donec ac tempor tellus, a
                                eleifend ligula. Fusce vitae sem sed purus euismod
                                condimentum.
                            </p>
                            <p>
                                Sed at orci non metus tristique suscipit vitae in nibh. Sed
                                rutrum odio ac est hendrerit, at vestibulum felis condimentum.
                            </p>
                        </div>
                    </div>
                    <div class="col-xl-7">
                        <div class="tm-section-half">
                            <div><i class="far fa-6x fa-building mb-5 tm-section-icon" style="width: 100%"></i></div>
                            <h2 class="tm-section-title tm-color-primary mb-3" style="text-align: center">Ejes de Formación</h2>
                            Desafíos y visiones globales
                            <ul>
                            <li>
                                Grandes tendencias económicas, sociales y ambientales
                            </li>
                            <li>
                                Lecciones de las revoluciones políticas, y científico-tecnológicas
                            </li>
                            <li>
                                Grandes propuestas mundiales
                            </li>
                            <li>
                                Opciones de cambio y transformación
                            </li>
                            </ul>
                            Transformar el Ecuador
                            <ul>
                            <li>
                                Ecuador del Pasado-presente y del Presente-futuro
                            </li>
                            <li>
                                Liderazgos territoriales: Gobiernos descentralizados y gobierno central
                            </li>
                            <li>
                                Liderazgo por Causas y Derechos
                            </li>
                            <li>
                                Estrategias para la transformación
                            </li>
                            </ul>
                            Aprendiendo a cooperar y a vivir para construir cambios y visiones de cambio
                            <ul>
                            <li>
                                Desarrollar la escucha y la conversación.
                            </li>
                            <li>
                                Desarrollar habilidades de lectura y comunicación
                            </li>
                            <li>
                                Desarrollar capacidades para construir sinergias
                            </li>
                            <li>
                                Vocerías
                            </li>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>

            <div class="tm-section-wrap bg-white">
                <section id="work" class="row tm-section">
                    <div class="col-12">
                        <div class="w-100 tm-double-border-1 tm-border-gray">
                            <div class="tm-double-border-2 tm-border-gray tm-box-pad">
                                <div class="tm-gallery-wrap">
                                    <h2 class="tm-color-primary tm-section-title mb-4 ml-2">Our Work</h2>
                                    <div class="tm-gallery">
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/01.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/01.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/02.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/02.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/03.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/03.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/04.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/04.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/05.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/05.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/06.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/06.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/07.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/07.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                        <div class="tm-gallery-item">
                                            <figure class="effect-bubba">
                                                <img src="img/gallery/08.jpg" alt="Our Work Image" class="img-fluid">
                                                <figcaption>
                                                    <h2>Fresh <span>Bubba</span></h2>
                                                    <p>Bubba likes to appear out of thin air.</p>
                                                    <a href="img/gallery/large/08.jpg">View more</a>
                                                </figcaption>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div class="tm-section-wrap bg-white">
                <section id="clients" class="row tm-section">
                    <div class="col-12 tm-section-pad">
                        <div class="tm-flex-item-left">
                            <div class="tm-w-80">
                                <h2 class="tm-color-primary tm-section-title mb-4">Our Clients</h2>
                                <p class="mb-5">
                                    Aenean est augue, iaculis ut arcu a, cursus tempus eros.
                                    Maecenas ut efficitur lectus, vel commodo nibh. Vivamus
                                    consequat massa non euismod facilisis. Morbi assumsan non libero
                                    a vehicula. Donec blandit suscipit magna sit amet elementum.
                                </p>
                            </div>

                            <div class="row tm-clients-images">
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://google.com">
                                        <img src="img/client-1.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://facebook.com">
                                        <img src="img/client-2.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://twitter.com">
                                        <img src="img/client-3.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://instagram.com">
                                        <img src="img/client-4.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://google.com">
                                        <img src="img/client-5.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://facebook.com">
                                        <img src="img/client-6.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://twitter.com">
                                        <img src="img/client-7.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                                <div class="col-xl-3 col-lg-6 col-md-4 col-sm-6 tm-img-wrap">
                                    <a href="https://instagram.com">
                                        <img src="img/client-8.png" alt="Client Image" class="img-fluid tm-client-img" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <div class="tm-section-wrap bg-white">
                <section id="talk" class="row tm-section">
                    <div class="col-xl-6 mb-5">
                        <div class="tm-double-border-1 tm-border-gray">
                            <div class="tm-double-border-2 tm-border-gray tm-box-pad">
                                <h2 class="tm-color-primary tm-section-title mb-4">Talk to Us</h2>
                                <p class="mb-4">
                                    Sed aliquet, nibh ac hendrerit faucibus, tellus metus viverra
                                    tellus, vel volutpat purus orci ac ex.
                                </p>
                                <p class="mb-3">
                                    120-240 Orci varius natoque penatibus, <br>
                                    parturient montes, 10660 <br>
                                    nasvetur ridiculus mus
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 mb-5">
                        <div class="tm-contact-form-wrap">
                            <form action="" method="POST" class="tm-contact-form">
                                <div class="form-group">
                                    <input type="text" id="contact_name" name="contact_name" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" placeholder="Your Name" required="" />
                                </div>
                                <div class="form-group">
                                    <input type="email" id="contact_email" name="contact_email" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" placeholder="Your Email" required="" />
                                </div>

                                <div class="form-group">
                                    <textarea rows="4" id="contact_message" name="contact_message" class="form-control rounded-0 border-top-0 border-right-0 border-left-0" placeholder="Message..." required=""></textarea>
                                </div>

                                <div class="form-group mb-0">
                                    <button type="submit" class="btn rounded-0 d-block ml-auto tm-btn-primary">
                                        SEND
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </main>
    </div>
</div>
<!--    </main>-->

</body>

<script type="text/javascript">

    function guardarConsulta(id,link){
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'principal', action: 'actividad_ajax')}",
            data:{
                id: id
            },
            success: function(msg){
                if(msg == 'ok'){
                    // window.location.replace(link);
                    window.open(link);
                }

            }
        });
    }

    $( document ).ready(function() {
        cargarCategorias("ct_${activo}", "sbct_${sbct_actv}");
    });

    %{--cargarPantalla("${sbct_actv?:'sbct_1'}");--}%

    function cargarCategorias(cat_id, sbct_id) {
        // console.log("id", cat_id)
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'principal', action: 'categorias')}",
            data: {id: cat_id, sbct: sbct_id},
            success: function (msg) {
                $("#categorias").html(msg)
                // cargarPantalla(sbct_id)
            } //success
        });
    }

    $("#ingresar").click(function () {
        cargarIngreso();
    });

    $('#bsca').keyup(function (ev) {
        if (ev.keyCode == 13) {
            $("#btn-buscar").click();
        }
    })

    $("#btn-borrar").click(function () {
        event.preventDefault()
        $('#bsca').val('');
    });

    $("#btn-buscar").click(function () {
        var dato = $('#bsca').val()
        var ctgr = $('#categoriaBuscar').val()
        // console.log('hola', dato);
        location.href="${createLink(controller: 'principal', action: 'buscar')}?bscr=" + dato + "&ctgr=" + ctgr
    });

    function cargarIngreso() {
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'principal', action: 'login_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgCreateEditIngreso",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i> Salir",
                            className: "btn-gris",
                            callback: function () {
                            }
                        }
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    $("#registro").click(function () {
        cargarRegistro();
    });

    function cargarRegistro() {
        // console.log("cargar")
        bootbox.hideAll()
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action: 'registro_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgCreateEditRegistro",
                    // class   : "long",
                    // title   : "Registro de usuarios",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i> Salir",
                            className: "btn-gris",
                            callback: function () {
                            }
                        },
                        guardar: {
                            id: "btnSave",
                            label: "<i class='fa fa-save'></i> Guardar",
                            className: "btn-rojo",
                            callback: function () {
                                return submitFormRegistro();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormRegistro() {
        var $form = $("#frmRegistro");
        if ($form.valid()) {
            var d = cargarLoader("Guardando...");
            $.ajax({
                type: "POST",
                url: '${createLink(controller: 'persona', action:'saveRegistro_ajax')}',
                data: $form.serialize(),
                success: function (msg) {
                    var parts = msg.split("_");
                    if (parts[0] == 'ok') {
                        bootbox.alert("<i class='fa fa-envelope fa-2x text-warning'></i> Un mail de verificación ha sido enviado a su correo " +
                            "<br> <i class='fa fa-exclamation-circle fa-2x text-warning'></i> Si no ha recibido el correo, revise su bandeja de spam", function(){
                            d.modal('hide');
                            // bootbox.hideAll()
                        })
                    }else {
                        if(parts[0] == 'er'){
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + parts[1], function(){
                                d.modal('hide');
                            })
                        }else{
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + "Error al crear el usuario", function(){
                                d.modal('hide');
                            })
                        }
                    }
                }
            });
        } else {
            return false;
        } //else
    }

    function cargarPassword() {
        bootbox.hideAll();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action: 'password_ajax')}",
            data: {},
            success: function (msg) {
                var b = bootbox.dialog({
                    id: "dlgPassword",
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "<i class='fa fa-times'></i> Salir",
                            className: "btn-gris",
                            callback: function () {
                            }
                        },
                        guardar: {
                            id: "btnSave",
                            label: "<i class='fa fa-check'></i> Aceptar",
                            className: "btn-rojo",
                            callback: function () {
                                return submitFormPassword();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
            } //success
        }); //ajax
    } //createEdit

    function submitFormPassword() {
        var $form = $("#frmPassword");
        if ($form.valid()) {
            var d = cargarLoader("Procesando...");
            $.ajax({
                type: "POST",
                url: '${createLink(controller: 'persona', action:'recuperarPassword_ajax')}',
                data: $form.serialize(),
                success: function (msg) {
                    var parts = msg.split("_");
                    if (parts[0] == 'ok') {
                        bootbox.alert("<i class='fa fa-envelope fa-2x text-warning'></i> Un mail con su contraseña ha sido enviado a su correo " +
                            "<br> <i class='fa fa-exclamation-circle fa-2x text-warning'></i> Si no ha recibido el correo, revise su bandeja de spam", function(){
                            d.modal('hide');
                            // bootbox.hideAll()
                        })
                    }else {
                        if(parts[0] == 'er'){
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + parts[1], function(){
                                d.modal('hide');
                            })
                        }else{
                            bootbox.alert("<i class='fa fa-exclamation-triangle fa-2x text-warning'></i>" + "Error al recuperar el password", function(){
                                d.modal('hide');
                            })
                        }
                    }
                }
            });
        } else {
            return false;
        } //else
    }

</script>

</body>

</html>