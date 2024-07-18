<!-- =======================
Footer START -->
<footer class="bg-dark pt-5">
    <div class="container">
        <!-- About and Newsletter START -->
        <!-- About and Newsletter END -->

        <!-- Divider -->

        <!-- Widgets START -->
        <div class="row pt-5">
            <!-- Footer Widget -->
            <div class="col-md-4 col-lg-5 mb-4">
                <div class="col-lg">
                    <img src="<?= base_url('assets/'); ?>img/logo/KajianIslam.png" alt="footer logo">
                </div>
                <div class="row-md-5 pt-3">
                    <p class="text-body-secondary">Managed by TransTV.co.id <br><br>

                        Gedung TRANSMEDIA <br>
                        Jl. Kapten P. Tendean Kav 12-14 A <br>
                        Mampang Prapatan, Jakarta Selatan 12790
                    </p>
                </div>
            </div>

            <!-- Footer Widget -->
            <div class="col-md-3 col-lg-3 mb-4">
                <h5 class="mb-4 text-white">Informasi</h5>
                <div class="row">
                    <div class="col-12">
                        <ul class="nav flex-column text-primary-hover">
                            <li class="nav-item"><a class="nav-link pt-0"
                                    href="<?= base_url('portal/aboutus/') ?>">About Us</a></li>
                            <li class="nav-item"><a class="nav-link" href="<?= base_url('portal/aboutus/') ?>">Contact
                                    us</a></li>
                            <li class="nav-item"><a class="nav-link"
                                    href="<?= base_url('portal/pedomansiber/') ?>">Pedoman Media Siber</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Footer Widget -->
        </div>
        <!-- Widgets END -->

    </div>

    <!-- Footer copyright START -->
    <div class="bg-dark-overlay-3 mt-5">
        <div class="container">
            <div class="row align-items-center justify-content-md-between py-4">
                <div class="col-md-6">
                    <!-- Copyright -->
                    <div class="text-center text-md-start text-primary-hover text-body-secondary">©2024 <a href="..."
                            class="text-reset btn-link" target="_blank">Kajianislam.id</a> -
                        All Rights Reserved
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer copyright END -->
</footer>
<!-- =======================
Footer END -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short"></i></div>

<!-- =======================
JS libraries, plugins and custom scripts -->

<!-- Dalam file view -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var offset = 10; // Inisialisasi offset dengan 0

    function loadMoreData() {
        $.ajax({
            url: '<?php echo base_url('portal/loadMoreArticles'); ?>',
            type: 'GET',
            data: { offset: offset },
            dataType: 'json',
            success: function (response) {
                if (response.status == 'success') {
                    $('#loadedData').append(response.data); // Tambahkan data baru ke div dengan id #loadedData
                    offset += response.records; // Perbarui nilai offset untuk permintaan berikutnya

                    // Hilangkan tombol "Load More" yang lama
                    $('#loadMoreBtn').parent().remove();

                    // Tambahkan tombol "Load More" baru dengan posisi di tengah lebar
                    if (response.records > 0) {
                        $('#loadedData').after('<div class="col-12 ms-2 text-center w-100 mt-4"><button id="loadMoreBtn" type="button" class="btn btn-success-soft" onclick="loadMoreData()">Load More <i class="bi bi-arrow-down ms-2 align-middle"></i></button></div>');
                    }
                } else {
                    // Jika tidak ada data lagi, hilangkan tombol "Load More"
                    $('#loadMoreBtn').parent().remove();
                }
            }
        });
    }
</script>

<script>
    var offset = 10; // Inisialisasi offset dengan 0

    function loadMoreDataDoa() {
        $.ajax({
            url: '<?php echo base_url('portal/loadMoreDoa'); ?>',
            type: 'GET',
            data: { offset: offset },
            dataType: 'json',
            success: function (response) {
                if (response.status == 'success') {
                    $('#loadedData').append(response.data); // Tambahkan data baru ke div dengan id #loadedData
                    offset += response.records; // Perbarui nilai offset untuk permintaan berikutnya

                    // Hilangkan tombol "Load More" yang lama
                    $('#loadMoreBtn').parent().remove();

                    // Tambahkan tombol "Load More" baru dengan posisi di tengah lebar
                    if (response.records > 0) {
                        $('#loadedData').after('<div class="col-12 ms-2 text-center w-100 mt-4"><button id="loadMoreBtn" type="button" class="btn btn-success-soft" onclick="loadMoreData()">Load More <i class="bi bi-arrow-down ms-2 align-middle"></i></button></div>');
                    }
                } else {
                    // Jika tidak ada data lagi, hilangkan tombol "Load More"
                    $('#loadMoreBtn').parent().remove();
                }
            }
        });
    }
