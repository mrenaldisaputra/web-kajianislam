<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>
        <?php
        // Cek apakah judul artikel tersedia dan tampilkan jika ada
        if (isset($artikel['judul'])) {
            echo "" . $artikel['judul'] . "</title>";
        }
        // Jika tidak, cek apakah judul video tersedia dan tampilkan jika ada
        elseif (isset($video['judul'])) {
            echo "" . $video['judul'] . "</title>";
        }
        // Jika tidak, cek apakah judul doa tersedia dan tampilkan jika ada
        elseif (isset($doa['judul'])) {
            echo "" . $doa['judul'] . "</title>";
        }
        // Jika tidak ada judul yang tersedia dari ketiga sumber, tampilkan judul default
        else {
            echo "<title>Judul Default</title>";
        }
        ?>

    </title>

    <!-- Dark mode -->
    <script>
        const storedTheme = localStorage.getItem('theme')

        const getPreferredTheme = () => {
            if (storedTheme) {
                return storedTheme
            }
            return window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'light'
        }

        const setTheme = function (theme) {
            if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
                document.documentElement.setAttribute('data-bs-theme', 'dark')
            } else {
                document.documentElement.setAttribute('data-bs-theme', theme)
            }
        }

        setTheme(getPreferredTheme())

        window.addEventListener('DOMContentLoaded', () => {
            var el = document.querySelector('.theme-icon-active');
            if (el != 'undefined' && el != null) {
                const showActiveTheme = theme => {
                    const activeThemeIcon = document.querySelector('.theme-icon-active use')
                    const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)
                    const svgOfActiveBtn = btnToActive.querySelector('.mode-switch use').getAttribute('href')

                    document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
                        element.classList.remove('active')
                    })

                    btnToActive.classList.add('active')
                    activeThemeIcon.setAttribute('href', svgOfActiveBtn)
                }

                window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
                    if (storedTheme !== 'light' || storedTheme !== 'dark') {
                        setTheme(getPreferredTheme())
                    }
                })

                showActiveTheme(getPreferredTheme())

                document.querySelectorAll('[data-bs-theme-value]')
                    .forEach(toggle => {
                        toggle.addEventListener('click', () => {
                            const theme = toggle.getAttribute('data-bs-theme-value')
                            localStorage.setItem('theme', theme)
                            setTheme(theme)
                            showActiveTheme(theme)
                        })
                    })

            }
        })


    </script>

    <style>
        .carousel-caption {
            text-shadow: 1px 2px 4px rgba(0, 0, 0, 1);
        }

        .bg-dark {
            --bs-bg-opacity: 1;
            --bs-dark-rgb: 18, 55, 42;
            /* Nilai RGB untuk warna #12372A */
            background-color: rgba(var(--bs-dark-rgb), var(--bs-bg-opacity)) !important;
        }

        .text-bg-dark {
            --bs-bg-opacity: 1;
            --bs-dark-rgb: 18, 55, 42;
            color: #fff !important;
            background-color: RGBA(var(--bs-dark-rgb), var(--bs-bg-opacity, 1)) !important;
        }
    </style>


    <!-- Custom fonts for this template-->
    <link href="<?= base_url('assets/'); ?>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="shortcut icon" href="<?= base_url() ?>assets/img/favicon.png" alt="icon TransTV" title="icon TransTV">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('assets/'); ?>css/style.css">
    <link rel="stylesheet" type="text/css" href="<?= base_url('assets/'); ?>vendor/tiny-slider/tiny-slider.css">
    <link rel="stylesheet" type="text/css" href="<?= base_url('assets/'); ?>vendor/vendor/plyr/plyr.css">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-XZ4W34ZJ0L"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'G-XZ4W34ZJ0L');
    </script>







