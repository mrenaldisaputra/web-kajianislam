<?php
class Artikel_model extends CI_Model
{


    private $_table = "tb_artikel";
    const SESSION_KEY = 'tb_artikel_id';



    public function get_articles($limit, $offset)
    {
        $this->db->select('tb_artikel.*, tb_kategori.nama AS kategori');
        $this->db->from('tb_artikel');
        $this->db->join('tb_kategori', 'tb_artikel.id_kategori = tb_kategori.id_kategori');
        $this->db->where('tb_artikel.status', 'Aktif');
        $this->db->order_by('tb_artikel.tanggal', 'DESC');
        $this->db->limit($limit, $offset);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_most_viewed_articles($limit = 5, $type = 'artikel')
    {
        // Query untuk mengambil id_related dengan jumlah hit terbanyak
        $this->db->select('id_related, COUNT(*) as total_hit, tb_artikel.id as id, tb_artikel.judul as judul, tb_artikel.gambar as gambar, tb_artikel.tanggal as tanggal');
        $this->db->from('tb_hit');
        $this->db->where('kategori', $type);
        $this->db->join('tb_artikel', 'tb_artikel.id = tb_hit.id_related');
        $this->db->group_by('id_related');
        $this->db->order_by('total_hit', 'DESC');
        $this->db->limit($limit); // Ambil artikel dengan hit terbanyak sesuai limit
        $query = $this->db->get();
        return $query->result_array(); // Mengembalikan hasil query sebagai array
    }


    public function get_artikel_by_id($id)
    {
        $this->db->select('*');
        $this->db->from($this->_table);
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function update_artikel($id, $artikel_data)
    {
        $this->db->update($this->_table, $artikel_data, ['id' => $id]);
    }


    public function new_artikel($artikel_data)
    {
        $this->db->insert(
            'tb_artikel',
            array(
                'judul' => $artikel_data['judul'],
                'deskripsi' => $artikel_data['deskripsi'],
                'nama_penulis' => $artikel_data['nama_penulis'],
                'tanggal' => $artikel_data['tanggal'],
                'isi' => $artikel_data['isi'],
                'urlvideo' => $artikel_data['urlvideo'],
                'id_kategori' => $artikel_data['id_kategori'],
                'status' => $artikel_data['status'],
                'gambar' => isset($artikel_data['gambar']) ? $artikel_data['gambar'] : null
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

    public function get_detailartikel_by_id($id)
    {
        $this->db->select('tb_artikel.*, tb_kategori.nama AS kategori_nama');
        $this->db->from('tb_artikel');
        $this->db->join('tb_kategori', 'tb_artikel.id_kategori = tb_kategori.id_kategori');
        $this->db->where('tb_artikel.id', $id);
        $artikel = $this->db->get()->row_array();

        // Menambahkan data hit
        if ($artikel) {
            // Mengambil ID artikel
            $id_artikel = $artikel['id'];
            // Menyimpan data hit
            $this->tambah_hit($id_artikel, 'artikel');
        }

        return $artikel;
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