</script>

<script>
    var offset = 10; // Inisialisasi offset dengan 0

    function loadMoreDataVideo() {
        $.ajax({
            url: '<?php echo base_url('portal/loadMoreVideo'); ?>',
            type: 'GET',
            data: { offset: offset },
            dataType: 'json',
            success: function (response) {
                if (response.status == 'success') {
                    $('#loadedData').append(response.data); // Tambahkan data baru ke div dengan id #loadedData
                    offset += response.records; // Perbarui nilai offset untuk permintaan berikutnya

                    // Hilangkan tombol "Load More" yang lama
                    $('#loadMoreBtn').parent().remove();

                    // Tambahkan tombol "Load More" baru dengan posisi di tengah lebar
                    if (response.records > 0) {
                        $('#loadedData').after('<div class="col-12 ms-2 text-center w-100 mt-4"><button id="loadMoreBtn" type="button" class="btn btn-success-soft" onclick="loadMoreData()">Load More <i class="bi bi-arrow-down ms-2 align-middle"></i></button></div>');
                    }
                } else {
                    // Jika tidak ada data lagi, hilangkan tombol "Load More"
                    $('#loadMoreBtn').parent().remove();
                }
            }
        });
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var videoBoxClick = document.querySelector('.sce__detailVideoboxClick');
        if (videoBoxClick) {
            videoBoxClick.addEventListener('click', function () {
                var videoId = this.getAttribute('data-youtube-id');
                var videoContainer = document.querySelector('.sce__detailVideobox');
                var videoPlayer = videoContainer.querySelector('.sce__detailVideoboxPlayer');
                var videoFrame = videoPlayer.querySelector('iframe');

                // Set the YouTube embed URL
                videoFrame.src = 'https://www.youtube.com/embed/' + videoId + '?autoplay=1';

                // Hide the thumbnail and show the video player
                this.parentElement.style.display = 'none';
                videoPlayer.style.display = 'block';
            });
        }
    });
</script>

<style>
    .sce__detailVideobox {
        position: relative;
        width: 100%;
        max-width: 100%;
        margin: auto;
    }

    .sce__detailVideoboxImg {
        width: 100%;
        padding-bottom: 56.25%;
        /* 16:9 Aspect Ratio */
        background-size: cover;
        background-position: center;
        position: relative;
        border-radius: 15px;
        /* Adjust the value as needed */
        overflow: hidden;
        /* To ensure the background image stays within the rounded corners */
    }


    .sce__detailVideoboxFade {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
    }

    .sce__detailVideoboxIcon {
        width: 50px;
        height: 50px;
    }

    .embed-responsive {
        position: relative;
        display: block;
        width: 100%;
        padding: 0;
        overflow: hidden;
        padding-bottom: 56.25%;
        /* 16:9 aspect ratio */
    }

    .embed-responsive .embed-responsive-item {
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        height: 100%;
        width: 100%;
        border: 0;
    }
</style>



<!-- Vendors -->
<script src="<?= base_url('assets/'); ?>vendor/tiny-slider/tiny-slider.js"></scrip >
        <script src="<?= base_url('assets/'); ?>vendor/sticky-js/sticky.min.js"></script>
<script src="<?= base_url('assets/'); ?>plyr/plyr.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="<?= base_url('assets/'); ?>vendor/jquery/jquery.min.js"></script>
<script src="<?= base_url('assets/'); ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>

<!-- Core plugin JavaScript-->
<script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>



<!-- Template Functions -->
<script src="assets/js/functions.js"></script>
</body>

</html>