<!-- Begin Page Content -->
<div class="container">

    <!-- Page Heading -->
    <h1 class="h3 mb-4 text-gray-800">
        <?= $title; ?>
    </h1>

    <?= $this->session->flashdata('message'); ?>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr class="text-center">
                            <th width="20%">Tampilan</th>
                            <th width="30%">Konten</th>
                            <th width="40%">Judul</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <?php for ($i = 1; $i <= 4; $i++): ?>
                            <tr>
                                <td>Highlight <?= $i; ?></td>
                                <td>
                                    <select class="form-control content-type" name="content_type[]">
                                        <option value="tb_artikel">Artikel</option>
                                        <option value="tb_doa">Doa</option>
                                        <option value="tb_video">Video</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control content-title" name="content_title[]">
                                        <!-- Options will be populated via AJAX -->
                                    </select>
                                </td>
                            </tr>
                        <?php endfor; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer text-end">
            <button type="button" class="btn btn-primary save-highlight">Simpan</button>
        </div>
    </div>

</div>
</div>