<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Portal extends CI_Controller
{
    private $_table_artikel = "tb_artikel";
    private $_table_video = "tb_video";
    private $_table_doa = "tb_doa";

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Artikel_model');
        $this->load->model('Doa_model');
        $this->load->model('Video_model');
        $this->load->model('Hit_model');
        $this->load->model('Dashboard_model');
        $this->load->helper(array('url', 'form', 'datetime', 'my_helper'));

        date_default_timezone_set('Asia/Jakarta');
    }

    private function track_visitor($page_visited)
    {
        $this->Dashboard_model->save_visitor($page_visited);
    }

    public function index()
    {
        $this->track_visitor('Beranda');

        $data['title'] = 'Beranda | Kajian Islam';
        $data['list_artikel'] = $this->Artikel_model->get_articles(3, 0);

        foreach ($data['list_artikel'] as &$artikel) {
            $artikel['tanggal_formatted'] = $this->formatTanggal($artikel['tanggal']);
        }

        $most_viewed = $this->Hit_model->get_combined_most_viewed_today(3);
        $data['most_viewed'] = $most_viewed;

        $this->load->view('templates/header_beranda', $data);
        $this->load->view('portal/beranda', $data);
        $this->load->view('templates/footer_beranda', $data);
    }

    public function search()
    {
        $keyword = $this->input->get('keyword');
        $this->track_visitor('Pencarian: ' . $keyword);

        $this->load->model('Search_model');
        $data['title'] = 'Hasil Pencarian | Kajian islam';
        $data['keyword'] = $keyword;
        $data['search_results'] = $this->Search_model->search_by_title($keyword);

        $most_viewed = $this->Hit_model->get_combined_most_viewed(5);
        $data['most_viewed'] = $most_viewed;

        $this->load->view('templates/header_beranda', $data);
        $this->load->view('portal/search_results', $data);
        $this->load->view('templates/footer_beranda', $data);
    }

    public function aboutus()
    {
        $this->track_visitor('About Us');

        $data['title'] = 'About Us | Kajian islam';

        $this->load->view('templates/header_list', $data);
        $this->load->view('portal/aboutus', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function pedomansiber()
    {
        $this->track_visitor('Pedoman Siber');

        $data['title'] = 'Pedoman Siber | Kajian islam';

        $this->load->view('templates/header_list', $data);
        $this->load->view('portal/pedomansiber', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function artikel($id)
    {
        $data['artikel'] = $this->Artikel_model->get_detailartikel_by_id($id);
        $this->track_visitor('Artikel: ' . $data['artikel']['judul']);
        $this->Artikel_model->increment_count_hit($id);

        $this->load->view('templates/header_user', $data);
        $this->load->view('portal/artikel', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function doa($id)
    {
        $data['doa'] = $this->Doa_model->get_detaildoa_by_id($id);
        $this->track_visitor('Doa: ' . $data['doa']['judul']);
        $this->Doa_model->increment_count_hit($id);

        $this->load->view('templates/header_user', $data);
        $this->load->view('portal/doa', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function video($id)
    {
        $data['video'] = $this->Video_model->get_detailvideo_by_id($id);
        $this->track_visitor('Video: ' . $data['video']['judul']);
        $this->Video_model->increment_count_hit($id);

        $url = $data['video']['urlvideo'];
        $data['video_id'] = null;

        if (!empty($url) && strpos($url, '?') !== false) {
            parse_str(parse_url($url, PHP_URL_QUERY), $query);
            if (!empty($query['v'])) {
                $data['video_id'] = $query['v'];
            }
        }

        $this->load->view('templates/header_user', $data);
        $this->load->view('portal/video', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function list_artikel()
    {
        $this->track_visitor('List Artikel');

        $data['title'] = 'Kumpulan Artikel | Kajian islam';
        $data['list_artikel'] = $this->db->get($this->_table_artikel)->result_array();

        $most_viewed = $this->Artikel_model->get_most_viewed_articles();
        $data['most_viewed_articles'] = $most_viewed;

        $most_viewed = $this->Hit_model->get_combined_most_viewed(5);
        $data['most_viewed'] = $most_viewed;

        $this->load->view('templates/header_list', $data);
        $this->load->view('portal/list_artikel', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function list_doa()
    {
        $this->track_visitor('List Doa');

        $data['title'] = 'Kumpulan Pilihan Doa | Kajian islam';
        $data['list_doa'] = $this->db->get($this->_table_doa)->result_array();

        $most_viewed = $this->Doa_model->get_most_viewed_doa();
        $data['most_viewed_doa'] = $most_viewed;

        $most_viewed = $this->Hit_model->get_combined_most_viewed(5);
        $data['most_viewed'] = $most_viewed;

        $this->load->view('templates/header_list', $data);
        $this->load->view('portal/list_doa', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function list_video()
    {
        $this->track_visitor('List Video');

        $data['title'] = 'Kumpulan Video | Kajian islam';
        $data['list_video'] = $this->db->get($this->_table_video)->result_array();

        $most_viewed = $this->Video_model->get_most_viewed_videos();
        $data['most_viewed_video'] = $most_viewed;

        $most_viewed = $this->Hit_model->get_combined_most_viewed(5);
        $data['most_viewed'] = $most_viewed;

        $this->load->view('templates/header_list', $data);
        $this->load->view('portal/list_video', $data);
        $this->load->view('templates/footer_user', $data);
    }

    public function loadMoreArticles()
    {
        $offset = $this->input->get('offset'); // Ambil nilai offset dari permintaan AJAX
        $limit = 10; // Jumlah data yang ingin dimuat

        $this->db->select('*');
        $this->db->from('tb_artikel');
        $this->db->where('status', 'Aktif');
        $this->db->order_by('tanggal', 'DESC');
        $this->db->limit($limit, $offset);
        $list_artikel = $this->db->get()->result_array();

        $data = '';
        foreach ($list_artikel as $artikel) {
            $kategori = $this->db->get_where('tb_kategori', ['id_kategori' => $artikel['id_kategori']])->row_array();
            $data .= '
                <div class="card mb-3 mb-sm-4">
                    <div class="row g-3">
                        <div class="col-4">
                            <img class="image-cover" src="' . base_url('assets/img/artikel/') . (($artikel['gambar'] === 'no_image.png') ? $artikel['gambar'] : $artikel['gambar']) . '" alt="">
                        </div>
                        <div class="col-8">
                            <a href="' . base_url('portal/artikel/') . $artikel['id'] . '" class="badge text-bg-dark mb-2"><i class="fas fa-circle me-2 small fw-bold"></i>' . $kategori['nama'] . '</a>
                            <h4><a href="' . base_url('portal/artikel/') . $artikel['id'] . '" class="btn-link stretched-link text-reset fw-bold">' . $artikel['judul'] . '</a></h4>
                            <div class="nav nav-divider align-items-center d-sm-inline-block">
                                ' . $this->formatTanggal($artikel['tanggal']) . '
                            </div>
                        </div>
                    </div>
                </div>
            ';
        }

        $response = [
            'status' => 'success',
            'data' => $data,
            'records' => count($list_artikel)
        ];

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($response));
    }

    public function loadMoreDoa()
    {
        $offset = $this->input->get('offset'); // Ambil nilai offset dari permintaan AJAX
        $limit = 10; // Jumlah data yang ingin dimuat

        $this->db->select('*');
        $this->db->from('tb_doa');
        $this->db->where('status', 'Aktif');
        $this->db->order_by('tanggal', 'DESC');
        $this->db->limit($limit, $offset);
        $list_doa = $this->db->get()->result_array();

        $data = '';
        foreach ($list_doa as $doa) {
            $kategori = $this->db->get_where('tb_kategori', ['id_kategori' => $doa['id_kategori']])->row_array();
            $data .= '
                <div class="card mb-3 mb-sm-4">
                    <div class="row g-3">
                        <div class="col-4">
                            <img class="image-cover" src="' . base_url('assets/img/doa/') . (($doa['gambar'] === 'no_image.png') ? $doa['gambar'] : $doa['gambar']) . '" alt="">
                        </div>
                        <div class="col-8">
                            <a href="' . base_url('portal/doa/') . $doa['id'] . '" class="badge text-bg-dark mb-2"><i class="fas fa-circle me-2 small fw-bold"></i>' . $kategori['nama'] . '</a>
                            <h4><a href="' . base_url('portal/doa/') . $doa['id'] . '" class="btn-link stretched-link text-reset fw-bold">' . $doa['judul'] . '</a></h4>
                            <div class="nav nav-divider align-items-center d-sm-inline-block">
                                ' . $this->formatTanggal($doa['tanggal']) . '
                            </div>
                        </div>
                    </div>
                </div>
            ';
        }

        $response = [
            'status' => 'success',
            'data' => $data,
            'records' => count($list_doa)
        ];

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($response));
    }

    public function loadMoreVideo()
    {
        $offset = $this->input->get('offset'); // Ambil nilai offset dari permintaan AJAX
        $limit = 10; // Jumlah data yang ingin dimuat

        $this->db->select('*');
        $this->db->from('tb_video');
        $this->db->where('status', 'Aktif');
        $this->db->order_by('tanggal', 'DESC');
        $this->db->limit($limit, $offset);
        $list_video = $this->db->get()->result_array();

        $data = '';
        foreach ($list_video as $video) {
            $kategori = $this->db->get_where('tb_kategori', ['id_kategori' => $video['id_kategori']])->row_array();
            $data .= '
                <div class="card mb-3 mb-sm-4">
                    <div class="row g-3">
                        <div class="col-4">
                            <img class="image-cover" src="' . base_url('assets/img/video/') . (($video['gambar'] === 'no_image.png') ? $video['gambar'] : $video['gambar']) . '" alt="">
                        </div>
                        <div class="col-8">
                            <a href="' . base_url('portal/video/') . $video['id'] . '" class="badge text-bg-dark mb-2"><i class="fas fa-circle me-2 small fw-bold"></i>' . $kategori['nama'] . '</a>
                            <h4><a href="' . base_url('portal/video/') . $video['id'] . '" class="btn-link stretched-link text-reset fw-bold">' . $video['judul'] . '</a></h4>
                            <div class="nav nav-divider align-items-center d-sm-inline-block">
                                ' . $this->formatTanggal($video['tanggal']) . '
                            </div>
                        </div>
                    </div>
                </div>
            ';
        }

        $response = [
            'status' => 'success',
            'data' => $data,
            'records' => count($list_video)
        ];

        $this->output
            ->set_content_type('application/json')
            ->set_output(json_encode($response));
    }

    private function formatTanggal($tanggalDb)
    {
        // Setel zona waktu ke zona waktu Indonesia, misal WIB
        date_default_timezone_set('Asia/Jakarta');

        // Array untuk konversi nama hari dari Inggris ke Indonesia
        $hariIndonesia = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

        // Array untuk konversi nama bulan dari Inggris ke Indonesia
        $bulanIndonesia = [
            1 => 'Januari',
            2 => 'Februari',
            3 => 'Maret',
            4 => 'April',
            5 => 'Mei',
            6 => 'Juni',
            7 => 'Juli',
            8 => 'Agustus',
            9 => 'September',
            10 => 'Oktober',
            11 => 'November',
            12 => 'Desember'
        ];

        // Mengubah string tanggal dari database menjadi timestamp
        $timestamp = strtotime($tanggalDb);

        // Menghitung selisih waktu antara waktu saat ini dan waktu artikel dibuat
        $selisihWaktu = time() - $timestamp;

        // Jika selisih waktu kurang dari 1 jam, tampilkan format "x menit yang lalu"
        if ($selisihWaktu < 3600) {
            $menit = round($selisihWaktu / 60);
            return "$menit menit yang lalu";
        }

        // Jika selisih waktu kurang dari 24 jam, tampilkan format "x jam yang lalu"
        if ($selisihWaktu < 86400) {
            $jam = round($selisihWaktu / 3600);
            return "$jam jam yang lalu";
        }

        // Mengambil nama hari berdasarkan timestamp
        $hari = $hariIndonesia[date('w', $timestamp)];

        // Mengambil tanggal tanpa leading zero
        $tanggal = date('j', $timestamp);

        // Mengambil nama bulan berdasarkan timestamp
        $bulan = $bulanIndonesia[(int) date('m', $timestamp)];

        // Mengambil tahun dari timestamp
        $tahun = date('Y', $timestamp);

        // Mengambil waktu (jam dan menit) dari timestamp
        $jam = date('H:i', $timestamp);

        // Menggabungkan semua bagian untuk membuat format tanggal bahasa Indonesia
        $tanggalFormatted = "$hari, $tanggal $bulan $tahun $jam WIB";

        // Mengembalikan tanggal yang sudah diformat
        return $tanggalFormatted;
    }
}
?>