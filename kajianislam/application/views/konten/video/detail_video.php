<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">
        <?= $title; ?>
    </h1>

    <div class="row">
        <div class="col-lg-8">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="form-group">
                        <img src="<?= base_url('./assets/img/video/') . $video['gambar']; ?>"
                            class="img-thumbnail img-rezized" alt="Preview Gambar" style="max-width: 500px;">
                    </div>
                    <div class=" form-group">
                        <label>ID</label>
                        <input type="text" class="form-control col-1" value="<?= $video['id']; ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Judul</label>
                        <input type="text" class="form-control" value="<?= $video['judul']; ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Deskripsi Singkat</label>
                        <textarea class="form-control" rows="3" readonly><?= $video['deskripsi']; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label>Tanggal</label>
                        <input type="datatime-local" id="post_date" class="form-control col-4" value="<?php
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

                        // Mengambil nama hari berdasarkan timestamp
                        $hari = $hariIndonesia[date('w', $timestamp)];

                        // Mengambil tanggal tanpa leading zero
                        $tanggal = date('j', $timestamp);

                        // Mengambil nama bulan berdasarkan timestamp
                        $bulan = $bulanIndonesia[(int) date('m', $timestamp)];

                        // Mengambil tahun dari timestamp
                        $tahun = date('Y', $timestamp);

                        // Mengambil waktu (jam dan menit) dari timestamp
                        $jam = date('H:i', $timestamp);

                        // Menggabungkan semua bagian untuk membuat format tanggal bahasa Indonesia
                        $tanggalFormatted = "$hari, $tanggal $bulan $tahun $jam WIB";

                        // Menampilkan tanggal yang sudah diformat
                        echo $tanggalFormatted;
                        ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Isi video</label>
                        <div class="form-control" contenteditable="false" style="min-height: 500px; overflow-y: auto;">
                            <?= htmlspecialchars_decode($video['isi']); ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>URL Video</label>
                        <input type="text" class="form-control" value="<?= $video['urlvideo']; ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label>Kategori</label>
                        <input type="text" class="form-control col-3" value="<?= $kategoriNama; ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <input type="text" class="form-control col-3" value="<?= $video['status']; ?>" readonly>
                    </div>

                    <div>
                        <a class="btn btn-secondary" type="button"
                            href=" <?= base_url('video/list_video') ?>">Cancel</a>

                    </div>




                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

</div>