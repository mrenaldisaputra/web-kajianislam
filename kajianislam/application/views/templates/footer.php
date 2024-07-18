<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Kajian Islami Website 2024</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ingin keluar dari Halaman Admin?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Klik "Logout" dibawah ini jika ingin mengakhiri sesi Anda saat ini.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="<?= base_url('auth/logout'); ?>">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script>
<script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<?= base_url('assets/'); ?>js/sb-admin-2.min.js"></script>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>


<style>
    .preview-image {
        max-width: 500px;
        max-height: 500px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        object-fit: cover;
        margin-top: 10px;
    }
</style>

<script>
    function previewImage() {
        var preview = document.getElementById('preview');
        var file = document.getElementById('featured_image').files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            preview.src = reader.result;
            preview.style.display = 'block';
        }

        if (file) {
            reader.readAsDataURL(file);
        } else {
            preview.src = '#';
            preview.style.display = 'none';
        }
    }
</script>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Inisialisasi Editor Quill
        var quill = new Quill('#isi_artikel', {
            modules: {
                syntax: true,
                toolbar: '#toolbar-container',
            },
            placeholder: '...',
            theme: 'snow',
            styles: {
                '.ql-editor': {
                    'min-height': '100px', // Atur tinggi minimal editor
                    'height': '100px', // Atur tinggi editor
                    'box-sizing': 'border-box', // Pastikan padding tidak mempengaruhi tinggi
                    'line-height': '18px', // Atur jarak antar baris
                    'overflow-y': 'auto' // Tambahkan scroll vertikal jika konten melebihi tinggi
                }
            }
        });



        // Event listener untuk menjalankan fungsi saveQuillValueToForm() saat form disubmit
        // Menggabungkan dua listener menjadi satu
        var form = document.getElementById('myForm');
        form.addEventListener('submit', function (event) {
            event.preventDefault(); // Mencegah form dikirim secara default

            // Ambil nilai dari editor Quill
            var isiArtikel = quill.root.innerHTML;
            var hiddenInput = document.getElementById('hidden_input_for_content');
            if (!hiddenInput) {
                hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.id = 'hidden_input_for_content';
                hiddenInput.name = 'isi_artikel';
                this.appendChild(hiddenInput);
            }
            hiddenInput.value = isiArtikel;

            // Kirim form
            this.submit();
        });
    });

</script>





<script>
    // Event listener untuk input file
    document.getElementById('featured_image').addEventListener('change', function () {
        var file = this.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('preview').src = e.target.result;
                document.getElementById('preview').style.display = 'block';
            }
            reader.readAsDataURL(file);
        } else {
            document.getElementById('preview').src = '#';
            document.getElementById('preview').style.display = 'none';
        }
    });
</script>

<script>
    // Event listener untuk input file
    document.getElementById('featured_image').addEventListener('change', function () {
        var file = this.files[0];
        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('preview').src = e.target.result;
                document.getElementById('preview').style.display = 'block';
            }
            reader.readAsDataURL(file);
        } else {
            document.getElementById('preview').src = '#';
            document.getElementById('preview').style.display = 'none';
        }
    });

    // Fungsi untuk memformat tanggal dan waktu dari database
    function formatDatabaseDateTime(databaseDateTime) {
        // Membuat objek Date dari string tanggal database
        var dateObj = new Date(databaseDateTime);

        // Objek untuk konversi nama bulan dari angka bulan
        var monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];

        // Memformat tanggal dan waktu menjadi format yang diterima input datetime-local
        var dayOfWeek = dateObj.toLocaleDateString('id-ID', { weekday: 'long' });
        var year = dateObj.getFullYear();
        var month = monthNames[dateObj.getMonth()];
        var day = String(dateObj.getDate()).padStart(2, '0'); // Menambahkan leading zero jika diperlukan
        var hours = String(dateObj.getHours()).padStart(2, '0'); // Menambahkan leading zero jika diperlukan
        var minutes = String(dateObj.getMinutes()).padStart(2, '0'); // Menambahkan leading zero jika diperlukan
        var formattedDateTime = dayOfWeek + ', ' + day + ' ' + month + ' ' + year + ' ' + hours + ':' + minutes + ' WIB';

        return formattedDateTime;
    }

    // Mendapatkan input datetime-local
    var postDateInput = document.getElementById('post_date');

    // Mengambil nilai tanggal dari database
    var databaseDateTime;

    // Contoh penggunaan dengan artikel
    databaseDateTime = "<?php echo $artikel['tanggal']; ?>";
    postDateInput.value = formatDatabaseDateTime(databaseDateTime);

    // Contoh penggunaan dengan doa
    databaseDateTime = "<?php echo $doa['tanggal']; ?>";
    postDateInput.value = formatDatabaseDateTime(databaseDateTime);

    // Contoh penggunaan dengan video
    databaseDateTime = "<?php echo $video['tanggal']; ?>";
    postDateInput.value = formatDatabaseDateTime(databaseDateTime);

    databaseDateTime = "<?php echo $admin['tanggal']; ?>";
    postDateInput.value = formatDatabaseDateTime(databaseDateTime);
</script>

<script>
    $(document).ready(function () {
        // Fungsi untuk mengisi dropdown judul konten
        function populateContentTitle(row) {
            var contentType = row.find('.content-type').val();
            var rowIndex = row.index();

            $.ajax({
                url: '<?php echo base_url('highlight/get_content_titles'); ?>',
                method: 'POST',
                data: { content_type: contentType },
                dataType: 'json',
                success: function (response) {
                    var options = '<option value="">Pilih Judul</option>';
                    $.each(response, function (index, content) {
                        options += '<option value="' + content.id + '">' + content.judul + '</option>';
                    });
                    // Ambil dropdown judul konten pada baris yang sesuai dan isi dengan opsi yang baru
                    $('tbody tr:eq(' + rowIndex + ') .content-title').html(options);
                }
            });
        }

        // Event listener untuk perubahan pada dropdown jenis konten
        $('.content-type').change(function () {
            var currentRow = $(this).closest('tr');
            populateContentTitle(currentRow);
        });

        // Inisialisasi dropdown judul konten pada baris pertama
        populateContentTitle($('tbody tr:first'));

        $('.save-highlight').click(function () {
            var formData = [];

            // Loop melalui setiap baris dan ambil nilai dari dropdown jenis konten dan judul konten
            $('tbody tr').each(function () {
                var contentType = $(this).find('.content-type').val();
                var contentTitle = $(this).find('.content-title').val();
                formData.push({ content_type: contentType, content_title: contentTitle });
            });

            $.ajax({
                url: '<?php echo base_url('highlight/save_highlight'); ?>',
                method: 'POST',
                data: { highlights: formData },
                dataType: 'json',
                success: function (response) {
                    alert(response.message);
                    // Tambahkan logika lain jika diperlukan setelah pilihan disimpan
                }
            });
        });
    });
</script>








</body>

</html>