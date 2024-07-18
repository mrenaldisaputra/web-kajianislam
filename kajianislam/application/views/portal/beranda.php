<!-- **************** MAIN CONTENT START **************** -->
<main>

    <section class="position-relative d-none d-md-block">
        <div class="container">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
                <div class="carousel-inner rounded-5 cover-carousel"> <!-- Tambahkan class cover-carousel -->
                    <?php $i = 0; ?>
                    <?php foreach ($list_artikel as $artikel): ?>
                        <?php if ($i < 3): ?>
                            <div class="carousel-item <?php if ($i == 0)
                                echo 'active'; ?>">
                                <!-- Perhatikan penggunaan class active -->
                                <a href="<?= base_url('portal/artikel/') . $artikel['id'] ?>">
                                    <img src="<?= base_url('assets/img/artikel/') . (($artikel['gambar'] === 'no_image.png') ? $artikel['gambar'] : $artikel['gambar']) ?>"
                                        class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-md-block d-flex align-items-center p-3 p-sm-4">
                                        <div class="w-100 mt-auto">
                                            <h2 class="text-white h1"><a
                                                    href="<?= base_url('portal/artikel/') . $artikel['id'] ?>"
                                                    class="btn-link stretched-link text-reset"><?= $artikel['judul'] ?></a></h2>
                                            <ul
                                                class="nav nav-divider text-white-force align-items-center d-sm-inline-block pb-4">
                                                <li class="nav-item"></i><?= $artikel['kategori'] ?></li>
                                                <li class="nav-item"><?= $artikel['tanggal_formatted'] ?></li>
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <?php $i++; ?>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </section>




    <!-- =======================
