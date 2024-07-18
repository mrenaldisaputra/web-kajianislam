<!-- **************** MAIN CONTENT START **************** -->
<main>
    <!-- =======================
Main content START -->
    <section class="position-relative">
        <div class="container" data-sticky-container>
            <div class="row">
                <!-- Main Post START -->
                <div class="col-lg-8">
                    <!-- Title -->
                    <div class="row gy-4">
                        <!-- Card item START -->
                        <div class="row pt-5">
                            <div class="row">
                                <!-- Title -->
                                <div class="col-md-12 pb-3">
                                    <div class="mb-4 d-md-flex justify-content-between align-items-center">
                                        <h2 class="m-0"><i class="bi bi-caret-right-fill"></i></i> Hasil Pencarian untuk
                                            "<?= $keyword; ?>"</h2>
                                    </div>
                                </div>
                            </div>
                            <!-- Recent post widget START -->
                            <?php if (!empty($search_results)): ?>
                                <?php foreach ($search_results as $result): ?>
                                    <div class="card mb-3 mb-sm-4">
                                        <div class="row g-3">
                                            <div class="col-4">
                                                <img class="image-cover"
                                                    src="<?= base_url('assets/img/' . $result['kategori'] . '/') . $result['gambar']; ?>"
                                                    alt="">
                                            </div>
                                            <div class="col-8">
                                                <a href="<?= base_url('portal/' . $result['kategori'] . '/') . $result['id']; ?>"
                                                    class="badge text-bg-dark mb-2"><i
                                                        class="fas fa-circle me-2 small fw-bold"></i>
                                                    <?= ucfirst($result['kategori']); ?>
                                                </a>
                                                <h4><a href="<?= base_url('portal/' . $result['kategori'] . '/') . $result['id']; ?>"
                                                        class="btn-link stretched-link text-reset fw-bold">
                                                        <?= $result['judul']; ?>
                                                    </a></h4>
                                                <div class="nav nav-divider align-items-center d-sm-inline-block">
                                                    <?php
                                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                                    date_default_timezone_set('Asia/Jakarta');

                                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                                    $tanggalDb = $result['tanggal'];

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
                                                    <?= get_excerpt(strip_html_tags($result['deskripsi']), 15); ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <p>Tidak ada hasil yang ditemukan untuk "
                                    <?php echo $keyword; ?>"
                                </p>
                            <?php endif; ?>
                            <!-- Recent post widget END -->
                        </div>
                    </div>
                </div>
                <!-- Main Post END -->

                <!-- Sidebar START -->
                <div class="col-lg-4 mt-5 mt-lg-0">
                    <div data-sticky data-margin-top="80" data-sticky-for="767">
                        <div class="row">
                            <div>
                                <h4 class="mt-5 mb-3">Rekomendasi Anda</h4>
                                <?php foreach ($most_viewed as $key => $most): ?>
                                    <div class="d-flex position-relative mb-3">
                                        <span class="me-3 fa-fw fw-bold fs-3 opacity-5"><?php echo $key + 1; ?></span>
                                        <h6><a href="
                                        <?= base_url('portal/' . $most['kategori'] . '/') . $most['id'] ?>"
                                                class="stretched-link">
                                                <?php echo $most['judul']; ?></a></h6>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sidebar END -->
            </div>
        </div>
    </section>
    <!-- =======================
Main content END -->

    <!-- Divider -->
    <div class="container">
        <div class="border-bottom border-primary border-2 opacity-1"></div>
    </div>
</main>
<!-- **************** MAIN CONTENT END **************** -->