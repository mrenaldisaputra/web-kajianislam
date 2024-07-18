<?php

class Admim_model extends CI_Model
{
    private $_table = "tb_admin";
    const SESSION_KEY = 'tb_admin_id';

    public function getListAdmin()
    {
        $this->db->select('*');
        $this->db->from('tb_admin');
        $query = $this->db->get();
        return $query->result_array();
    }


}