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

<script src="<?= base_url('assets/'); ?>vendor/overlay-scrollbar/js/OverlayScrollbars.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<?= base_url('assets/'); ?>vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<?= base_url('assets/'); ?>js/sb-admin-2.min.js"></script>

<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>



<!-- Optional: Custom JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Custom script if needed
        var messageModal = document.getElementById('messageModal');
        if (messageModal) {
            messageModal.addEventListener('show.bs.modal', function (event) {
                var button = event.relatedTarget;
                var subject = button.getAttribute('data-subject');
                var email = button.getAttribute('data-email');
                var message = button.getAttribute('data-message');
                var createdAt = button.getAttribute('data-created-at');

                var modalSubject = messageModal.querySelector('#modal-subject');
                var modalEmail = messageModal.querySelector('#modal-email');
                var modalMessage = messageModal.querySelector('#modal-message');
                var modalCreatedAt = messageModal.querySelector('#modal-created-at');

                modalSubject.textContent = subject;
                modalEmail.textContent = email;
                modalMessage.textContent = message;
                modalCreatedAt.textContent = createdAt;
            });
        }
    });
</script>
</body>

</html>








</body>

</html>