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
        <a href="<?= base_url('admin/newAdmin') ?>" class="btn btn-success">
            <i class="bi bi-person-plus-fill"></i> Tambah Akun
        </a>
    </div>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table id="table2" class="table table-bordered" width="100%" cellspacing="0">
                    <thead>
                        <tr class="text-center">
                            <th>No</th>
                            <th>ID</th>
                            <th>Nama</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Login Terakhir</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1; // Inisialisasi nomor
                        foreach ($list_admin as $admin): // Mulai loop untuk setiap baris data 
                            ?>
                            <tr>
                                <td class="text-center">
                                    <?= $no++; ?>
                                </td>
                                <td class="text-center">
                                    <?= $admin['id']; ?>
                                </td>
                                <td>
                                    <?= $admin['nama']; ?>
                                </td>
                                <td>
                                    <?= $admin['email']; ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    if ($admin['status'] == 1) {
                                        echo "Aktif";
                                    } else {
                                        echo "Nonaktif";
                                    } ?>
                                </td>
                                <td class="text-center">
                                    <?php
                                    // Setel zona waktu ke zona waktu Indonesia, misal WIB
                                    date_default_timezone_set('Asia/Jakarta');

                                    // Contoh tanggal dari database: '2023-11-22 18:51:00'
                                    $tanggalDb = $admin['last_login'];

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
                                    <button type="button" class="btn btn-primary btn-sm mr-2 " data-bs-toggle="modal"
                                        data-bs-target="#detailAdmin<?= $admin['id'] ?>">
                                        <span class="icon"><i class="bi bi-info-circle-fill"></i></span>
                                    </button>

                                    <!-- Edit button -->
                                    <button class="btn btn-warning btn-sm mr-2" data-bs-toggle="modal"
                                        data-bs-target="#editAdmin<?= $admin['id'] ?>">
                                        <span class="icon"><i class="bi bi-pencil"></i></span>
                                    </button>

                                    <!-- Delete button -->
                                    <button class="btn btn-danger btn-sm" data-bs-toggle="modal"
                                        data-bs-target="#deleteAdmin<?= $admin['id'] ?>">
                                        <span class="icon"><i class="bi bi-trash"></i></span>
                                    </button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>



    <!-- Modal Detail -->
    <?php foreach ($list_admin as $admin): ?>
        <div class="modal fade" id="detailAdmin<?= $admin['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detail Akun</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <section style="background-color: #eee;">
                            <div class="container py-4">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="card mb-6">
                                            <div class="card-body d-flex justify-content-center align-items-center">
                                                <img src="<?php echo base_url('assets/img/profile/') . $admin['image']; ?>"
                                                    alt="avatar" class="rounded-circle img-fluid" style="width: 340px;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">ID</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">
                                                            <?php echo $admin['id']; ?>
                                                        </p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Nama</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">
                                                            <?php echo $admin['nama']; ?>
                                                        </p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Email</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0">
                                                            <?php echo $admin['email']; ?>
                                                        </p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Role</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0"><?php
                                                        if ($admin['status'] == 1) {
                                                            echo "Administrator";
                                                        } else {
                                                            echo "Super Administrator";
                                                        } ?>
                                                        </p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Status</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0"><?php
                                                        if ($admin['status'] == 1) {
                                                            echo "Aktif";
                                                        } else {
                                                            echo "Nonaktif";
                                                        } ?>
                                                        </p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <p class="mb-0">Akun dibuat</p>
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <p class="text-muted mb-0"><?php echo $admin['created_at']; ?>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; ?>


    <!-- Modal Edit -->
    <?php foreach ($list_admin as $admin): ?>
        <div class="modal fade" id="editAdmin<?= $admin['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Akun</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form class="admin" method="post" action="<?= base_url('admin/editAdmin/' . $admin['id']); ?>">
                            <!-- Form untuk mengedit data admin -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group row">
                                        <label for="email" class="col-sm-4 col-form-label">Email</label>
                                        <div class="col-sm">
                                            <input type="text" class="form-control" id="email" name="email"
                                                value="<?= $admin['email']; ?>" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="nama" class="col-sm-4 col-form-label">Nama Lengkap</label>
                                        <div class="col-sm">
                                            <input type="text" class="form-control" id="nama" name="nama"
                                                value="<?= $admin['nama']; ?>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="status" class="col-sm-4 col-form-label">Status</label>
                                        <div class="col-sm">
                                            <select class="custom-select" id="status" name="status" aria-label="Status">
                                                <?php
                                                $adminStatus = $admin['status'];
                                                $options = array(
                                                    1 => 'Aktif',
                                                    0 => 'Nonaktif'
                                                );
                                                foreach ($options as $value => $label) {
                                                    $selected = ($adminStatus == $value) ? 'selected' : '';
                                                    echo "<option value=\"$value\" $selected>$label</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batalkan</button>
                                <button type="submit" class="btn btn-primary">Simpan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; ?>



    <!-- Modal Hapus -->
    <?php foreach ($list_admin as $admin) { ?>
        <div class="modal fade" id="deleteAdmin<?= $admin['id'] ?>" tabindex="-1" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Hapus Akun</h5>
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        Apakah Anda ingin menghapus Akun?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batalkan</button>
                        <button type="button" class="btn btn-primary btn-delete" data-admin-id="<?= $admin['id'] ?>">Hapus
                            Akun</button>

                    </div>
                </div>
            </div>
        </div>
    <?php } ?>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->