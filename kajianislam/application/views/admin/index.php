<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">
        <?= $title; ?>
    </h1>

    <div class="row">
        <div class="col-lg-6">
            <?= $this->session->flashdata('message'); ?>
        </div>
    </div>

    <div class=" card mb-3" style="max-width: 720px;">
        <div>
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="<?= base_url('assets/img/profile/') . $tb_admin['image']; ?>" class="card-img img-fluid">
                </div>

                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">
                            <?= $tb_admin['nama']; ?>
                        </h5>
                        <p class="card-text">
                            <?= $tb_admin['email']; ?>
                        </p>
                        <br>
                        <p class="card-text">
                        <h6 class="text-body-secondary">
                            <?php
                            // Pengecekan nilai role_id
                            if ($tb_admin['role_id'] == 1) {
                                echo "Administrator";
                            } else {
                                echo "Member";
                            }
                            ?>
                        </h6>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->