Main hero START -->
    <section class="pt-4 pb-5 card-grid">
        <div class="container">
            <!-- Title -->
            <div class="mb-4">
                <h2 class="m-0"><i class="bi bi-hourglass-top me-2"></i>Today's top highlights</h2>
            </div>
            <div class="row g-4">
                <!-- Left big card -->
                <div class="col-lg-6">
                    <?php if (isset($most_viewed[0])): ?>
                        <?php
                        $kategori_dir = 'assets/img/' . $most_viewed[0]['kategori'] . '/';
                        $image_url = base_url($kategori_dir . $most_viewed[0]['gambar']);
                        ?>
                        <div class="card card-overlay-bottom card-grid-lg card-bg-scale"
                            style="background-image:url(<?= $image_url; ?>); background-position: center left; background-size: cover;">
                            <!-- Card featured -->
                            <span class="card-featured" title="Featured post"><i class="fas fa-star"></i></span>
                            <!-- Card Image overlay -->
                            <div class="card-img-overlay d-flex align-items-center p-3 p-sm-4">
                                <div class="w-100 mt-auto">
                                    <!-- Card category -->
                                    <a href="#" class="badge text-bg-dark mb-2"><i
                                            class="fas fa-circle me-2 small fw-bold"></i><?= ucfirst($most_viewed[0]['kategori']); ?></a>
                                    <!-- Card title -->
                                    <h2 class="text-white h1"><a
                                            href="<?= base_url('portal/' . $most_viewed[0]['kategori'] . '/' . $most_viewed[0]['id']); ?>"
                                            class="btn-link stretched-link text-reset"><?= $most_viewed[0]['judul']; ?></a>
                                    </h2>
                                    <!-- Card info -->
                                    <ul class="nav nav-divider text-white-force align-items-center d-sm-inline-block">
                                        <li class="nav-item">
                                            <?php
                                            // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                            date_default_timezone_set('Asia/Jakarta');

                                            // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                            $tanggalDb = $most_viewed[0]['tanggal'];

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
                                            ?>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>

                <!-- Right small cards -->
                <div class="col-lg-6">
                    <div class="row g-4">
                        <?php if (isset($most_viewed[1])): ?>
                            <?php
                            $kategori_dir = 'assets/img/' . $most_viewed[1]['kategori'] . '/';
                            $image_url = base_url($kategori_dir . $most_viewed[1]['gambar']);
                            ?>
                            <!-- Card item START -->
                            <div class="col-12">
                                <div class="card card-overlay-bottom card-grid-sm card-bg-scale"
                                    style="background-image:url(<?= $image_url; ?>); background-position: center left; background-size: cover;">
                                    <!-- Card Image -->
                                    <!-- Card Image overlay -->
                                    <div class="card-img-overlay d-flex align-items-center p-3 p-sm-4">
                                        <div class="w-100 mt-auto">
                                            <!-- Card category -->
                                            <a href="#" class="badge text-bg-dark mb-2"><i
                                                    class="fas fa-circle me-2 small fw-bold"></i><?= ucfirst($most_viewed[1]['kategori']); ?></a>
                                            <!-- Card title -->
                                            <h4 class="text-white"><a
                                                    href="<?= base_url('portal/' . $most_viewed[1]['kategori'] . '/' . $most_viewed[1]['id']); ?>"
                                                    class="btn-link stretched-link text-reset"><?= $most_viewed[1]['judul']; ?></a>
                                            </h4>
                                            <!-- Card info -->
                                            <ul
                                                class="nav nav-divider text-white-force align-items-center d-sm-inline-block">
                                                <li class="nav-item">
                                                    <?php
                                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                    date_default_timezone_set('Asia/Jakarta');

                                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                    $tanggalDb = $most_viewed[1]['tanggal'];

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
                                                    ?>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card item END -->
                        <?php endif; ?>

                        <?php if (isset($most_viewed[2])): ?>
                            <?php
                            $kategori_dir = 'assets/img/' . $most_viewed[2]['kategori'] . '/';
                            $image_url = base_url($kategori_dir . $most_viewed[2]['gambar']);
                            ?>
                            <!-- Card item START -->
                            <div class="col-12">
                                <div class="card card-overlay-bottom card-grid-sm card-bg-scale"
                                    style="background-image:url(<?= $image_url; ?>); background-position: center left; background-size: cover;">
                                    <!-- Card Image -->
                                    <!-- Card Image overlay -->
                                    <div class="card-img-overlay d-flex align-items-center p-3 p-sm-4">
                                        <div class="w-100 mt-auto">
                                            <!-- Card category -->
                                            <a href="#" class="badge text-bg-dark mb-2"><i
                                                    class="fas fa-circle me-2 small fw-bold"></i><?= ucfirst($most_viewed[2]['kategori']); ?></a>
                                            <!-- Card title -->
                                            <h4 class="text-white"><a
                                                    href="<?= base_url('portal/' . $most_viewed[2]['kategori'] . '/' . $most_viewed[2]['id']); ?>"
                                                    class="btn-link stretched-link text-reset"><?= $most_viewed[2]['judul']; ?></a>
                                            </h4>
                                            <!-- Card info -->
                                            <ul
                                                class="nav nav-divider text-white-force align-items-center d-sm-inline-block">
                                                <li class="nav-item">
                                                    <?php
                                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                    date_default_timezone_set('Asia/Jakarta');

                                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                    $tanggalDb = $most_viewed[2]['tanggal'];

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
                                                    ?>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card item END -->
                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </div>
    </section>




    <!-- =======================
Main hero END -->

    <div class="container">
        <!-- Divider -->
        <div class="border-bottom border-2 border-primary opacity-1"></div>
    </div>

    <!-- =======================