</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <header class="navbar-light navbar-sticky header-static">
            <div class="navbar-top d-none d-lg-block small">
                <div class="container">
                    <!-- Divider -->
                    <div class="border-bottom border-2 border-primary opacity-1"></div>
                </div>
            </div>

            <!-- Logo Nav START -->
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <!-- Logo START -->
                    <a class="navbar-brand" href="<?= base_url('portal') ?>">
                        <img class="navbar-brand-item light-mode-item"
                            src="<?= base_url('assets/'); ?>img/logo/KajianIslam-dark.png" alt="logo">
                        <img class="navbar-brand-item dark-mode-item"
                            src="<?= base_url('assets/'); ?>img/logo/KajianIslam.png" alt="logo">
                    </a>
                    <!-- Logo END -->

                    <!-- Responsive navbar toggler -->
                    <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="text-body h6 d-none d-sm-inline-block"></span>
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Main navbar START -->
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav navbar-nav-scroll mx-auto">

                            <!-- Nav item 1 Demos -->
                            <li class="nav-item">
                                <a class="nav-link" href="<?= base_url('portal') ?>" id="berandaMenu">Beranda</a>
                            </li>

                            <!-- Nav item 2 Pages -->
                            <li class="nav-item">
                                <a class="nav-link" href="<?= base_url('portal/list_artikel') ?>"
                                    id="artikelMenu">Artikel</a>
                            </li>

                            <!-- Nav item 3 Post -->
                            <li class="nav-item">
                                <a class="nav-link" href="<?= base_url('portal/list_video') ?>" id="videoMenu">Video</a>
                            </li>

                            <!-- Nav item 4 Mega menu -->
                            <li class="nav-item">
                                <a class="nav-link" href="<?= base_url('portal/list_doa') ?>" id="pilihandoaMenu">
                                    Pilihan Doa</a>
                            </li>
                        </ul>
                    </div>
                    <!-- Main navbar END -->

                    <!-- Nav right START -->
                    <div class="nav flex-nowrap align-items-center">
                        <!-- Nav Button -->

                        <!-- Dark mode options END -->
                        <!-- Nav Search -->
                        <div class="nav-item dropdown dropdown-toggle-icon-none nav-search">
                            <a class="nav-link dropdown-toggle" role="button" href="#" id="navSearch"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-search fs-4"> </i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end shadow rounded p-2" aria-labelledby="navSearch">
                                <form class="input-group" action="<?= base_url('portal/search'); ?>" method="get">
                                    <input class="form-control border-success" type="search" name="keyword"
                                        placeholder="Search" aria-label="Search">
                                    <button class="btn btn-success m-0" type="submit">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- Offcanvas menu toggler -->
                        <!-- Dark mode options START -->
                        <div class="nav-item dropdown mx-2">
                            <!-- Switch button -->
                            <button class="modeswitch" id="bd-theme" type="button" aria-expanded="false"
                                data-bs-toggle="dropdown" data-bs-display="static">
                                <svg class="theme-icon-active">
                                    <use href="#"></use>
                                </svg>
                            </button>
                            <!-- Dropdown items -->
                            <ul class="dropdown-menu min-w-auto dropdown-menu-end" aria-labelledby="bd-theme">
                                <li class="mb-1">
                                    <button type="button" class="dropdown-item d-flex align-items-center"
                                        data-bs-theme-value="light">
                                        <svg width="16" height="16" fill="currentColor"
                                            class="bi bi-brightness-high-fill fa-fw mode-switch me-1"
                                            viewBox="0 0 16 16">
                                            <path
                                                d="M12 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
                                            <use href="#"></use>
                                        </svg>Light
                                    </button>
                                </li>
                                <li class="mb-1">
                                    <button type="button" class="dropdown-item d-flex align-items-center"
                                        data-bs-theme-value="dark">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-moon-stars-fill fa-fw mode-switch me-1"
                                            viewBox="0 0 16 16">
                                            <path
                                                d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z" />
                                            <path
                                                d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
                                            <use href="#"></use>
                                        </svg>Dark
                                    </button>
                                </li>
                                <li>
                                    <button type="button" class="dropdown-item d-flex align-items-center active"
                                        data-bs-theme-value="auto">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-circle-half fa-fw mode-switch me-1"
                                            viewBox="0 0 16 16">
                                            <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
                                            <use href="#"></use>
                                        </svg>Auto
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Nav right END -->
                </div>
            </nav>
            <div class="container">
                <div class="border-bottom border-primary border-2 opacity-1"></div>
            </div>

            <!-- Logo Nav END -->
        </header>
        <!-- =======================
Header END -->