<!-- Login 9 - Bootstrap Brain Component -->
<section class="py-3 py-md-5 py-xl-8">
    <div class="container">
        <div class="row gy-4 align-items-center">
            <div class="col-12 col-md-6 col-xl-7">
                <div class="d-flex justify-content-center text-light">
                    <div class="col-12 col-xl-9">
                        <img class="img-fluid rounded mb-4" loading="lazy"
                            src="<?= base_url('assets/'); ?>img/logo/KajianIslam.png" width="245" height="80"
                            alt="BootstrapBrain Logo">
                        <hr class="border-primary-subtle mb-4">
                        <h2 class="h1 mb-4">Portal CMS Admin</h2>
                        <p class="lead mb-5"> Managed by TransTV.co.id </p>
                        <div class="text-endx">
                            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor"
                                class="bi bi-grip-horizontal" viewBox="0 0 16 16">
                                <path
                                    d="M2 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm3 3a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm0-3a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-xl-5">
                <div class="card border-0 rounded-4 my-5">
                    <div class="card-body p-3 p-md-4 p-xl-5">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-4 ">
                                    <h3>Login Page</h3>
                                </div>
                            </div>
                        </div>

                        <?= $this->session->flashdata('message'); ?>


                        <form class="user" method="post" action="<?= base_url('auth'); ?>">
                            <div class="row gy-3 overflow-hidden">
                                <div class="col-12">
                                    <div class="form-floating mb-3 mt-3">
                                        <input type="text" class="form-control" id="email" name="email"
                                            placeholder="Masukan email..." value="<?= set_value('email') ?>" required
                                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        <?= form_error('email', '<small class="text-danger pl-3">', '</small>'); ?>
                                        <label for="email" class="form-label">Email</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-floating mb-3">
                                        <input type="password" class="form-control" id="password" name="password"
                                            placeholder="Password..." required>
                                        <?= form_error('password', '<small class="text-danger pl-3">', '</small>'); ?>
                                        <label for="password" class="form-label">Password</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="d-grid">
                                        <button type='submit' class="btn btn-primary btn-lg btn-block">
                                            Login
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>