Main content START -->
    <section class="position-relative">
        <div class="container" data-sticky-container>
            <div class="row">
                <!-- Main Post START -->
                <div class="col-lg-9">
                    <!-- Title -->
                    <div class="row">
                        <!-- Title -->
                        <div class="col-md-12">
                            <div class="mb-4 d-md-flex justify-content-between align-items-center">
                                <h2 class="m-0"><i class="bi bi-caret-right-fill"></i> Pilihan Do'a</h2>
                                <a href="<?= base_url('portal/list_doa') ?>"
                                    class="text-body fw-bold d-none d-sm-block"><u>Lihat Selengkapnya <i
                                            class="bi bi-arrow-right ms-1"></i></u></a>
                            </div>
                        </div>
                    </div>

                    <div class="row gy-4">
                        <!-- Card item START -->
                        <?php $this->db->select('*');
                        $this->db->from('tb_doa');
                        $this->db->where('status', 'Aktif');
                        $this->db->order_by('tanggal', 'DESC'); // Tambahkan kondisi WHERE untuk filter status 'Aktif'
                        $this->db->limit(4); // Batasi jumlah data menjadi 6
                        $list_doa = $this->db->get()->result_array();
                        foreach ($list_doa as $doa):
                            $kategori = $this->db->get_where('tb_kategori', ['id_kategori' => $doa['id_kategori']])->row_array(); ?>
                            <div class="col-sm-6">
                                <div class="card">
                                    <!-- Card img -->
                                    <div class="position-relative">
                                        <img class="image-cover"
                                            src="<?= base_url('assets/img/doa/') . (($doa['gambar'] === 'no_image.png') ? $doa['gambar'] : $doa['gambar']) ?>"
                                            alt="Card image">
                                    </div>
                                    <div class="card-body px-0 pt-3">
                                        <!-- Sponsored Post -->
                                        <a href="<?= base_url('portal/doa/') . $doa['id'] ?>"
                                            class="badge text-bg-dark mb-2"><i class="fas fa-circle me-2 small fw-bold"></i>
                                            <?= $kategori['nama']; ?>
                                        </a>
                                        <h4 class="card-title mt-2"><a href="<?= base_url('portal/doa/') . $doa['id'] ?>"
                                                class="btn-link stretched-link text-reset fw-bold">
                                                <?= $doa['judul']; ?>
                                            </a></h4>
                                        <!-- Card info -->
                                        <ul class="nav nav-divider align-items-center d-sm-inline-block">
                                            <li class="nav-item">
                                                <?php
                                                // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                date_default_timezone_set('Asia/Jakarta');

                                                // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                $tanggalDb = $doa['tanggal'];

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
                                                ?>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                        <div class="col-12 text-center mt-5 w-100 mt-4 d-md-none">
                            <a href="<?= base_url('portal/list_doa') ?>" type="button" class="btn btn-success-soft">
                                Lihat Pilihan Do'a lainnya <i class="bi bi-arrow-right ms-2 align-middle"></i>
                            </a>
                        </div>
                        <!-- Card item END -->
                        <div class="border-bottom border-2 border-primary opacity-1"></div>

                        <div class="row pt-5">
                            <div class="row">
                                <!-- Title -->
                                <div class="col-md-12 pb-3">
                                    <div class="mb-4 d-md-flex justify-content-between align-items-center">
                                        <h2 class="m-0"><i class="bi bi-caret-right-fill"></i></i> Artikel</h2>
                                        <a href="<?= base_url('portal/list_artikel') ?>"
                                            class="text-body fw-bold d-none d-sm-block"><u>Lihat Selengkapnya <i
                                                    class="bi bi-arrow-right ms-1"></i></u></a>
                                    </div>
                                </div>
                            </div>
                            <!-- Recent post widget START -->
                            <?php $this->db->select('*');
                            $this->db->from('tb_artikel');
                            $this->db->where('status', 'Aktif');
                            $this->db->order_by('tanggal', 'DESC'); // Tambahkan kondisi WHERE untuk filter status 'Aktif'
                            $this->db->limit(10); // Batasi jumlah data menjadi 6
                            $list_artikel = $this->db->get()->result_array();
                            foreach ($list_artikel as $artikel):
                                $kategori = $this->db->get_where('tb_kategori', ['id_kategori' => $artikel['id_kategori']])->row_array(); ?>
                                <div class="card mb-3 mb-sm-4">
                                    <div class="row g-3">
                                        <div class="col-4">
                                            <img class="image-cover"
                                                src="<?= base_url('assets/img/artikel/') . (($artikel['gambar'] === 'no_image.png') ? $artikel['gambar'] : $artikel['gambar']) ?>"
                                                alt="">
                                        </div>
                                        <div class="col-8">
                                            <a href="<?= base_url('portal/artikel/') . $artikel['id'] ?>"
                                                class="badge text-bg-dark mb-2"><i
                                                    class="fas fa-circle me-2 small fw-bold"></i>
                                                <?= $kategori['nama']; ?>
                                            </a>
                                            <h4><a href="<?= base_url('portal/artikel/') . $artikel['id'] ?>"
                                                    class="btn-link stretched-link text-reset fw-bold">
                                                    <?= $artikel['judul']; ?>
                                                </a></h4>
                                            <div class="nav nav-divider align-items-center d-sm-inline-block">
                                                <?php
                                                // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                date_default_timezone_set('Asia/Jakarta');

                                                // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                $tanggalDb = $artikel['tanggal'];

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
                                                ?>
                                            </div>
                                            <div class="mt-3 line-clamp">
                                                <?= get_excerpt(strip_html_tags($artikel['deskripsi']), 28); ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                        <div class="col-12 text-center mt-5 w-100 mt-4">
                            <a href="<?= base_url('portal/list_artikel') ?>" class="btn btn-success-soft">
                                Lihat Artikel lainnya <i class="bi bi-arrow-right ms-2 align-middle"></i>
                            </a>
                        </div>
                        <!-- Recent post widget END -->
                    </div>
                </div>


                <!-- Main Post END -->

            </div> <!-- Row end -->
        </div>
    </section>
    <!-- =======================
