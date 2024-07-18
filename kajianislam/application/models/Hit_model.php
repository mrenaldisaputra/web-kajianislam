<?php
class Hit_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    // Fungsi untuk menambahkan hit baru
    public function tambah_hit($id_related, $kategori)
    {
        $data = array(
            'id_related' => $id_related,
            'tanggal' => date('Y-m-d H:i:s'),
            'kategori' => $kategori
        );
        $this->db->insert('tb_hit', $data);
    }

    public function get_combined_most_viewed($limit = 5)
    {
        $sql = "
            SELECT *
            FROM (
                SELECT id_related, COUNT(*) as total_hit, 'artikel' as kategori, tb_artikel.id as id, tb_artikel.judul as judul, tb_artikel.gambar as gambar, tb_artikel.tanggal as tanggal
                FROM tb_hit
                JOIN tb_artikel ON tb_artikel.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'artikel'
                GROUP BY tb_hit.id_related, tb_artikel.id, tb_artikel.judul, tb_artikel.gambar, tb_artikel.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ) AS most_viewed_artikel
            UNION ALL
            SELECT *
            FROM (
                SELECT id_related, COUNT(*) as total_hit, 'doa' as kategori, tb_doa.id as id, tb_doa.judul as judul, tb_doa.gambar as gambar, tb_doa.tanggal as tanggal
                FROM tb_hit
                JOIN tb_doa ON tb_doa.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'doa'
                GROUP BY tb_hit.id_related, tb_doa.id, tb_doa.judul, tb_doa.gambar, tb_doa.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ) AS most_viewed_doa
            UNION ALL
            SELECT *
            FROM (
                SELECT id_related, COUNT(*) as total_hit, 'video' as kategori, tb_video.id as id, tb_video.judul as judul, tb_video.gambar as gambar, tb_video.tanggal as tanggal
                FROM tb_hit
                JOIN tb_video ON tb_video.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'video'
                GROUP BY tb_hit.id_related, tb_video.id, tb_video.judul, tb_video.gambar, tb_video.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ) AS most_viewed_video
            ORDER BY total_hit DESC
            LIMIT ?
        ";

        $query = $this->db->query($sql, array($limit));
        return $query->result_array();
    }

    public function get_combined_most_viewed_today($limit = 3)
    {
        $sql = "
            SELECT *
            FROM (
                SELECT id_related, COUNT(*) as total_hit, 'artikel' as kategori, tb_artikel.id as id, tb_artikel.judul as judul, tb_artikel.gambar as gambar, tb_artikel.tanggal as tanggal
                FROM tb_hit
                JOIN tb_artikel ON tb_artikel.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'artikel' AND DATE(tb_hit.tanggal) = CURDATE()
                GROUP BY tb_hit.id_related, tb_artikel.id, tb_artikel.judul, tb_artikel.gambar, tb_artikel.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ) AS most_viewed_artikel
            UNION ALL
            SELECT *
            FROM (
                SELECT id_related, COUNT(*) as total_hit, 'doa' as kategori, tb_doa.id as id, tb_doa.judul as judul, tb_doa.gambar as gambar, tb_doa.tanggal as tanggal
                FROM tb_hit
                JOIN tb_doa ON tb_doa.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'doa' AND DATE(tb_hit.tanggal) = CURDATE()
                GROUP BY tb_hit.id_related, tb_doa.id, tb_doa.judul, tb_doa.gambar, tb_doa.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ) AS most_viewed_doa
            UNION ALL
            SELECT *
            FROM (
                SELECT id_related, COUNT(*) as total_hit, 'video' as kategori, tb_video.id as id, tb_video.judul as judul, tb_video.gambar as gambar, tb_video.tanggal as tanggal
                FROM tb_hit
                JOIN tb_video ON tb_video.id = tb_hit.id_related
                WHERE tb_hit.kategori = 'video' AND DATE(tb_hit.tanggal) = CURDATE()
                GROUP BY tb_hit.id_related, tb_video.id, tb_video.judul, tb_video.gambar, tb_video.tanggal
                ORDER BY total_hit DESC
                LIMIT 2
            ) AS most_viewed_video
            ORDER BY total_hit DESC
            LIMIT ?
        ";

        $query = $this->db->query($sql, array($limit));
        return $query->result_array();
    }
}
?>