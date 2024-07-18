<?php
class Message_model extends CI_Model
{

    public function __construct()
    {
        $this->load->database();
    }

    public function save_message($data)
    {
        return $this->db->insert('message', $data);
    }

    public function get_messages()
    {
        $query = $this->db->get('message');
        return $query->result_array();
    }
}
?>