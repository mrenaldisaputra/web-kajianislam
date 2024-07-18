<?php
class Search_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function get_combined_most_viewed($limit = 5)
    {
        $sql = "
            WITH most_viewed_artikel AS (
                SELECT id_related, COUNT(*) as total_hit, 'artikel' as kategori, tb_artikel.id as id, tb_artikel.judul as judul, tb_artikel.gambar as gambar, tb_artikel.tanggal as tanggal
                FROM tb_hit
                JOIN tb_artikel ON tb_artikel.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'artikel'
                GROUP BY tb_hit.id_related, tb_artikel.id, tb_artikel.judul, tb_artikel.gambar, tb_artikel.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ),
            most_viewed_doa AS (
                SELECT id_related, COUNT(*) as total_hit, 'doa' as kategori, tb_doa.id as id, tb_doa.judul as judul, tb_doa.gambar as gambar, tb_doa.tanggal as tanggal
                FROM tb_hit
                JOIN tb_doa ON tb_doa.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'doa'
                GROUP BY tb_hit.id_related, tb_doa.id, tb_doa.judul, tb_doa.gambar, tb_doa.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ),
            most_viewed_video AS (
                SELECT id_related, COUNT(*) as total_hit, 'video' as kategori, tb_video.id as id, tb_video.judul as judul, tb_video.gambar as gambar, tb_video.tanggal as tanggal
                FROM tb_hit
                JOIN tb_video ON tb_video.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'video'
                GROUP BY tb_hit.id_related, tb_video.id, tb_video.judul, tb_video.gambar, tb_video.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            )
            SELECT *
            FROM (
                SELECT * FROM most_viewed_artikel
                UNION ALL
                SELECT * FROM most_viewed_doa
                UNION ALL
                SELECT * FROM most_viewed_video
            ) as combined
            ORDER BY total_hit DESC
            LIMIT ?
        ";

        $query = $this->db->query($sql, array($limit));
        return $query->result_array();
    }

    // Fungsi pencarian berdasarkan judul
    public function search_by_title($keyword)
    {
        $this->db->select('id, judul, deskripsi, gambar, tanggal, "artikel" as kategori');
        $this->db->from('tb_artikel');
        $this->db->like('judul', $keyword);

        $query1 = $this->db->get_compiled_select();

        $this->db->select('id, judul, deskripsi, gambar, tanggal, "doa" as kategori');
        $this->db->from('tb_doa');
        $this->db->like('judul', $keyword);

        $query2 = $this->db->get_compiled_select();

        $this->db->select('id, judul, deskripsi, gambar, tanggal, "video" as kategori');
        $this->db->from('tb_video');
        $this->db->like('judul', $keyword);

        $query3 = $this->db->get_compiled_select();

        $final_query = $this->db->query($query1 . ' UNION ALL ' . $query2 . ' UNION ALL ' . $query3);
        return $final_query->result_array();
    }
}
?>