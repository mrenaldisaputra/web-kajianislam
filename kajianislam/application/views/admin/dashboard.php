<!-- Begin Page Content -->

<!-- **************** MAIN CONTENT START **************** -->
<main>
    <!-- ======================= Main contain START -->
    <section class="py-4">
        <div class="container">

            <!-- Page Heading -->
            <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>
            <div class="row g-4">

                <div class="col-12">
                    <!-- Counter START -->
                    <div class="row g-4">
                        <!-- Counter item -->
                        <div class="col-sm-6 col-lg-4">
                            <div class="card card-body border p-3">
                                <div class="d-flex align-items-center">
                                    <!-- Icon -->
                                    <div class="icon-xl fs-1 bg-success bg-opacity-10 rounded-3 text-success">
                                        <i class="bi bi-people-fill"></i>
                                    </div>
                                    <!-- Content -->
                                    <div class="ms-3">
                                        <h3><?= $total_hits ?></h3>
                                        <h6 class="mb-0">Pageviews</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Counter item -->
                        <div class="col-sm-6 col-lg-4">
                            <div class="card card-body border p-3">
                                <div class="d-flex align-items-center">
                                    <!-- Icon -->
                                    <div class="icon-xl fs-1 bg-primary bg-opacity-10 rounded-3 text-primary">
                                        <i class="bi bi-file-earmark-text-fill"></i>
                                    </div>
                                    <!-- Content -->
                                    <div class="ms-3">
                                        <h3><?= $total_posts ?></h3>
                                        <h6 class="mb-0">Posts Active</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Counter item -->
                        <div class="col-sm-6 col-lg-4">
                            <div class="card card-body border p-3">
                                <div class="d-flex align-items-center">
                                    <!-- Icon -->
                                    <div class="icon-xl fs-1 bg-danger bg-opacity-10 rounded-3 text-danger">
                                        <i class="bi bi-bar-chart-line-fill"></i>
                                    </div>
                                    <!-- Content -->
                                    <div class="ms-3">
                                        <h3><?= $total_visitors ?></h3>
                                        <h6 class="mb-0">Visitors</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Counter END -->
                </div>



                <div class="col-md-6 col-xxl-12">
                    <!-- Latest blog START -->
                    <div class="card border h-100">
                        <!-- Card header -->
                        <div class="card-header border-bottom d-flex justify-content-between align-items-center p-3">
                            <h5 class="card-header-title mb-0">Latest Post</h5>
                        </div>
                        <!-- Card body START -->
                        <div class="card-body p-3">
                            <div class="row">
                                <!-- Blog items -->
                                <?php foreach ($latest_posts as $post): ?>
                                    <div class="col-12">
                                        <div class="d-flex align-items-center position-relative">
                                            <img class="image-cover-most-dashboard"
                                                src="<?= base_url('assets/img/' . $post['kategori'] . '/' . $post['gambar']) ?>"
                                                alt="product">
                                            <div class="ms-3">
                                                <a href="<?= base_url('portal/' . $post['kategori'] . '/' . $post['id']) ?>"
                                                    class="h6 stretched-link"><?= $post['judul'] ?></a>
                                                <p class="small m-0" style="text-transform: capitalize;">
                                                    <?= ucfirst($post['kategori']) ?>
                                                </p>
                                                <p class="small m-0"><?php
                                                // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                date_default_timezone_set('Asia/Jakarta');

                                                // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                $tanggalDb = $post['tanggal'];

                                                // Array untuk konversi nama hari dari Inggris ke Indonesia
                                                $hariIndonesia = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

                                                // Array untuk konversi nama bulan dari Inggris ke Indonesia
                                                $bulanIndonesia = [
                                                    1 => 'Januari',
                                                    2 => 'Februari',
                                                    3 => 'Maret',
                                                    4 => 'April',
                                                    5 => 'Mei',
                                                    6 => 'Juni',
                                                    7 => 'Juli',
                                                    8 => 'Agustus',
                                                    9 => 'September',
                                                    10 => 'Oktober',
                                                    11 => 'November',
                                                    12 => 'Desember'
                                                ];

                                                // Mengubah string tanggal dari database menjadi timestamp
                                                $timestamp = strtotime($tanggalDb);

                                                // Menghitung selisih waktu antara waktu saat ini dan waktu yang diberikan
                                                $selisihWaktu = time() - $timestamp;

                                                // Jika masih dalam 24 jam terakhir
                                                if ($selisihWaktu < 86400) { // 86400 detik = 24 jam
                                                    if ($selisihWaktu >= 3600) { // Jika lebih dari atau sama dengan 1 jam yang lalu
                                                        $jamYangLalu = floor($selisihWaktu / 3600);
                                                        $waktuFormatted = "$jamYangLalu jam yang lalu";
                                                    } else { // Jika kurang dari 1 jam yang lalu
                                                        $menitYangLalu = ceil($selisihWaktu / 60);
                                                        $waktuFormatted = "$menitYangLalu menit yang lalu";
                                                    }
                                                } else { // Jika lebih dari 24 jam
                                                    // Mengambil tanggal tanpa leading zero
                                                    $tanggal = date('j', $timestamp);

                                                    // Mengambil nama bulan berdasarkan timestamp
                                                    $bulan = $bulanIndonesia[(int) date('m', $timestamp)];

                                                    // Mengambil tahun dari timestamp
                                                    $tahun = date('Y', $timestamp);

                                                    // Mengambil waktu (jam dan menit) dari timestamp
                                                    $jam = date('H:i', $timestamp);

                                                    // Mengambil nama hari berdasarkan timestamp
                                                    $hari = $hariIndonesia[date('w', $timestamp)];

                                                    // Menggabungkan semua bagian untuk membuat format tanggal bahasa Indonesia
                                                    $waktuFormatted = "$hari, $tanggal $bulan $tahun $jam WIB";
                                                }

                                                // Menampilkan waktu yang sudah diformat
                                                echo $waktuFormatted;
                                                ?></p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Divider -->
                                    <hr class="my-3">
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <!-- Card body END -->
                    </div>
                    <!-- Latest blog END -->
                </div>

                <div class="col-md-6 col-xxl-12">
                    <!-- Most views START -->
                    <div class="card border h-100">
                        <!-- Card header -->
                        <div class="card-header border-bottom d-flex justify-content-between align-items-center p-3">
                            <h5 class="card-header-title mb-0">Most Views</h5>
                        </div>
                        <!-- Card body START -->
                        <div class="card-body p-3">
                            <div
                                class="custom-scrollbar h-350 os-host os-theme-dark os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
                                <div class="os-resize-observer-host observed">
                                    <div class="os-resize-observer" style="left: 0px; right: auto;"></div>
                                </div>
                                <div class="os-size-auto-observer observed"
                                    style="height: calc(100% + 1px); float: left;">
                                    <div class="os-resize-observer"></div>
                                </div>
                                <div class="os-content-glue" style="margin: 0px; width: 504px; height: 349px;"></div>
                                <div class="os-padding">
                                    <div class="os-viewport os-viewport-native-scrollbars-invisible"
                                        style="overflow-y: scroll;">
                                        <div class="os-content" style="padding: 0px; height: 100%; width: 100%;">
                                            <div class="row">
                                                <!-- Most viewed items -->
                                                <?php foreach ($most_viewed as $index => $item): ?>
                                                    <div class="col-12">
                                                        <div class="d-flex justify-content-between position-relative">
                                                            <div class="d-sm-flex">
                                                                <div
                                                                    class="icon-lg bg-warning bg-opacity-15 text-warning rounded-2 flex-shrink-0 m-2">
                                                                    <i><?= $index + 1 ?></i>
                                                                </div>
                                                                <img class="ms-4 image-cover-most-dashboard"
                                                                    src="<?= base_url('assets/img/' . $item['kategori'] . '/' . $item['gambar']) ?>"
                                                                    alt="product">
                                                                <!-- Info -->
                                                                <div class="ms-0 ms-sm-3 mt-2 mt-sm-0">
                                                                    <h6 class="mb-0">
                                                                        <a href="<?= base_url('portal/' . $item['kategori'] . '/' . $item['id']) ?>"
                                                                            class="stretched-link"><?= $item['judul'] ?></a>
                                                                    </h6>
                                                                    <p class="small mb-0"
                                                                        style="text-transform: capitalize;">
                                                                        <?= ucfirst($item['kategori']) ?>
                                                                    </p>
                                                                    <span class="small"><?php
                                                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                                    date_default_timezone_set('Asia/Jakarta');

                                                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                                    $tanggalDb = $item['tanggal'];

                                                                    // Array untuk konversi nama hari dari Inggris ke Indonesia
                                                                    $hariIndonesia = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

                                                                    // Array untuk konversi nama bulan dari Inggris ke Indonesia
                                                                    $bulanIndonesia = [
                                                                        1 => 'Januari',
                                                                        2 => 'Februari',
                                                                        3 => 'Maret',
                                                                        4 => 'April',
                                                                        5 => 'Mei',
                                                                        6 => 'Juni',
                                                                        7 => 'Juli',
                                                                        8 => 'Agustus',
                                                                        9 => 'September',
                                                                        10 => 'Oktober',
                                                                        11 => 'November',
                                                                        12 => 'Desember'
                                                                    ];

                                                                    // Mengubah string tanggal dari database menjadi timestamp
                                                                    $timestamp = strtotime($tanggalDb);

                                                                    // Menghitung selisih waktu antara waktu saat ini dan waktu yang diberikan
                                                                    $selisihWaktu = time() - $timestamp;

                                                                    // Jika masih dalam 24 jam terakhir
                                                                    if ($selisihWaktu < 86400) { // 86400 detik = 24 jam
                                                                        if ($selisihWaktu >= 3600) { // Jika lebih dari atau sama dengan 1 jam yang lalu
                                                                            $jamYangLalu = floor($selisihWaktu / 3600);
                                                                            $waktuFormatted = "$jamYangLalu jam yang lalu";
                                                                        } else { // Jika kurang dari 1 jam yang lalu
                                                                            $menitYangLalu = ceil($selisihWaktu / 60);
                                                                            $waktuFormatted = "$menitYangLalu menit yang lalu";
                                                                        }
                                                                    } else { // Jika lebih dari 24 jam
                                                                        // Mengambil tanggal tanpa leading zero
                                                                        $tanggal = date('j', $timestamp);

                                                                        // Mengambil nama bulan berdasarkan timestamp
                                                                        $bulan = $bulanIndonesia[(int) date('m', $timestamp)];

                                                                        // Mengambil tahun dari timestamp
                                                                        $tahun = date('Y', $timestamp);

                                                                        // Mengambil waktu (jam dan menit) dari timestamp
                                                                        $jam = date('H:i', $timestamp);

                                                                        // Mengambil nama hari berdasarkan timestamp
                                                                        $hari = $hariIndonesia[date('w', $timestamp)];

                                                                        // Menggabungkan semua bagian untuk membuat format tanggal bahasa Indonesia
                                                                        $waktuFormatted = "$hari, $tanggal $bulan $tahun $jam WIB";
                                                                    }

                                                                    // Menampilkan waktu yang sudah diformat
                                                                    echo $waktuFormatted;
                                                                    ?></span>
                                                                    <span class="small text-muted"> -
                                                                        <?= $item['total_hit'] ?> views</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Divider -->
                                                    <?php if ($index < count($most_viewed) - 1): ?>
                                                        <hr class="my-3">
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
                                    <div class="os-scrollbar-track os-scrollbar-track-off">
                                        <div class="os-scrollbar-handle"
                                            style="width: 97.1154%; transform: translate(0px, 0px);"></div>
                                    </div>
                                </div>
                                <div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden">
                                    <div class="os-scrollbar-track os-scrollbar-track-off">
                                        <div class="os-scrollbar-handle"
                                            style="height: 94.8509%; transform: translate(0px, 18px);"></div>
                                    </div>
                                </div>
                                <div class="os-scrollbar-corner"></div>
                            </div>
                        </div>
                        <!-- Card body END -->
                    </div>
                    <!-- Most views END -->
                </div>

                <div class="col-md-6 col-xxl-12">
                    <!-- Notice board START -->
                    <div class="card border h-100">
                        <div class="card-header border-bottom d-flex justify-content-between align-items-center p-3">
                            <h5 class="card-header-title mb-0">Notice Board</h5>
                        </div>

                        <!-- Card body START -->
                        <div class="card-body p-3">
                            <div
                                class="custom-scrollbar h-350 os-host os-theme-dark os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
                                <div class="os-resize-observer-host observed">
                                    <div class="os-resize-observer" style="left: 0px; right: auto;"></div>
                                </div>
                                <div class="os-size-auto-observer observed"
                                    style="height: calc(100% + 1px); float: left;">
                                    <div class="os-resize-observer"></div>
                                </div>
                                <div class="os-content-glue" style="margin: 0px; width: 504px; height: 349px;"></div>
                                <div class="os-padding">
                                    <div class="os-viewport os-viewport-native-scrollbars-invisible"
                                        style="overflow-y: scroll;">
                                        <div class="os-content" style="padding: 0px; height: 100%; width: 100%;">
                                            <div class="row">
                                                <!-- Notice board items -->
                                                <?php foreach ($latest_messages as $message): ?>
                                                    <div class="col-12">
                                                        <div class="d-flex justify-content-between position-relative">
                                                            <div class="d-sm-flex">
                                                                <div
                                                                    class="icon-lg bg-danger bg-opacity-15 text-danger rounded-2 flex-shrink-0">
                                                                    <i class="fas fa-envelope fs-5"></i>
                                                                </div>
                                                                <!-- Info -->
                                                                <div class="ms-0 ms-sm-3 mt-2 mt-sm-0">
                                                                    <h5 class="mb-0">
                                                                        <a href="<?= base_url('admin/message_detail/' . $message['id']) ?>"
                                                                            class="stretched-link">
                                                                            <?= $message['subject'] ?>
                                                                        </a>
                                                                    </h5>
                                                                    <p class="m-0"><?= $message['email'] ?></p>
                                                                    <span class="small"><?php
                                                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                                    date_default_timezone_set('Asia/Jakarta');

                                                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                                    $tanggalDb = $message['created_at'];

                                                                    // Array untuk konversi nama hari dari Inggris ke Indonesia
                                                                    $hariIndonesia = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

                                                                    // Array untuk konversi nama bulan dari Inggris ke Indonesia
                                                                    $bulanIndonesia = [
                                                                        1 => 'Januari',
                                                                        2 => 'Februari',
                                                                        3 => 'Maret',
                                                                        4 => 'April',
                                                                        5 => 'Mei',
                                                                        6 => 'Juni',
                                                                        7 => 'Juli',
                                                                        8 => 'Agustus',
                                                                        9 => 'September',
                                                                        10 => 'Oktober',
                                                                        11 => 'November',
                                                                        12 => 'Desember'
                                                                    ];

                                                                    // Mengubah string tanggal dari database menjadi timestamp
                                                                    $timestamp = strtotime($tanggalDb);

                                                                    // Menghitung selisih waktu antara waktu saat ini dan waktu yang diberikan
                                                                    $selisihWaktu = time() - $timestamp;

                                                                    // Jika masih dalam 24 jam terakhir
                                                                    if ($selisihWaktu < 86400) { // 86400 detik = 24 jam
                                                                        if ($selisihWaktu >= 3600) { // Jika lebih dari atau sama dengan 1 jam yang lalu
                                                                            $jamYangLalu = floor($selisihWaktu / 3600);
                                                                            $waktuFormatted = "$jamYangLalu jam yang lalu";
                                                                        } else { // Jika kurang dari 1 jam yang lalu
                                                                            $menitYangLalu = ceil($selisihWaktu / 60);
                                                                            $waktuFormatted = "$menitYangLalu menit yang lalu";
                                                                        }
                                                                    } else { // Jika lebih dari 24 jam
                                                                        // Mengambil tanggal tanpa leading zero
                                                                        $tanggal = date('j', $timestamp);

                                                                        // Mengambil nama bulan berdasarkan timestamp
                                                                        $bulan = $bulanIndonesia[(int) date('m', $timestamp)];

                                                                        // Mengambil tahun dari timestamp
                                                                        $tahun = date('Y', $timestamp);

                                                                        // Mengambil waktu (jam dan menit) dari timestamp
                                                                        $jam = date('H:i', $timestamp);

                                                                        // Mengambil nama hari berdasarkan timestamp
                                                                        $hari = $hariIndonesia[date('w', $timestamp)];

                                                                        // Menggabungkan semua bagian untuk membuat format tanggal bahasa Indonesia
                                                                        $waktuFormatted = "$hari, $tanggal $bulan $tahun $jam WIB";
                                                                    }

                                                                    // Menampilkan waktu yang sudah diformat
                                                                    echo $waktuFormatted;
                                                                    ?></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Divider -->
                                                    <hr class="my-3">
                                                <?php endforeach; ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
                                    <div class="os-scrollbar-track os-scrollbar-track-off">
                                        <div class="os-scrollbar-handle"
                                            style="width: 97.1154%; transform: translate(0px, 0px);"></div>
                                    </div>
                                </div>
                                <div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden">
                                    <div class="os-scrollbar-track os-scrollbar-track-off">
                                        <div class="os-scrollbar-handle"
                                            style="height: 94.8509%; transform: translate(0px, 18px);"></div>
                                    </div>
                                </div>
                                <div class="os-scrollbar-corner"></div>
                            </div>
                        </div>
                        <!-- Card body END -->

                        <!-- Card footer -->
                        <div class="card-footer border-top text-center p-3">
                            <a href="<?= base_url('message/admin') ?>">View all Notice List</a>
                        </div>
                    </div>
                    <!-- Notice board END -->
                </div>

            </div>
        </div>

    </section>
    <!-- ======================= Main contain END -->
</main>
<!-- **************** MAIN CONTENT END **************** -->
</div>
<!-- /.container-fluid -->

<!-- Modal -->