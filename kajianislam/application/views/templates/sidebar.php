<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center"
        href=" <?= base_url('admin/dashboard') ?>">
        <img class="img-fluid" loading="lazy" src="<?= base_url('assets/'); ?>img/logo/KajianIslam.png"
            width="245" height="80" alt="BootstrapBrain Logo">

    </a>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Admin
    </div>

    <!-- Nav Item - Dashboard -->
    <li class="nav-item" a>
        <a class="nav-link" href="<?= base_url('admin/dashboard') ?>">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Menu Konten
    </div>

    <!-- Nav Item - Artikel Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
            aria-controls="collapseTwo">
            <i class="fas fa-fw fa-newspaper"></i>
            <span>Artikel</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Sub-menu:</h6>
                <a class="collapse-item" href=" <?= base_url('artikel/list_artikel') ?>">List Artikel</a>
                <a class="collapse-item" href=" <?= base_url('artikel/new_artikel') ?>">Tambah Artikel</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Kategori Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseKategori"
            aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-tasks"></i>
            <span>Kategori</span>
        </a>
        <div id="collapseKategori" class="collapse" aria-labelledby="headingKategori" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Sub-menu:</h6>
                <a class="collapse-item" href="<?= base_url('kategori/list_kategori') ?>">List Kategori</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Doa Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseDoa" aria-expanded="true"
            aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-praying-hands"></i>
            <span>Do'a</span>
        </a>
        <div id="collapseDoa" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Sub-menu:</h6>
                <a class="collapse-item" href="<?= base_url('doa/list_doa') ?>">List Doa</a>
                <a class="collapse-item" href="<?= base_url('doa/new_doa') ?>">Tambah Doa</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Video Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseVideo" aria-expanded="true"
            aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-video"></i>
            <span>Video</span>
        </a>
        <div id="collapseVideo" class="collapse" aria-labelledby="headingVideo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Sub-menu:</h6>
                <a class="collapse-item" href="<?= base_url('video/list_video') ?>">List Video</a>
                <a class="collapse-item" href="<?= base_url('video/new_video') ?>">Tambah Video</a>
            </div>
        </div>
    </li>



    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Fitur
    </div>

    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('admin/manajemenAdmin') ?>">
            <i class="fas fa-fw fa-table"></i>
            <span>Manajemen Admin</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('message/admin') ?>">
            <i class="fas fa-fw fa-table"></i>
            <span>Pesan Masuk</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->