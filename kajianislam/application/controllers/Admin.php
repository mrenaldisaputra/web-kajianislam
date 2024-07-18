<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
    private $_table = "tb_admin";

    public function __construct()
    {


        parent::__construct();
        $this->load->model('auth_model');
        $this->load->model('Dashboard_model');
        $this->load->library('form_validation');
        $this->load->helper('form');
    }

    public function index()
    {
        $data['title'] = 'Profil Saya';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();


        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/index', $data);
        $this->load->view('templates/footer');
    }

    public function dashboard()
    {
        $data['title'] = 'Dashboard';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();

        $data['total_posts'] = $this->Dashboard_model->get_post_count();
        $data['total_hits'] = $this->Dashboard_model->get_total_hits();
        $data['total_visitors'] = $this->Dashboard_model->get_total_visitors();
        $data['latest_posts'] = $this->Dashboard_model->get_latest_posts(3);
        $data['most_viewed'] = $this->Dashboard_model->get_most_viewed_items(10);
        $data['latest_messages'] = $this->Dashboard_model->get_latest_messages(10);


        $this->load->view('templates/header_dashboard', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/dashboard', $data);
        $this->load->view('templates/footer_dashboard');
    }

    public function message_detail($id)
    {
        $this->load->model('Dashboard_model');
        $message = $this->Dashboard_model->get_message_by_id($id);

        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();

        if (!$message) {
            show_404();
        }

        $data['title'] = 'Detail Pesan';
        $data['message'] = $message;

        $this->load->view('templates/header_dashboard', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/message_detail', $data);
        $this->load->view('templates/footer_dashboard');
    }



    public function edit()
    {
        $data['title'] = 'Edit Profil';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();

        $this->form_validation->set_rules('nama', 'Nama Lengkap', 'required|trim');

        $this->form_validation->set_message('required', ' %s wajib diisi.');


        if ($this->form_validation->run() == FALSE) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/edit', $data);
            $this->load->view('templates/footer');
        } else {
            $nama = $this->input->post('nama');
            $email = $this->input->post('email');


            //cek jika ada gambar yang ingin diupload
            $upload_image = $_FILES['image']['name'];

            if ($upload_image) {
                $config['allowed_types'] = 'gif|jpg|png|webp';
                $config['max_size'] = '5048';
                $config['upload_path'] = './assets/img/profile';

                $this->load->library('upload', $config);

                if ($this->upload->do_upload('image')) {
                    $old_image = $data['tb_admin']['image'];
                    if ($old_image != 'default.jpg') {
                        unlink(FCPATH . 'assets/img/profile/' . $old_image);
                    }

                    $new_image = $this->upload->data('file_name');
                    $this->db->set('image', $new_image);
                } else {
                    echo $this->upload->display_errors();
                }
            }

            $this->db->set('nama', $nama);
            $this->db->where('email', $email);
            $this->db->update('tb_admin');
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Profil kamu berhasil diperharui!</div>');
            redirect('admin');

        }
    }

    public function changePassword()
    {
        $data['title'] = 'Ganti Password';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();

        $this->form_validation->set_rules('current_password', 'Password saat Ini', 'required|trim');
        $this->form_validation->set_rules('new_password1', 'Password baru', 'required|trim|min_length[3]|matches[new_password2]');
        $this->form_validation->set_rules('new_password2', 'Konfirmasi password baru', 'required|trim|min_length[3]|matches[new_password1]');

        // Set pesan kesalahan
        $this->form_validation->set_message('required', ' %s wajib diisi.');
        $this->form_validation->set_message('min_length', 'Panjang %s minimal %s karakter.');
        $this->form_validation->set_message('matches', '%s tidak cocok dengan %s.');


        if ($this->form_validation->run() == FALSE) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/changepassword', $data);
            $this->load->view('templates/footer');
        } else {
            $current_password = $this->input->post('current_password');
            $new_password = $this->input->post('new_password1');
            if (!password_verify($current_password, $data['tb_admin']['password'])) {
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Anda salah memasukkan kata sandi saat ini!</div>');
                redirect('admin/changepassword');
            } else {
                if ($current_password == $new_password) {
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Kata sandi baru tidak boleh sama dengan kata sandi anda saat ini!</div>');
                    redirect('admin/changepassword');
                } else {
                    // password sudah benar
                    $password_hash = password_hash($new_password, PASSWORD_DEFAULT);

                    $this->db->set('password', $password_hash);
                    $this->db->where('email', $this->session->userdata('email'));
                    $this->db->update('tb_admin');
                    $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Kata sandi Anda berhasil diperbarui!</div>');
                    redirect('admin');

                }

            }

        }
    }

    public function manajemenAdmin()
    {
        $data['title'] = 'Manajemen Admin';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();

        $data['list_admin'] = $this->db->get($this->_table)->result_array();


        $this->load->view('templates/header_table', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/manajemenAdmin', $data);
        $this->load->view('templates/footer_table');
    }



    public function newAdmin()
    {
        $data['title'] = 'Tambah Admin Baru';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' =>
                $this->session->userdata('email')
        ])->row_array();

        date_default_timezone_set('Asia/Jakarta');

        $this->form_validation->set_rules('nama', 'Nama Lengkap', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[tb_admin.email]');
        $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[3]|matches[password2]');
        $this->form_validation->set_rules('password2', 'Konfirmasi password', 'required|trim|min_length[3]|matches[password1]');


        $this->form_validation->set_message('is_unique', ' %s sudah digunakan.');
        $this->form_validation->set_message('required', ' %s wajib diisi.');
        $this->form_validation->set_message('valid_email', 'Masukkan %s dengan benar.');
        $this->form_validation->set_message('min_length', 'Panjang %s minimal %s karakter.');
        $this->form_validation->set_message('matches', '%s tidak cocok dengan %s.');


        if ($this->form_validation->run() == FALSE) {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('admin/newAdmin', $data);
            $this->load->view('templates/footer');
        } else {
            $data = [
                'nama' => $this->input->post('nama'),
                'email' => $this->input->post('email'),
                'image' => 'default.jpg',
                'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
                'role_id' => 1,
                'status' => 1,
                'created_at' => date('Y-m-d H:i:s'),
            ];

            $this->db->insert('tb_admin', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Akun berhasil ditambahkan!</div>');
            redirect('admin/manajemenAdmin');
        }
    }

    public function detailAdmin()
    {
        $data['list_admin'] = $this->Admin_model->getListAdmin();
        $this->load->view('admin/manajemenAdmin', $data);
    }

    public function editAdmin($id)
    {
        // Cek apakah form telah disubmit
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Ambil data dari form
            $nama = $this->input->post('nama');
            $status = $this->input->post('status');

            // Lakukan validasi jika diperlukan
            // ...

            // Lakukan pembaruan data di database
            $data = array(
                'nama' => $nama,
                'status' => $status
            );
            $this->db->where('id', $id);
            $this->db->update('tb_admin', $data);

            // Atur flashdata untuk pesan berhasil
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Akun berhasil diperbarui!</div>');

            // Redirect ke halaman manajemen admin
            redirect('admin/manajemenAdmin');
        }
    }


    public function deleteAdmin($id)
    {

        $this->db->delete($this->_table, array("id" => $id));
        redirect('admin/manajemenAdmin');

        exit();
    }




}