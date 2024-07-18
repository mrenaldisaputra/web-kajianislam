<main>
    <section class="position-relative">
        <div class="container" data-sticky-container>
            <div class="row">
                <!-- Main Content START -->
                <div class="col-lg-8">
                    <a class="badge text-bg-dark mb-2"><i class="fas fa-circle me-2 fw-bold">
                            <?= $video['kategori_nama']; ?>
                        </i> </a>
                    <span class="ms-2 small">
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
                    </span>
                    <h1 class="display-5 mb-4">
                        <?= $video['judul']; ?>
                    </h1>

                    <div class="sce__detailVideobox">
                        <div class="sce__detailVideoboxImg"
                            style="background-image: url('<?= base_url('assets/img/video/') . $video['gambar']; ?>');">
                            <?php if (isset($video_id) && !empty($video_id)): ?>
                                <div class="sce__detailVideoboxFade sce__detailVideoboxClick"
                                    data-youtube-id="<?= $video_id; ?>">
                                    <img class="sce__detailVideoboxIcon" src="<?= base_url('assets/img/play-icon.png'); ?>"
                                        alt="Play Icon">
                                </div>
                            <?php endif; ?>
                        </div>
                        <?php if (isset($video_id) && !empty($video_id)): ?>
                            <div class="sce__detailVideoboxPlayer embed-responsive embed-responsive-16by9"
                                style="display:none;">
                                <iframe class="embed-responsive-item" src="" frameborder="0"
                                    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen></iframe>
                            </div>
                        <?php endif; ?>
                    </div>



                    <p>
                        <?= $video['isi'] ?>
                    </p>


                </div>
                <!-- Main Content END -->
            </div>
        </div>
    </section>
    <!-- =======================
Main END -->

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
                    <div class="mb-4 d-md-flex justify-content-between align-items-center">
                        <h2 class="m-0"><i class="bi bi-megaphone me-2"></i> Konten Terkait </h2>
                    </div>
                    <div class="list-content">
                        <div class="row gy-4">
                            <?php $this->db->select('*');
                            $this->db->from('tb_video');
                            $this->db->where('status', 'Aktif'); // Tambahkan kondisi WHERE untuk filter status 'Aktif'
                            $this->db->limit(4); // Batasi jumlah data menjadi 6
                            $this->db->order_by('RAND()'); // Tambahkan ORDER BY RAND() untuk mengacak data
                            $list_video = $this->db->get()->result_array();
                            foreach ($list_video as $video):
                                $kategori = $this->db->get_where('tb_kategori', ['id_kategori' => $video['id_kategori']])->row_array(); ?>
                                <!-- Card item START -->
                                <div class="col-sm-3">
                                    <div class="card">
                                        <!-- Card img -->
                                        <div class="position-relative">
                                            <img class="image-cover"
                                                src="<?= base_url('assets/img/video/') . (($video['gambar'] === 'no_image.png') ? $video['gambar'] : $video['gambar']) ?>"
                                                alt="Card image">
                                        </div>
                                        <div class="card-body px-0 pt-3">
                                            <a href="#" class="badge text-bg-dark mb-2"><i
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
                        </div>
                    </div>
                </div>
            </div>
    </section>



</main>
<!-- **************** MAIN CONTENT END **************** -->