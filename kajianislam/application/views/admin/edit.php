<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">
        <?= $title; ?>
    </h1>

    <div class="row">
        <div class="col-lg-8">

            <?= form_open_multipart('admin/edit'); ?>
            <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="email" name="email" value="<?= $tb_admin['email']; ?>"
                        readonly>
                </div>
            </div>

            <div class="form-group row">
                <label for="nama" class="col-sm-2 col-form-label">Nama Lengkap</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="nama" name="nama" value="<?= $tb_admin['nama']; ?>">
                    <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
                </div>
            </div>

            <div class=" form-group row">
                <label for="picture" class="col-sm-2 col-form-label">Foto Profil</label>
                <div class="col-sm-10">
                    <div class="row">
                        <div class="col-sm-3">
                            <img src="<?= base_url('assets/img/profile/') . $tb_admin['image']; ?>"
                                class="img-thumbnail img-resized">
                        </div>
                        <div class="col-sm-4">
                            <div class="input-group mb-4">
                                <input type="file" class="form-control" id="image" name='image'>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row justify-content-end">
                <div class="col-sm-12"></div> <!-- Spacer column -->
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Edit</button>
                </div>
            </div>

        </div>
    </div>
</div>

</div>
<!-- End of Main Content -->