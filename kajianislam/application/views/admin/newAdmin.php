<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">
        <?= $title; ?>
    </h1>

    <div class="row">
        <div class="col-lg-8">

            <?= $this->session->flashdata('message'); ?>

            <form class="admin" method="post" action="<?= base_url('admin/newAdmin'); ?>">
                <div class="form-group row">
                    <label for="nama" class="col-sm-2 col-form-label">Nama Lengkap</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="nama" name="nama" value="<?= set_value('nama') ?>">
                        <?= form_error('nama', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                </div>

                <div class=" form-group row">
                    <label for="email" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="email" name="email"
                            value="<?= set_value('email') ?>">
                        <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="password1" class="col-sm-2 col-form-label">Masukan Password</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="password1" name="password1"
                            value="<?= set_value('password1') ?>">
                        <?= form_error('password1', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="password2" class="col-sm-2 col-form-label">Konfirmasi Password</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="password2" name="password2"
                            value="<?= set_value('password2') ?>">
                        <?= form_error('password2', '<small class="text-danger pl-3">', '</small>'); ?>
                    </div>
                </div>

                <div class="form-group row justify-content-end">
                    <div class="col-sm-12"></div> <!-- Spacer column -->
                    <div class="col-sm-10">
                        <br>
                        <button type="submit" class="btn btn-primary">Tambah Akun</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</div>
<!-- End of Main Content -->