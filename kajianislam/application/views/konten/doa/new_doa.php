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
                        <?php echo form_open('doa/new_doa', ['id' => 'myForm', 'enctype' => 'multipart/form-data']); ?>

                        <div class="form-group">
                            <label for="title">Judul</label>
                            <input type="text" class="form-control" id="title" name="title"
                                value="<?= set_value('title') ?>" required>
                            <?= form_error('title', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="short_description">Deskripsi Singkat</label>
                            <textarea class="form-control" id="short_description" name="short_description" required
                                rows="3"><?= set_value('short_description') ?></textarea>
                            <?= form_error('short_description', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="nama_penulis">Nama Penulis</label>
                            <input type="text" class="form-control" id="nama_penulis" name="nama_penulis"
                                value="<?= set_value('nama_penulis'); ?>" required>
                            <?= form_error('nama_penulis', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="post_date">Tanggal</label>
                            <input type="datetime-local" class="form-control" id="post_date" name="post_date"
                                value="<?= set_value('post_date') ?>" required>
                            <?= form_error('post_date', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>

                        <div class="form-group">
                            <label for="isi_artikel">Isi doa</label>

                            <div id="toolbar-container">
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
                                    <button class="ql-doa"></button>
                                    <button class="ql-formula"></button>
                                </span>
                                <span class="ql-formats">
                                    <button class="ql-clean"></button>
                                </span>
                            </div>


                            <input type="hidden" name="isi_artikel" value="<?= set_value('isi_artikel') ?>" required>
                            <div id="isi_artikel" style="min-height: 200px;">
                                <?= set_value('isi_artikel') ?>
                            </div>
                            <?= form_error('isi_artikel', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>




                        <div class="form-group">
                            <label for="featured_image">Gambar</label>
                            <input type="file" class="form-control-file" id="featured_image" name="featured_image"
                                onchange="previewImage()" required>
                            <?= form_error('featured_image', '<small class="text-danger pl-3">', '</small>'); ?>

                            <img id="preview" src="#" alt="Preview Gambar" class="preview-image"
                                style="display: <?= empty($featured_image_preview) ? 'none' : 'block' ?>;">

                        </div>


                        <div class="form-group">
                            <label for="video_url">URL Video</label>
                            <input type="text" class="form-control" id="video_url" name="video_url"
                                value="<?= set_value('video_url') ?>">
                        </div>

                        <div class="form-group">
                            <label for="id_kategori">Kategori</label>
                            <select class="form-control" id="id_kategori" name="id_kategori" required>
                                <option value="">Pilih Kategori</option>
                                <?php foreach ($categories as $category): ?>
                                    <option value="<?php echo $category['id']; ?>" <?php echo set_select('id_kategori', $category['id'], (!empty($data['id_kategori']) && $data['id_kategori'] == $category['id'] ? TRUE : FALSE)); ?>>
                                        <?php echo $category['nama']; ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                            <?= form_error('id_kategori', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>


                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" id="status" name="status" value="<?= set_value('status') ?>">
                                <option value="1">Aktif</option>
                                <option value="0">Tidak Aktif</option>
                            </select>
                            <?= form_error('status', '<small class="text-danger pl-3">', '</small>'); ?>
                        </div>


                        <div class="form-group">
                            <!-- Penutup tag form di sini -->
                            <button class="btn btn-primary w-100" type="submit">Simpan</button>
                        </div>

                        <?php echo form_close(); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>