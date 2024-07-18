<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Doa extends CI_Controller
{

    private $_table = "tb_doa";
    public function __construct()
    {
        parent::__construct();
        $this->load->model('doa_model');
        $this->load->model('auth_model');
        $this->load->helper('url', 'form', 'datetime');
        $this->load->library('form_validation');

    }



    public function list_doa()
    {
        $data['title'] = 'List Doa';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();
        $data['list_doa'] = $this->db->get($this->_table)->result_array();


        $this->load->view('templates/header_table', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('konten/doa/list_doa', $data);
        $this->load->view('templates/footer_table');
    }


    public function new_doa()
    {
        $data['title'] = 'Tambah Doa';
        $data['tb_admin'] = $this->db->get_where('tb_admin', ['email' => $this->session->userdata('email')])->row_array();
        $data['categories'] = $this->doa_model->get_categories();

        // Ambil data gambar dari sesi jika ada
        $featured_image_data = $this->session->userdata('featured_image');
        if (!empty($featured_image_data)) {
            $data['featured_image_preview'] = 'data:image/jpeg;base64,' . base64_encode($featured_image_data);
        } else {
            $data['featured_image_preview'] = '';
        }

        // Validasi Form
        $this->form_validation->set_rules('title', 'Judul', 'required');
        $this->form_validation->set_rules('short_description', 'Deskripsi Singkat', 'required');
        $this->form_validation->set_rules('nama_penulis', 'Nama Penulis', 'required');
        $this->form_validation->set_rules('post_date', 'Tanggal', 'required');
        $this->form_validation->set_rules('isi_artikel', 'Isi doa', 'required');
        $this->form_validation->set_rules('id_kategori', 'Kategori', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');
        if (empty($featured_image_data)) {
            if (empty($_FILES['featured_image']['name'])) {
                $this->form_validation->set_rules('featured_image', 'Gambar', 'required');
            }
        }


        $this->form_validation->set_message('required', '%s wajib diisi.');

        if ($this->form_validation->run() === FALSE) {
            // Jika validasi gagal, tampilkan kembali form
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('konten/doa/new_doa', $data);
            $this->load->view('templates/footer');

            $data['id_kategori'] = set_value('id_kategori');

            // Simpan data gambar ke dalam sesi
            if (!empty($_FILES['featured_image']['tmp_name'])) {
                $this->session->set_userdata('featured_image', file_get_contents($_FILES['featured_image']['tmp_name']));
            }
        } else {
            // Jika validasi berhasil, simpan doa ke database
            $doa_data = [
                'judul' => $this->input->post('title'),
                'deskripsi' => $this->input->post('short_description'),
                'nama_penulis' => $this->input->post('nama_penulis'),
                'tanggal' => $this->input->post('post_date'),
                'isi' => $this->input->post('isi_artikel'),
                'urlvideo' => $this->input->post('video_url'),
                'id_kategori' => $this->input->post('id_kategori'),
                'status' => $this->input->post('status'),
            ];

            // Mengelola upload gambar
            $config['upload_path'] = './assets/img/doa';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|webp';
            $config['max_size'] = '5048'; // Ukuran maksimal dalam kilobyte

            $this->load->library('upload', $config);

            if ($this->upload->do_upload('featured_image')) {
                // Jika upload berhasil, dapatkan nama file dan simpan ke array $doa_data
                $file_data = $this->upload->data();
                $doa_data['gambar'] = $file_data['file_name']; // 'gambar' adalah nama kolom di database
            } else {
                // Jika upload gagal, tampilkan error (ini bisa diganti dengan cara yang lebih baik, seperti set flashdata)
                $error = array('error' => $this->upload->display_errors());

                $this->load->view('templates/header', $data);
                $this->load->view('templates/sidebar', $data);
                $this->load->view('templates/topbar', $data);
                $this->load->view('konten/doa/new_doa', $data, $error);
                $this->load->view('templates/footer');
                return; // Menghentikan eksekusi lebih lanjut
            }

            // Simpan videp ke database
            $this->doa_model->new_doa($doa_data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Doa berhasil ditambahkan!</div>');
            redirect('doa/list_doa');

            // Hapus data gambar dari sesi
            $this->session->unset_userdata('featured_image');
        }
    }

    public function deletedoa($id)
    {

        $this->db->delete($this->_table, array("id" => $id));
        redirect('doa/list_doa');

        exit();

    }

    public function edit_doa($id)
    {
        $data['title'] = 'Edit Doa';
        $data['tb_admin'] = $this->db->get_where('tb_admin', ['email' => $this->session->userdata('email')])->row_array();
        $data['categories'] = $this->doa_model->get_categories();

        $data['doa'] = $this->doa_model->get_doa_by_id($id);
        $kategoriId = $data['doa']['id_kategori'];
        $kategoriInfo = $this->db->get_where('tb_kategori', ['id_kategori' => $kategoriId])->row_array();
        $data['kategoriNama'] = $kategoriInfo['nama'];

        if (empty($data['doa'])) {
            show_404();
        }

        $this->form_validation->set_rules('title', 'Judul', 'required');
        $this->form_validation->set_rules('short_description', 'Deskripsi Singkat', 'required');
        $this->form_validation->set_rules('post_date', 'Tanggal', 'required');
        $this->form_validation->set_rules('isi_artikel', 'Isi doa', 'required');
        $this->form_validation->set_rules('id_kategori', 'Kategori', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');

        $this->form_validation->set_message('required', '%s wajib diisi.');

        if ($this->form_validation->run() === FALSE) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('konten/doa/edit_doa', $data);
            $this->load->view('templates/footer');
        } else {
            $doa_data = [
                'judul' => $this->input->post('title'),
                'deskripsi' => $this->input->post('short_description'),
                'tanggal' => $this->input->post('post_date'),
                'isi' => $this->input->post('isi_artikel'),
                'urlvideo' => $this->input->post('video_url'),
                'id_kategori' => $this->input->post('id_kategori'),
                'status' => $this->input->post('status'),
            ];

            // Mengelola upload gambar jika ada
            $config['upload_path'] = './assets/img/doa';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|webp';
            $config['max_size'] = '5048';

            $this->load->library('upload', $config);

            if (!empty($_FILES['featured_image']['name'])) {
                if ($this->upload->do_upload('featured_image')) {
                    $old_image = $data['doa']['gambar'];
                    if (!empty($old_image)) {
                        unlink(FCPATH . 'assets/img/doa/' . $old_image);
                    }
                    $file_data = $this->upload->data();
                    $doa_data['gambar'] = $file_data['file_name'];
                } else {
                    $error = array('error' => $this->upload->display_errors());
                    $this->load->view('templates/header', $data);
                    $this->load->view('templates/sidebar', $data);
                    $this->load->view('templates/topbar', $data);
                    $this->load->view('konten/doa/edit_doa', $data, $error);
                    $this->load->view('templates/footer');
                    return;
                }
            }

            $this->doa_model->update_doa($id, $doa_data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Doa berhasil diupdate!</div>');
            redirect('doa/list_doa');
        }
    }



    public function detail_doa($id)
    {
        $data['title'] = 'Detail Doa';
        $data['tb_admin'] = $this->db->get_where('tb_admin', ['email' => $this->session->userdata('email')])->row_array();

        // Mengambil data doa berdasarkan ID
        $data['doa'] = $this->db->get_where($this->_table, ['id' => $id])->row_array();
        $kategoriId = $data['doa']['id_kategori'];
        $kategoriInfo = $this->db->get_where('tb_kategori', ['id_kategori' => $kategoriId])->row_array();
        $data['kategoriNama'] = $kategoriInfo['nama'];

        if (empty($data['doa'])) {
            show_404(); // Jika data tidak ditemukan, tampilkan halaman 404
        }

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('konten/doa/detail_doa', $data); // Anda perlu membuat view ini
        $this->load->view('templates/footer');
    }


}