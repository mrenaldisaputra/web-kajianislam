<?php
class Video_model extends CI_Model
{


    private $_table = "tb_video";
    const SESSION_KEY = 'tb_video_id';

    public function getListVideo()
    {
        $this->db->select('*');
        $this->db->from('tb_video');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_video_by_id($id)
    {
        $this->db->select('*');
        $this->db->from($this->_table);
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function get_most_viewed_videos($limit = 5, $type = 'video')
    {
        // Query untuk mengambil id_related dengan jumlah hit terbanyak
        $this->db->select('id_related, COUNT(*) as total_hit, tb_video.id as id, tb_video.judul as judul, tb_video.gambar as gambar, tb_video.tanggal as tanggal');
        $this->db->from('tb_hit');
        $this->db->where('kategori', $type);
        $this->db->join('tb_video', 'tb_video.id = tb_hit.id_related');
        $this->db->group_by('id_related');
        $this->db->order_by('total_hit', 'DESC');
        $this->db->limit($limit); // Ambil artikel dengan hit terbanyak sesuai limit
        $query = $this->db->get();
        return $query->result_array(); // Mengembalikan hasil query sebagai array
    }

    public function update_video($id, $video_data)
    {
        $this->db->update($this->_table, $video_data, ['id' => $id]);
    }


    public function new_video($video_data)
    {
        $this->db->insert(
            'tb_video',
            array(
                'judul' => $video_data['judul'],
                'deskripsi' => $video_data['deskripsi'],
                'tanggal' => $video_data['tanggal'],
                'isi' => $video_data['isi'],
                'urlvideo' => $video_data['urlvideo'],
                'id_kategori' => $video_data['id_kategori'],
                'status' => $video_data['status'],
                'gambar' => isset($video_data['gambar']) ? $video_data['gambar'] : null
            )
        );
    }

    public function get_categories()
    {
        $this->db->select('id_kategori as id, nama');
        $this->db->where('status', 'Aktif');
        $query = $this->db->get('tb_kategori');
        return $query->result_array();
    }




    public function get_detailvideo_by_id($id)
    {
        $this->db->select('tb_video.*, tb_kategori.nama AS kategori_nama');
        $this->db->from('tb_video');
        $this->db->join('tb_kategori', 'tb_video.id_kategori = tb_kategori.id_kategori');
        $this->db->where('tb_video.id', $id);
        $video = $this->db->get()->row_array();

        // Menambahkan data hit
        if ($video) {
            // Mengambil ID video
            $id_video = $video['id'];
            // Menyimpan data hit
            $this->tambah_hit($id_video, 'video');
        }

        return $video;
    }

    public function tambah_hit($id_related, $kategori)
    {
        $data = array(
            'id_related' => $id_related,
            'tanggal' => date('Y-m-d H:i:s'),
            'kategori' => $kategori
        );
        $this->db->insert('tb_hit', $data);
    }

    public function increment_count_hit($id)
    {
        $this->db->set('count_hit', 'count_hit + 1', FALSE);
        $this->db->where('id', $id);
        $this->db->update($this->_table);
    }

}