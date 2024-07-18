// application/controllers/Hit.php

<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hit extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Hit_model');
    }

    // Fungsi untuk menambahkan hit baru
    public function tambah_hit() {
        $id_related = $this->input->post('id_related');
        $kategori = $this->input->post('kategori');
        $this->Hit_model->tambah_hit($id_related, $kategori);
    }

}
?>
