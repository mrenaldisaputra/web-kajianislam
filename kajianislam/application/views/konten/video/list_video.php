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




    <div class="mb-3">
        <a href="<?= base_url('video/new_video') ?>" class="btn btn-success">
            <i class="bi bi-plus-lg"></i> Tambah Video
        </a>
    </div>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table id="table2" class="table table-bordered table-striped" width="100%" cellspacing="0">
                    <thead>
                        <tr class="text-center">
                            <th width="3%">No</th>
                            <th width="3%">ID</th>
                            <th width="3%">Kategori</th>
                            <th width="8%">Gambar</th>
                            <th width="15%">Judul</th>
                            <th width="20%">Deskripsi</th>
                            <th width="10%">Tanggal</th>
                            <th width="5%">Status</th>
                            <th width="15%">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1; // Inisialisasi nomor
                        foreach ($list_video as $video): // Mulai loop untuk setiap baris data 
                            ?>
                            <tr>
                                <td class="text-center">
                                    <?= $no++; ?>
                                </td>
                                <td class="text-center">
                                    <?= $video['id']; ?>
                                </td>
                                <td class="text-center">
                                    <?= $video['id_kategori']; ?>
                                </td>
                                <td class="text-center">
                                    <img src="<?= base_url('assets/img/video/') . $video['gambar']; ?>"
                                        class="img-thumbnail img-resized" style="max-width: 100px;">
                                </td>
                                <td>
                                    <?= $video['judul']; ?>
                                </td>
                                <td>
                                    <?= $video['deskripsi']; ?>
                                </td>
                                <td class="text-center">
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
                                    <?= $video['status']; ?>
                                </td>

                                <div class="row-container">
                                    <td class="text-center button-container">
                                        <!-- Detail button -->
                                        <button type="button" class="btn btn-primary btn-sm mr-2"
                                            onclick="location.href='<?= base_url('video/detail_video/') . $video['id'] ?>'">
                                            <span class="icon"><i class="bi bi-info-circle-fill"></i></span>
                                        </button>

                                        <!-- Edit button -->
                                        <button class="btn btn-warning btn-sm mr-2" data-bs-toggle="modal"
                                            onclick="location.href='<?= base_url('video/edit_video/') . $video['id'] ?>'">
                                            <span class="icon"><i class="bi bi-pencil"></i></span>
                                        </button>

                                        <!-- Delete button -->
                                        <button class="btn btn-danger btn-sm" data-bs-toggle="modal"
                                            data-bs-target="#deleteVideo<?= $video['id'] ?>">
                                            <span class="icon"><i class="bi bi-trash"></i></span>
                                        </button>
                                    </td>
                                </div>

                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>




    <!-- Modal Hapus -->
    <?php foreach ($list_video as $video) { ?>
        <div class="modal fade" id="deleteVideo<?= $video['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Hapus Video</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        Apakah Anda ingin menghapus video ini?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batalkan</button>
                        <button type="button" class="btn btn-primary btn-delete-video"
                            data-video-id="<?= $video['id'] ?>">Hapus
                        </button>

                    </div>
                </div>
            </div>
        </div>
    <?php } ?>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->