<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">
        <?= $title; ?>
    </h1>

    <!-- Icon tambah akun -->

    <?= $this->session->flashdata('message'); ?>
    <!-- Element untuk menampilkan pesan konfirmasi -->
    <!-- Tampilkan pesan konfirmasi jika ada -->
    <div id="confirmationMessage" class="alert alert-success" style="display: none;">
        <!-- Pesan konfirmasi akan ditampilkan di sini -->
    </div>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table id="table1" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr class="text-center">
                            <th width="3%">No</th>
                            <th width="20%">Nama</th>
                            <th width="10%">Email</th>
                            <th width="35%">Subject</th>
                            <th width="20%">Waktu</th>
                            <th width="10%">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1; // Inisialisasi nomor
                        foreach ($list_admin as $message): // Mulai loop untuk setiap baris data 
                            ?>
                            <tr>
                                <td class="text-center dt-no-order">
                                    <?= $no++; ?>
                                </td>
                                <td>
                                    <?= $message['name']; ?>
                                </td>
                                <td>
                                    <?= $message['email']; ?>
                                </td>
                                <td>
                                    <?= $message['subject']; ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                    date_default_timezone_set('Asia/Jakarta');

                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                    $tanggalDb = $message['created_at'];
                                    ;

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
                                    ?>
                                </td>
                                <td class="text-center">
                                    <!-- Detail button -->
                                    <a type="button" class="btn btn-primary btn-sm mr-2 "
                                        href="<?= base_url('admin/message_detail/' . $message['id']) ?>">
                                        <span class="icon"><i class="bi bi-info-circle-fill"></i></span>
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->