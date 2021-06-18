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

    <asset:javascript src="/merc/jquery.min.js"/>
    <asset:javascript src="/merc/jquery.singlePageNav.min.js"/>
    <asset:javascript src="/merc/parallax.min.js"/>
    <asset:javascript src="/slick/slick.min.js"/>
    <asset:javascript src="/merc/jquery.magnific-popup.min.js"/>
    <asset:javascript src="/merc/templatemo-scripts.js"/>


    <style type="text/css">
    body {
        /*background: #B4BAC0;*/
        line-height: 1.0;
    }
    .lista-item {
        position: relative;
        display: block;
        padding: .5rem 1.0rem;
        background-color: #fff;
        border: 1px solid rgba(0, 0, 0, .125);
        border-top-width: 1px;
    }

    .consulta {
        color: var(--naranja00);
        font-size: small;
        background-color: #fdfdfd;
    }

    .cs900 {
        width: 800px;
        height: 350px;
        align-content: center;
        /*background-color: #B4BAC0;*/
        background-color: var(--gris);
    }

    .carousel-inner {
        text-align: center;
    }

    .carousel .item > img {
        display: inline-block;
    }

    .imag-item {
        height: 350px;
        width: auto;
        max-height: 350px;
        margin: 0;
    }


    .marcoDestacados {
        border-color: var(--naranja0);
    }
    .marcoNormal {
        border-color: var(--gris);
    }

    .buscar {
        /*color: #444 !important;*/
        border-radius: 4px;
        background-image: linear-gradient(var(--naranja3),var(--naranja),var(--naranja3));
        text-align-all: center;
        margin: 2px;
    }
    .buscar:hover{
        background-image: linear-gradient(var(--naranja),var(--naranja3),var(--naranja));
    }

    .btn-gris {
        border-radius: 4px;
        background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
        text-align-all: center;
        margin: 2px;
    }
    .btn-gris a {
        color: #000;
    }
    .btn-gris:hover{
        color: #000;
        background-image: linear-gradient(#D4DAE0, #D4DAE0, #D4DAE0);
    }

    a.nav-link:hover {
        border-radius: 4px;
        background-image: linear-gradient(#D4DAE0, #D4DAE0, #D4DAE0);
    }

    .navbar-nav .nav-link{
        border-radius: 4px;
        height: 30px;
        text-decoration: none;
    }
    .navbar-dark .navbar-nav .nav-link {
        border-radius: 4px;
        background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
    }

    :root {
        --naranja: #FFAB2A;
        --naranja1: #DF8B0A;
        --naranja3: #FFCB4A;
        --naranja2: #EFEBEA;
        --naranja0: #AF5B00;
        --naranja00: #4F1B00;
        --gris: #343A40;
    }

    .redondeado {
        width: 400px;
        border-style:solid;
        border-width: 2px;
        border-color: var(--naranja);
        /*border-color: #e67a00;*/
        border-radius: 4px;
        background-color:var(--naranja);
        text-align: center;
    }

    .estilo {
        border-radius: 50px;
        border-style: solid;
        border-width: 1px;
        border-color: #000000;
    }

    .categoria {
        position: relative;
        display: block;
        padding: .5rem 1.0rem;
        background-color: #fff;
        /*border: 1px solid rgba(0, 0, 0, .25);*/
        border: 1px solid #0a193b;
        border-top-width: 1px;
        border-top-width: 1px;
        color: #42577d;
        border-radius: 5px;
        margin-right: 0px;
    }

    .subcat {
        margin-left: 20px;
        padding-left: 20px;
        border-radius: 7px;
    }

    a.categoria:hover{
        text-decoration: none;
        color: #0a193b;
        background-color: var(--naranja2);
    }
    a.subcat:hover{
        text-decoration: none;
        color: #0a193b;
        /*background-color: #efeff8;*/
        background-color: var(--naranja);
    ;
    }

    .act_ct {
        color: #222;
        background-color: var(--naranja2);
        border-width: 2px;
        /*border-color: #bF6B00;*/
        border-color: var(--naranja0);
    }

    .activo {
        color: #222;
        /*background-color: #fdf8f0;*/
        background-color: var(--naranja);
        border-width: 2px;
        /*border-left: 20px solid #343a40;*/
        border-color: var(--naranja0);
    }

    .titulo0 {
        color:var(--naranja00);
        /*color: #444;*/
        font-size: 1.5rem;
    }

    .titulo1 {
        color:var(--naranja0);
        font-size: 1.5rem;
    }

    .titulo2 {
        color:var(--naranja0);
        font-size: 1.2rem;
    }
    .titulo2n {
        color:var(--gris);
        font-size: 1.0rem;
    }
    .titulo3 {
        color:#000;
        font-size: 0.9rem;
    }
    .titulo4 {
        color:#000;
        font-size: 0.8rem;
        font-weight: normal;
    }
    .normal {
        text-align: center;
        color:#000;
        font-size: 10pt;
        font-weight: normal;
    }

    a.consulta {
        color:var(--naranja00);
        /*font-size: 1.2rem;*/
        /*text-decoration: none;*/
    }
    .titulo2 a {
        color:var(--naranja0);
        font-size: 1.2rem;
    }
    .titulo2n a {
        color:var(--naranja0);
        font-size: 1rem;
    }

    .blink_text {
        animation:1s blinker linear infinite;
        -webkit-animation:1s blinker linear infinite;
        -moz-animation:1s blinker linear infinite;
        color: black;
    }

    @-moz-keyframes blinker {
        0% { opacity: 1.0; }
        50% { opacity: 0.2; }
        100% { opacity: 1.0; }
    }

    @-webkit-keyframes blinker {
        0% { opacity: 1.0; }
        50% { opacity: 0.2; }
        100% { opacity: 1.0; }
    }

    @keyframes blinker {
        0% { opacity: 1.0; }
        50% { opacity: 0.2; }
        100% { opacity: 1.0; }
    }

    .btn-rojo {
        border-radius: 4px;
        background-image: linear-gradient(var(--naranja3),var(--naranja),var(--naranja3));
        text-align-all: center;
        margin: 2px;
    }

    .btn-gris {
        border-radius: 4px;
        background-image: linear-gradient(#D4DAE0, #A4AAB0, #D4DAE0);
        text-align-all: center;
        margin: 2px;
    }
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
                    <div class="tm-double-border-1">
                        <div class="tm-double-border-2">
                            <h1 class="tm-brand text-uppercase">INFOLIDERES</h1>
                        </div>
                    </div>
                </div>

                <ul id="tmMainNav" class="nav flex-column text-uppercase text-right tm-main-nav">
                    <li class="nav-item">
                        <a href="#intro" class="nav-link active">
                            <span class="d-inline-block mr-3">Intro</span>
                            <span class="d-inline-block tm-white-rect"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#about" class="nav-link">
                            <span class="d-inline-block mr-3">About</span>
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
                    <a href="http://200.93.248.62:8008/moodle" class="btn btn-light">
                        <i class="fa fa-user"></i> Ingresar
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
                            <h2 class="tm-section-title mb-5 text-uppercase tm-color-primary">Introducing Dream Pulse</h2>
                            <p class="tm-color-gray">
                                This box alpha 30 percent. Left sidebar is a sticky element.
                                Right side Contents are scrolling up and down. This background has a
                                parallax effect.
                            </p>
                            <p class="mb-0 tm-color-gray">
                                Dream Pulse is a Bootstrap 4.3.1 template designed for your websites. You can modify this layout as you like.
                            </p>
                        </div>
                    </section>
                </div>
            </div>

            <div class="tm-section-wrap bg-white">
                <section id="about" class="row tm-section">
                    <div class="col-xl-6">
                        <div class="tm-section-half">
                            <div><i class="fas fa-6x fa-balance-scale mb-5 tm-section-icon"></i></div>
                            <h2 class="tm-section-title tm-color-primary mb-5">About Us</h2>
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
                    <div class="col-xl-6">
                        <div class="tm-section-half">
                            <div><i class="far fa-6x fa-building mb-5 tm-section-icon"></i></div>
                            <h2 class="tm-section-title tm-color-primary mb-5">Company Profile</h2>
                            <p class="mb-5">
                                You can use this template for your commercial websites or for your clients.
                                You are NOT allowed to re-post this template as a downloadable ZIP file
                                on your template collection sites. It is illegal.
                            </p>
                            <p>
                                Suspendisse fermentum orci eget lorem euismod suscipit. Morbi
                                condimentum odio metus, at finibus dolor sollicitudin quis.
                                Curabitur eu congue erat.
                            </p>
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