Main content END -->

    <!-- Divider -->
    <div class="container">
        <div class="border-bottom border-primary border-2 opacity-1"></div>
    </div>

    <!-- =======================
Section START -->

    <section class="pt-4">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <!-- Title -->
                    <div class="row">
                        <!-- Title -->
                        <div class="col-md-12 pb-3">
                            <div class="mb-4 d-md-flex justify-content-between align-items-center">
                                <h2 href="#" class="m-0"><i class="bi bi-caret-right-fill"></i> Video</h2>
                                <a href="<?= base_url('portal/list_video') ?>"
                                    class="text-body fw-bold d-none d-md-block"><u>Lihat Selengkapnya <i
                                            class="bi bi-arrow-right ms-1"></i></u></a>
                            </div>
                        </div>
                    </div>
                    <div class="list-content">
                        <div class="row gy-4">
                            <?php $this->db->select('*');
                            $this->db->from('tb_video');
                            $this->db->where('status', 'Aktif');
                            $this->db->order_by('tanggal', 'DESC');
                            $this->db->limit(6); // Batasi jumlah data menjadi 6
                            $list_video = $this->db->get()->result_array();
                            foreach ($list_video as $video):
                                $kategori = $this->db->get_where('tb_kategori', ['id_kategori' => $video['id_kategori']])->row_array(); ?>
                                <!-- Card item START -->
                                <div class="col-sm-4">
                                    <div class="card">
                                        <!-- Card img -->
                                        <div class="position-relative">
                                            <img class="image-cover"
                                                src="<?= base_url('assets/img/video/') . (($video['gambar'] === 'no_image.png') ? $video['gambar'] : $video['gambar']) ?>"
                                                alt="Card image">
                                        </div>
                                        <div class="card-body px-0 pt-3">
                                            <a href="<?= base_url('portal/video/') . $video['id'] ?>"
                                                class="badge text-bg-dark mb-2"><i
                                                    class="fas fa-circle me-2 small fw-bold"></i>
                                                <?= $kategori['nama']; ?>
                                            </a>

                                            <h4 class="card-title mt-2"><a
                                                    href="<?= base_url('portal/video/') . $video['id'] ?>"
                                                    class="btn-link stretched-link text-reset fw-bold">
                                                    <?= $video['judul']; ?>
                                                </a></h4>
                                            <!-- Card info -->
                                            <ul class="nav nav-divider align-items-center d-sm-inline-block">
                                                <li class="nav-item">
                                                    <?php
                                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                    date_default_timezone_set('Asia/Jakarta');

                                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                    $tanggalDb = $video['tanggal'];

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
                                                    ?>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                            <!-- Card item END -->
                            <div class="col-12 text-center mt-5 w-100 mt-4 d-md-none">
                                <a href="<?= base_url('portal/list_video') ?>" type="button"
                                    class="btn btn-success-soft">
                                    Lihat Video lainnya <i class="bi bi-arrow-right ms-2 align-middle"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

    <!-- =======================
Section END -->
    <!-- =======================
Section END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->