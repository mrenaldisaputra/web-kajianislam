<?php
defined('BASEPATH') or exit ('No direct script access allowed');

class Kategori extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('kategori_model');
    }

    public function list_kategori()
    {
        $data['title'] = 'List Kategori';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();
        $data['categories'] = $this->kategori_model->get_all_categories_with_counts();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('konten/kategori/list_kategori', $data);
        $this->load->view('templates/footer');
    }

    public function add_category()
    {
        $this->form_validation->set_rules('category_name', 'Nama Kategori', 'required');

        if ($this->form_validation->run() === FALSE) {
            $this->index();
        } else {
            $category_data = array(
                'nama' => $this->input->post('category_name'),
                'status' => 'Aktif'
            );

            $this->kategori_model->insert_category($category_data);
            $this->session->set_flashdata('message', '<div class="alert alert-success">Kategori berhasil ditambahkan.</div>');
            redirect('kategori/list_kategori');
        }
    }

    public function edit_category($id)
    {
        $data['category'] = $this->kategori_model->get_category_by_id($id);

        $this->form_validation->set_rules('category_name', 'Nama Kategori', 'required');

        if ($this->form_validation->run() === FALSE) {
            $this->index();
        } else {
            $category_data = array(
                'nama' => $this->input->post('category_name'),
                'status' => $this->input->post('status')
            );

            $this->kategori_model->update_category($id, $category_data);
            $this->session->set_flashdata('message', '<div class="alert alert-success">Kategori berhasil diupdate.</div>');
            redirect('kategori/list_kategori');
        }
    }

    public function delete_category($id)
    {
        $this->kategori_model->delete_category($id);
        $this->session->set_flashdata('message', '<div class="alert alert-success">Kategori berhasil dihapus</div>');
        redirect('kategori/list_kategori');
    }
}