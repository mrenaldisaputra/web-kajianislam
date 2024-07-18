<?php
class Doa_model extends CI_Model
{


    private $_table = "tb_doa";
    const SESSION_KEY = 'tb_doa_id';

    public function getListdoa()
    {
        $this->db->select('*');
        $this->db->from('tb_doa');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function get_doa_by_id($id)
    {
        $this->db->select('*');
        $this->db->from($this->_table);
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row_array();
    }

    public function get_most_viewed_doa($limit = 5, $type = 'doa')
    {
        // Query untuk mengambil id_related dengan jumlah hit terbanyak
        $this->db->select('id_related, COUNT(*) as total_hit, tb_doa.id as id, tb_doa.judul as judul, tb_doa.gambar as gambar, tb_doa.tanggal as tanggal');
        $this->db->from('tb_hit');
        $this->db->where('kategori', $type);
        $this->db->join('tb_doa', 'tb_doa.id = tb_hit.id_related');
        $this->db->group_by('id_related');
        $this->db->order_by('total_hit', 'DESC');
        $this->db->limit($limit); // Ambil artikel dengan hit terbanyak sesuai limit
        $query = $this->db->get();
        return $query->result_array(); // Mengembalikan hasil query sebagai array
    }

    public function update_doa($id, $doa_data)
    {
        $this->db->update($this->_table, $doa_data, ['id' => $id]);
    }


    public function new_doa($doa_data)
    {
        $this->db->insert(
            'tb_doa',
            array(
                'judul' => $doa_data['judul'],
                'deskripsi' => $doa_data['deskripsi'],
                'nama_penulis' => $doa_data['nama_penulis'],
                'tanggal' => $doa_data['tanggal'],
                'isi' => $doa_data['isi'],
                'urlvideo' => $doa_data['urlvideo'],
                'id_kategori' => $doa_data['id_kategori'],
                'status' => $doa_data['status'],
                'gambar' => isset($doa_data['gambar']) ? $doa_data['gambar'] : null
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


    public function get_detaildoa_by_id($id)
    {
        $this->db->select('tb_doa.*, tb_kategori.nama AS kategori_nama');
        $this->db->from('tb_doa');
        $this->db->join('tb_kategori', 'tb_doa.id_kategori = tb_kategori.id_kategori');
        $this->db->where('tb_doa.id', $id);
        $doa = $this->db->get()->row_array();

        // Menambahkan data hit
        if ($doa) {
            // Mengambil ID doa
            $id_doa = $doa['id'];
            // Menyimpan data hit
            $this->tambah_hit($id_doa, 'doa');
        }

        return $doa;
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