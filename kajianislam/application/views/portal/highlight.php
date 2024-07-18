<?php
class Highlight extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Hit_model');
    }

    public function index()
    {
        $data['title'] = 'Beranda | Kajian Islami';
        $data['most_viewed'] = $this->Hit_model->get_top_highlights();

        $this->load->view('templates/header_list', $data);
        $this->load->view('portal/beranda', $data);
        $this->load->view('templates/footer_user', $data);
    }

    
}
?>