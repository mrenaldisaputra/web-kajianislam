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





<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.2/js/dataTables.bootstrap5.js"></script>



<style>
    .row-container {
        justify-content: center;
    }

    .button-container {
        align-items: center;
    }

    .button-container .btn {
        margin: 0 5px;
        /* Sesuaikan jarak antara tombol */
    }
</style>

<script>
    $(document).ready(function () {
        // DataTable untuk tabel pertama
        $('#table1').DataTable({
            "order": [[4, "desc"]], // Mengurutkan berdasarkan kolom ke-5 (Waktu) secara descending
            "columnDefs": [
                { "orderable": false, "targets": 0 } // Menonaktifkan pengurutan pada kolom No
            ],
            "initComplete": function (settings, json) {
                var table = $('#table1').DataTable();
                table.on('order.dt search.dt', function () {
                    table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                        cell.innerHTML = i + 1;
                    });
                }).draw();
            }
        });

        // DataTable untuk tabel kedua
        $('#table2').DataTable({
            "order": [[7, "desc"]], // Mengurutkan berdasarkan kolom ke-8 (Waktu) secara descending
            "columnDefs": [
                { "orderable": false, "targets": 0 } // Menonaktifkan pengurutan pada kolom No
            ],
            "initComplete": function (settings, json) {
                var table = $('#table2').DataTable();
                table.on('order.dt search.dt', function () {
                    table.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                        cell.innerHTML = i + 1;
                    });
                }).draw();
            }
        });
    });

</script>

</script>

<script>
    $(document).ready(function () {
        $(document).on("click", ".btn-delete", function () {
            var adminId = $(this).data("admin-id");
            var modalId = $(this).data("target");

            // Tutup modal delete
            $(modalId).modal('hide');

            // Kirim permintaan penghapusan menggunakan AJAX
            $.ajax({
                url: "<?php echo base_url('admin/deleteAdmin/') ?>" + adminId,
                type: "POST",
                success: function (response) {

                    // Refresh halaman
                    setTimeout(function () {
                        window.location.reload();
                    });
                },
                error: function (xhr, status, error) {
                    // Tangani kesalahan jika terjadi
                    console.error(xhr.responseText);
                }
            });
        });
    });

    $(document).ready(function () {
        $(document).on("click", ".btn-delete-artikel", function () {
            var artikelId = $(this).data("artikel-id");
            var modalId = $(this).data("target");

            // Tutup modal delete
            $(modalId).modal('hide');

            // Kirim permintaan penghapusan menggunakan AJAX
            $.ajax({
                url: "<?php echo base_url('artikel/deleteArtikel/') ?>" + artikelId,
                type: "POST",
                success: function (response) {

                    // Refresh halaman
                    setTimeout(function () {
                        window.location.reload();
                    });
                },
                error: function (xhr, status, error) {
                    // Tangani kesalahan jika terjadi
                    console.error(xhr.responseText);
                }
            });
        });
    });

    $(document).ready(function () {
        $(document).on("click", ".btn-delete-video", function () {
            var artikelId = $(this).data("video-id");
            var modalId = $(this).data("target");

            // Tutup modal delete
            $(modalId).modal('hide');

            // Kirim permintaan penghapusan menggunakan AJAX
            $.ajax({
                url: "<?php echo base_url('video/deleteVideo/') ?>" + artikelId,
                type: "POST",
                success: function (response) {

                    // Refresh halaman
                    setTimeout(function () {
                        window.location.reload();
                    });
                },
                error: function (xhr, status, error) {
                    // Tangani kesalahan jika terjadi
                    console.error(xhr.responseText);
                }
            });
        });
    });

    $(document).ready(function () {
        $(document).on("click", ".btn-delete-doa", function () {
            var artikelId = $(this).data("doa-id");
            var modalId = $(this).data("target");

            // Tutup modal delete
            $(modalId).modal('hide');

            // Kirim permintaan penghapusan menggunakan AJAX
            $.ajax({
                url: "<?php echo base_url('doa/deleteDoa/') ?>" + artikelId,
                type: "POST",
                success: function (response) {

                    // Refresh halaman
                    setTimeout(function () {
                        window.location.reload();
                    });
                },
                error: function (xhr, status, error) {
                    // Tangani kesalahan jika terjadi
                    console.error(xhr.responseText);
                }
            });
        });
    });

</script>



<script>

    date_default_timezone_set('Asia/Jakarta');

    // Fungsi untuk memformat tanggal ke dalam format "Selasa, 22 November 2023"
    function formatTanggal() {
        var postDateTd = document.getElementById('post_date');
        // Mengambil tanggal dari server yang sudah dalam format ISO atau serupa
        var currentDateTime = new Date('<?= $artikel["tanggal"]; ?>');

        // Objek untuk konversi nama bulan dari angka bulan
        var monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
            "Juli", "Agustus", "September", "Oktober", "November", "Desember"
        ];

        // Mendapatkan informasi tanggal
        var dayOfWeek = currentDateTime.toLocaleDateString('id-ID', { weekday: 'long' });
        var day = currentDateTime.getDate();
        var month = monthNames[currentDateTime.getMonth()];
        var year = currentDateTime.getFullYear();
        var hours = ('0' + currentDateTime.getHours()).slice(-2); // Tambahkan leading zero jika diperlukan
        var minutes = ('0' + currentDateTime.getMinutes()).slice(-2); // Tambahkan leading zero jika diperlukan

        // Menggabungkan bagian tanggal untuk membuat string tanggal yang lengkap
        var formattedDate = dayOfWeek + ', ' + day + ' ' + month + ' ' + year + ' ' + hours + ':' + minutes;

        // Mengatur tanggal yang sudah diformat ke dalam elemen <td>
        postDateTd.textContent = formattedDate;
    }

    // Memanggil fungsi formatTanggal() saat dokumen selesai dimuat
    document.addEventListener('DOMContentLoaded', formatTanggal);
</script>




<!-- Core plugin JavaScript-->
<script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<?= base_url('assets/'); ?>js/sb-admin-2.min.js"></script>

</body>

</html>