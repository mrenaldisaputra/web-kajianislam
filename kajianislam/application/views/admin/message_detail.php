<div class="container mt-5">

    <h1 class="h3 mb-4 text-gray-800">
        <?= $title; ?>
    </h1>
    
    <div class="card">
        <div class="card-header">
            <h5 class="card-title"><?= $message['subject'] ?></h5>
            <p class="card-subtitle"><?php
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
            ?></p>
        </div>
        <div class="card-body">
            <h6 class="card-subtitle mb-2 text-muted">From: <?= $message['name'] ?> - <?= $message['email'] ?></h6>
            <p class="card-text"><?= nl2br($message['message']) ?></p>
            <a href="<?= base_url('admin/dashboard') ?>" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
</div>
</div>