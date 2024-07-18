<section>
    <div class="container">
        <div class="row">
            <div class="col-md-9 mx-auto text-center">
                <h1 class="display-4">About us</h1>
            </div>
        </div>
    </div>
</section>
<!-- =======================
Inner intro END -->

<!-- =======================
Contact info START -->
<section class="pt-4">
    <div class="container">
        <div class="row">
            <div class="col-xl-9 mx-auto">
                <iframe class="w-100 h-300 grayscale"
                    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3966.1684860911464!2d106.829783!3d-6.241513!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f3c499a9538d%3A0xec262fc56a3a02db!2sTrans%20TV!5e0!3m2!1sid!2sid!4v1713514824857!5m2!1sid!2sid"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>


                <div class="row mt-5  mx-auto text-center">
                    <div class="col-12 mb-5 mb-sm-0">
                        <p><b>Situs Kajianislam.id</b> adalah sumber informasi terkemuka tentang
                            artikel, video, dan doa-doa yang
                            menginspirasi dari perspektif Islam. Kami menawarkan pandangan yang mendalam dan holistik
                            tentang ajaran agama Islam, menyajikan konten yang relevan dan bermakna bagi umat Muslim di
                            seluruh dunia. <br><br>
                            "Menyinari Hati, Mencerahkan Jiwa"</p>
                        </p>
                    </div>
                </div>

                <hr class="my-4">

                <div class="row">
                    <div class="col-12">
                        <h2>Contact us</h2>

                        <!-- Tampilkan pesan flashdata jika ada -->
                        <?php if ($this->session->flashdata('message')): ?>
                            <div class="alert alert-success" role="alert">
                                <?= $this->session->flashdata('message'); ?>
                            </div>
                        <?php endif; ?>

                        <!-- Form START -->
                        <?php echo form_open('message/submit', array('id' => 'contact-form', 'name' => 'contactform')); ?>
                        <!-- Main form -->
                        <div class="row">
                            <div class="col-md-6 mt-3">
                                <!-- name -->
                                <div class="mb-3">
                                    <input required id="con-name" name="name" type="text" class="form-control"
                                        placeholder="Name" value="<?php echo set_value('name'); ?>">
                                </div>
                            </div>
                            <div class="col-md-6 mt-3">
                                <!-- email -->
                                <div class="mb-3">
                                    <input required id="con-email" name="email" type="email" class="form-control"
                                        placeholder="E-mail" value="<?php echo set_value('email'); ?>">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <!-- Subject -->
                                <div class="mb-3">
                                    <input required id="con-subject" name="subject" type="text" class="form-control"
                                        placeholder="Subject" value="<?php echo set_value('subject'); ?>">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <!-- Message -->
                                <div class="mb-3">
                                    <textarea required id="con-message" name="message" cols="40" rows="6"
                                        class="form-control"
                                        placeholder="Message"><?php echo set_value('message'); ?></textarea>
                                </div>
                            </div>
                            <!-- submit button -->
                            <div class="col-md-12 text-start">
                                <button class="btn btn-success-soft w-100" type="submit">Send Message</button>
                            </div>
                        </div>
                        <?php echo form_close(); ?>
                        <!-- Form END -->
                    </div>
                </div>
            </div> <!-- Col END -->
        </div>
    </div>
</section>
<!-- =======================
Contact info END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->