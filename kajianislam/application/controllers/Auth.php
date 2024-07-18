<?php
defined('BASEPATH') or exit ('No direct script access allowed');

class Auth extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('auth_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
	}

	public function index()
	{
		if ($this->session->userdata('email')) {
			redirect('admin');
		}

		$rules = $this->auth_model->rules();
		$this->form_validation->set_rules($rules);
		$this->form_validation->set_message('required', ' %s wajib diisi.');
		$this->form_validation->set_message('valid_email', 'Masukkan %s dengan benar.');

		if ($this->form_validation->run() == FALSE) {
			$data['title'] = 'Kajian Islam Website | Login Admin';
			$this->load->view('templates/auth_header', $data);
			$this->load->view('auth/login_new');
			$this->load->view('templates/auth_footer');
		} else {
			//validasi success
			$this->_login();
		}
	}

	private function _login()
	{
		$email = $this->input->post('email');
		$password = $this->input->post('password');

		// Cek apakah email dan password diisi
		if ($email && $password) {
			$tb_admin = $this->db->get_where('tb_admin', ['email' => $email])->row_array();
			date_default_timezone_set('Asia/Jakarta');

			//jika user ada
			if ($tb_admin) {
				// jika usernya aktif
				if ($tb_admin['status'] == 1) {
					//cek password
					if (password_verify($password, $tb_admin['password'])) {
						$data = [
							'email' => $tb_admin['email'],
							'role_id' => $tb_admin['role_id']
						];
						// Simpan waktu login terakhir dalam session
						$this->session->set_userdata($data);

						// Perbarui waktu login terakhir
						$this->db->set('last_login', date('Y-m-d H:i:s', time()));
						$this->db->where('email', $email);
						$this->db->update('tb_admin');

						redirect('admin/dashboard');
					} else {
						//jika password tidak sesuai
						$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password Anda Salah!</div>');
						redirect('auth');
					}
				} else {
					//jika akun belum diaktifkan
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email ini tidak aktif!</div>');
					redirect('auth');
				}
			} else {
				//Jika email tidak terdaftar
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email ini belum terdaftar!</div>');
				redirect('auth');
			}
		} else {
			// Jika email atau password kosong
			$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Email dan Password wajib diisi!</div>');
			redirect('auth');
		}
	}

	public function logout()
	{
		$this->session->unset_userdata('email');
		$this->session->unset_userdata('role_id');
		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Sesi Anda telah berakhir. Anda telah berhasil logout!</div>');
		redirect('auth');
	}
}