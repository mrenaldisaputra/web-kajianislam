<?php
class Message extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Message_model');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->load->library('session');
    }

    public function index()
    {
        $this->load->view('portal/aboutus');
    }

    public function submit()
    {
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
        $this->form_validation->set_rules('subject', 'Subject', 'required');
        $this->form_validation->set_rules('message', 'Message', 'required');

        if ($this->form_validation->run() === FALSE) {
            $this->load->view('portal/aboutus');
        } else {
            $data = array(
                'name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'subject' => $this->input->post('subject'),
                'message' => $this->input->post('message')
            );

            $this->Message_model->save_message($data);
            $this->session->set_flashdata('message', 'Pesan Anda berhasil terkirim!');
            redirect('portal/aboutus');
        }
    }

    public function admin()
    {
        $data['title'] = 'Pesan Masuk';
        $data['tb_admin'] = $this->db->get_where('tb_admin', [
            'email' => $this->session->userdata('email')
        ])->row_array();

        $data['list_admin'] = $this->Message_model->get_messages();

        $this->load->view('templates/header_table', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('admin/message', $data);
        $this->load->view('templates/footer_table');
    }
    
}
?>