<!-- Ini adalah view yang sama dengan new_artikel.php -->
<section class="py-4">
    <div class="container">
        <div class="row pb-4">
            <div class="col-12">
                <h1 class="h3 text-gray-800">
                    <?= $title; ?>
                </h1>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <!-- Tampilkan pesan error atau sukses -->
                <!-- Chart START -->
                <div class="card border">
                    <!-- Card body -->
                    <div class="card-body">
                        <?php echo form_open('artikel/edit_artikel/' . $artikel['id'], ['id' => 'myForm', 'enctype' => 'multipart/form-data']); ?>

                        <div class="form-group">
                            <label for="title">Judul</label>
                            <input type="text" class="form-control" id="title" name="title"
                                value="<?= $artikel['judul']; ?>">
                            <?= form_error('title', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="short_description">Deskripsi Singkat</label>
                            <textarea class="form-control" id="short_description" name="short_description"
                                rows="3"><?= $artikel['deskripsi']; ?></textarea>
                            <?= form_error('short_description', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="nama_penulis">Nama Penulis</label>
                            <input type="text" class="form-control" id="nama_penulis" name="nama_penulis"
                                value="<?= $artikel['nama_penulis']; ?>">
                            <?= form_error('nama_penulis', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="post_date">Tanggal</label>
                            <input type="datetime-local" class="form-control" id="post_date" name="post_date"
                                value="<?= datetime_to_local($artikel['tanggal']); ?>">
                            <?= form_error('post_date', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="isi_artikel">Isi Artikel</label>

                            <div id="toolbar-container">
                                <!-- Toolbar buttons -->
                                <span class="ql-formats">
                                    <select class="ql-font"></select>
                                    <select class="ql-size"></select>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-bold"></button>
                                    <button class="ql-italic"></button>
                                    <button class="ql-underline"></button>
                                    <button class="ql-strike"></button>
                                </span>
                                <span class="ql-formats">
                                    <select class="ql-color"></select>
                                    <select class="ql-background"></select>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-script" value="sub"></button>
                                    <button class="ql-script" value="super"></button>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-header" value="1"></button>
                                    <button class="ql-header" value="2"></button>
                                    <button class="ql-blockquote"></button>
                                    <button class="ql-code-block"></button>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-list" value="ordered"></button>
                                    <button class="ql-list" value="bullet"></button>
                                    <button class="ql-indent" value="-1"></button>
                                    <button class="ql-indent" value="+1"></button>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-direction" value="rtl"></button>
                                    <select class="ql-align"></select>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-link"></button>
                                    <button class="ql-image"></button>
                                    <button class="ql-video"></button>
                                    <button class="ql-formula"></button>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-clean"></button>
                                </span>
                            </div>

                            <input type="hidden" name="isi_artikel" value="<?= $artikel['isi']; ?>">
                            <div id="isi_artikel" style="min-height: 200px;">
                                <?= $artikel['isi']; ?>
                            </div>
                            <?= form_error('isi_artikel', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="featured_image">Gambar</label>
                            <input type="file" class="form-control-file" id="featured_image" name="featured_image"
                                onchange="previewImage()">
                            <?= form_error('featured_image', '<small class="text-danger pl-3">', '</small>'); ?>

                            <img id="preview" src="<?= base_url('assets/img/artikel/') . $artikel['gambar']; ?>"
                                alt="Preview Gambar" class="preview-image">
                        </div>

                        <div class="form-group">
                            <label for="video_url">URL Video</label>
                            <input type="text" class="form-control" id="video_url" name="video_url"
                                value="<?= $artikel['urlvideo']; ?>">
                        </div>

                        <div class="form-group">
                            <label for="id_kategori">Kategori</label>
                            <select class="form-control" id="id_kategori" name="id_kategori">
                                <option value="">Pilih Kategori</option>
                                <?php foreach ($categories as $category): ?>
                                    <option value="<?= $category['id']; ?>" <?= $category['id'] == $artikel['id_kategori'] ? 'selected' : ''; ?>>
                                        <?= $category['nama']; ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                            <?= form_error('id_kategori', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status">
                                <option value="Aktif" <?= $artikel['status'] == 'Aktif' ? 'selected' : ''; ?>>Aktif
                                </option>
                                <option value="Nonaktif" <?= $artikel['status'] == 'Nonaktif' ? 'selected' : ''; ?>>
                                    Nonaktif</option>
                            </select>
                            <?= form_error('status', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary w-100" type="submit">Update</button>
                        </div>

                        <?php echo form_close(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>