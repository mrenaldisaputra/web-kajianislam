<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Kategori_model extends CI_Model
{

    public function get_all_categories()
    {
        $this->db->select('*');
        $this->db->from('tb_kategori');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function insert_category($data)
    {
        $this->db->insert('tb_kategori', $data);
    }

    public function get_category_by_id($id)
    {
        $this->db->select('*');
        $this->db->from('tb_kategori');
        $this->db->where('id_kategori', $id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function update_category($id, $data)
    {
        $this->db->where('id_kategori', $id);
        $this->db->update('tb_kategori', $data);
    }

    public function delete_category($id)
    {
        $this->db->where('id_kategori', $id);
        $this->db->delete('tb_kategori');
    }

    public function get_category_counts($category_id)
    {
        $this->db->select('COUNT(*) as artikel_count');
        $this->db->from('tb_artikel');
        $this->db->where('id_kategori', $category_id);
        $artikel_count = $this->db->get()->row()->artikel_count;

        $this->db->select('COUNT(*) as doa_count');
        $this->db->from('tb_doa');
        $this->db->where('id_kategori', $category_id);
        $doa_count = $this->db->get()->row()->doa_count;

        $this->db->select('COUNT(*) as video_count');
        $this->db->from('tb_video');
        $this->db->where('id_kategori', $category_id);
        $video_count = $this->db->get()->row()->video_count;

        return array(
            'artikel_count' => $artikel_count,
            'doa_count' => $doa_count,
            'video_count' => $video_count
        );
    }

    public function get_all_categories_with_counts()
    {
        $this->db->select('*');
        $this->db->from('tb_kategori');
        $query = $this->db->get();

        $categories = $query->result_array();

        foreach ($categories as &$category) {
            $counts = $this->get_category_counts($category['id_kategori']);
            $category['artikel_count'] = $counts['artikel_count'];
            $category['doa_count'] = $counts['doa_count'];
            $category['video_count'] = $counts['video_count'];
        }

        return $categories;
    }
}