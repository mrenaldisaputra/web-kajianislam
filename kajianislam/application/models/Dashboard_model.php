<?php
class Dashboard_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function get_post_count()
    {
        $query_artikel = $this->db->query("SELECT COUNT(*) as total FROM tb_artikel WHERE status = 'Aktif'");
        $artikel_count = $query_artikel->row()->total;

        $query_video = $this->db->query("SELECT COUNT(*) as total FROM tb_video WHERE status = 'Aktif'");
        $video_count = $query_video->row()->total;

        $query_doa = $this->db->query("SELECT COUNT(*) as total FROM tb_doa WHERE status = 'Aktif'");
        $doa_count = $query_doa->row()->total;

        $total_posts = $artikel_count + $video_count + $doa_count;
        return $total_posts;
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

    public function get_total_hits()
    {
        $sql = "SELECT COUNT(*) as total_hits FROM tb_hit";
        $query = $this->db->query($sql);
        return $query->row()->total_hits;
    }

    public function get_total_visitors()
    {
        $sql = "SELECT COUNT(DISTINCT unique_user_id) as total_visitors FROM tb_visitors";
        $query = $this->db->query($sql);
        return $query->row()->total_visitors;
    }


    public function save_visitor($page_visited)
    {
        $ip_address = $this->input->ip_address();
        $user_agent = $this->input->user_agent();
        $cookie_name = 'unique_user_id';
        $unique_user_id = $this->input->cookie($cookie_name, true);

        if (!$unique_user_id) {
            // Generate a unique ID for the user
            $unique_user_id = uniqid('user_', true);
            $cookie = array(
                'name' => $cookie_name,
                'value' => $unique_user_id,
                'expire' => '86500',  // 1 day
                'secure' => false
            );
            $this->input->set_cookie($cookie);
        }

        $data = array(
            'ip_address' => $ip_address,
            'visit_time' => date('Y-m-d H:i:s'),
            'page_visited' => $page_visited,
            'user_agent' => $user_agent,
            'unique_user_id' => $unique_user_id
        );
        $this->db->insert('tb_visitors', $data);
    }


    public function get_latest_posts($limit = 3)
    {
        $sql = "
            SELECT id, judul, gambar, tanggal, 'artikel' as kategori FROM tb_artikel WHERE status = 'Aktif'
            UNION ALL
            SELECT id, judul, gambar, tanggal, 'video' as kategori FROM tb_video WHERE status = 'Aktif'
            UNION ALL
            SELECT id, judul, gambar, tanggal, 'doa' as kategori FROM tb_doa WHERE status = 'Aktif'
            ORDER BY tanggal DESC
            LIMIT ?
        ";

        $query = $this->db->query($sql, array($limit));
        return $query->result_array();
    }

    public function get_most_viewed_items($limit = 10)
    {
        $sql = "
            SELECT 'artikel' as kategori, tb_artikel.id, tb_artikel.judul, tb_artikel.gambar, tb_artikel.tanggal, COUNT(tb_hit.id_related) as total_hit
            FROM tb_hit
            JOIN tb_artikel ON tb_hit.id_related = tb_artikel.id
            WHERE tb_hit.kategori = 'artikel' AND tb_artikel.status = 'Aktif'
            GROUP BY tb_artikel.id, tb_artikel.judul, tb_artikel.gambar, tb_artikel.tanggal
            UNION ALL
            SELECT 'doa' as kategori, tb_doa.id, tb_doa.judul, tb_doa.gambar, tb_doa.tanggal, COUNT(tb_hit.id_related) as total_hit
            FROM tb_hit
            JOIN tb_doa ON tb_hit.id_related = tb_doa.id
            WHERE tb_hit.kategori = 'doa' AND tb_doa.status = 'Aktif'
            GROUP BY tb_doa.id, tb_doa.judul, tb_doa.gambar, tb_doa.tanggal
            UNION ALL
            SELECT 'video' as kategori, tb_video.id, tb_video.judul, tb_video.gambar, tb_video.tanggal, COUNT(tb_hit.id_related) as total_hit
            FROM tb_hit
            JOIN tb_video ON tb_hit.id_related = tb_video.id
            WHERE tb_hit.kategori = 'video' AND tb_video.status = 'Aktif'
            GROUP BY tb_video.id, tb_video.judul, tb_video.gambar, tb_video.tanggal
            ORDER BY total_hit DESC
            LIMIT ?
        ";

        $query = $this->db->query($sql, array($limit));
        return $query->result_array();
    }

    public function get_latest_messages($limit = 10)
    {
        $this->db->select('id, subject, email, message, created_at');
        $this->db->from('message');
        $this->db->order_by('created_at', 'DESC');
        $this->db->limit($limit);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_message_by_id($id)
    {
        $this->db->where('id', $id);
        $query = $this->db->get('message');
        return $query->row_array();
    }
}
?>