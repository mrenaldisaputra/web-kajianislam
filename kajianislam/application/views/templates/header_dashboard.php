<?php if ($this->session->userdata('email') == null) {
    $s2 = $this->uri->segment(1);
    if ($s2 !== 'auth') {
        redirect('auth');
    }
} ?>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>
        <?= $title; ?>
    </title>

    <!-- Custom fonts for this template-->
    <link href="<?= base_url('assets/'); ?>vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="<?= base_url() ?>assets/img/favicon.png" alt="icon TransTV" title="icon TransTV">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css"
        href="<?= base_url('assets/'); ?>vendor/overlay-scrollbar/css/OverlayScrollbars.min.css">

    <!-- Custom styles for this template-->
    <link href="<?= base_url('assets/'); ?>css/sb-admin-2.css" rel="stylesheet">
    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="<?= base_url('assets/'); ?>css/style.css">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">



    <link href="https://cdn.jsdelivr.net/npm/quill@2.0.0-rc.3/dist/quill.snow.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/quill@2.0.0-rc.3/dist/quill.js"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/atom-one-dark.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css" />

    <style>
        .sidebar-brand img {
            width: 160px;
            /* Sesuaikan lebar sesuai kebutuhan */
            height: auto;
            /* Tinggi akan menyesuaikan proporsi secara otomatis */
        }
    </style>

    <style>
        .image-cover-most-dashboard {
            width: 120px;
            /* Atur lebar sesuai kebutuhan */
            height: 70px;
            /* Atur tinggi sesuai kebutuhan */
            object-fit: cover;
            /* Agar gambar tetap proporsional */
            border-radius: 5px;
            /* Sesuaikan jika ingin sudut membulat */
        }
    </style>

    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            margin-top: 20px;
        }

        .card-header {
            background-color: #f1f3f4;
        }

        .card-title {
            font-size: 1.25rem;
        }

        .card-subtitle {
            font-size: 0.875rem;
        }

        .card-text {
            font-size: 1rem;
        }

        .btn-primary {
            background-color: #1a73e8;
            border: none;
        }
    </style>







</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">