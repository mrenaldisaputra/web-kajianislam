-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2024 pada 09.21
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kajianislam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(1) NOT NULL,
  `jenis_role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_role`
--

INSERT INTO `admin_role` (`id`, `jenis_role`) VALUES
(1, 'Administrator'),
(2, 'Super Administrator');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `message`
--

INSERT INTO `message` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(9, 'Muhammad Renaldi Saputra', 'reymuhammad@apps.ipb.ac.id', 'Pengajuan Kerjasama Pengajuan Iklan', 'Lorem Ipsum Dolor Sit Amet\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.\r\n\r\nVestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem.\r\n\r\nProin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\r\n\r\nSubheading\r\nNam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam.\r\n\r\nAnother Subheading\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. Praesent blandit dolor. Sed non quam. In vel mi sit amet augue congue elementum. Morbi in ipsum sit amet pede facilisis laoreet. Donec lacus nunc, viverra nec.\r\n\r\nVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam feugiat lorem non metus. Vestibulum dapibus nunc ac augue. Curabitur quis libero leo, pharetra mattis eros. Praesent mauris. Fusce nec tellus sed augue semper porta.\r\n\r\nMauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.\r\n\r\n', '2024-06-20 18:17:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(3) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(2) NOT NULL,
  `status` int(1) NOT NULL,
  `image` varchar(32) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `nama`, `email`, `password`, `role_id`, `status`, `image`, `created_at`, `last_login`) VALUES
(6, 'Muhammad Renaldi Saputra', 'reymuhammad@apps.ipb.ac.id', '$2y$10$oWeWnDQZIegCNziT0LN7PuaxiG2bew8.tpxezMr4dUwxDxa0lBtcq', 1, 1, 'INTERN_TRANS_TV.png', '2024-03-04 06:02:49', '2024-06-21 00:16:26'),
(54, 'Raden Roro Fatimah Azzahra Aulia', 'radenroro@gmail.com', '$2y$10$I3umBHyGACVcn8wMuKbol.tRPxKaBq/s3gJn7d1/k6HCdcDfxpLY2', 1, 1, 'AYANG_CANTIK_NDUT_(1).png', '2024-03-21 19:22:44', '2024-05-05 16:32:20'),
(55, 'Trans TV', 'transtv@gmail.com', '$2y$10$KX/lgzScOkkjh2BtGRi8euFXFM5j7gUZEjsd7LzpDbfsRPRm9zHLy', 1, 1, 'default.jpg', '2024-06-05 15:29:50', '2024-06-21 08:13:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_artikel`
--

CREATE TABLE `tb_artikel` (
  `id` int(7) NOT NULL,
  `id_kategori` int(7) DEFAULT NULL,
  `nama_penulis` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL,
  `tanggal` datetime NOT NULL,
  `isi` text DEFAULT NULL,
  `gambar` varchar(355) NOT NULL,
  `urlvideo` varchar(255) DEFAULT NULL,
  `count_hit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_artikel`
--

INSERT INTO `tb_artikel` (`id`, `id_kategori`, `nama_penulis`, `judul`, `deskripsi`, `status`, `tanggal`, `isi`, `gambar`, `urlvideo`, `count_hit`) VALUES
(52, 1, 'Ahmad Fauzan', 'Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Shalat adalah tiang agama yang menjadi kewajiban setiap muslim. Artikel ini membahas pentingnya shalat dalam kehidupan sehari-hari.', 'Aktif', '2024-06-11 14:42:00', '<p>Shalat adalah salah satu rukun Islam yang wajib dilakukan oleh setiap muslim. Shalat memiliki banyak keutamaan, salah satunya adalah sebagai sarana komunikasi antara hamba dengan Tuhannya. Dalam kehidupan sehari-hari, shalat juga memberikan ketenangan jiwa dan membentuk karakter yang baik. Dengan shalat, seseorang diajarkan untuk disiplin, sabar, dan selalu mengingat Allah dalam segala situasi.</p><p><br></p><p>Selain itu, shalat juga memiliki manfaat kesehatan, seperti gerakan dalam shalat yang dapat melancarkan peredaran darah dan menjaga kebugaran tubuh. Oleh karena itu, sangat penting bagi kita untuk menjaga shalat lima waktu dan tidak meninggalkannya.</p><p><br></p>', 'otomatis-menjadi-muslim.jpg', 'https://youtu.be/weDG93zilSI?si=UUUyWkgd8DxXVDq8', 20),
(53, 1, 'Nur Aisyah', 'Keutamaan Sedekah dalam Islam', 'Sedekah memiliki banyak keutamaan dalam Islam, baik untuk pemberi maupun penerima. Artikel ini membahas manfaat sedekah.\r\n', 'Aktif', '2024-06-10 10:10:00', '<p>Sedekah adalah salah satu amalan yang sangat dianjurkan dalam Islam. Dengan bersedekah, kita tidak hanya membantu orang lain yang membutuhkan, tetapi juga mendapatkan pahala yang besar di sisi Allah SWT. Sedekah dapat membersihkan harta kita dan menjauhkan kita dari bencana.</p><p>Rasulullah SAW bersabda, \"Sedekah itu memadamkan dosa seperti air memadamkan api.\" (HR. Tirmidzi). Oleh karena itu, mari kita rutinkan bersedekah agar hidup kita penuh berkah dan ridha Allah SWT.</p><h4>1. Sedekah Membersihkan Harta</h4><p>Salah satu keutamaan sedekah adalah membersihkan harta kita dari kotoran dan dosa. Harta yang kita miliki adalah titipan Allah SWT, dan sebagian</p><p>dari harta tersebut merupakan hak bagi mereka yang membutuhkan. Dengan bersedekah, kita menunaikan amanah tersebut dan menjaga harta kita tetap bersih dan berkah.</p><p>Allah SWT berfirman dalam Al-Quran:</p><blockquote>\"Ambillah zakat dari sebagian harta mereka, dengan zakat itu kamu membersihkan dan mensucikan mereka...\" (QS. At-Taubah: 103)</blockquote><p>Sedekah tidak hanya mencakup zakat yang wajib, tetapi juga infaq dan shadaqah yang sunnah. Setiap kali kita bersedekah, kita membersihkan diri dan harta kita dari sifat kikir dan egois, serta menggantinya dengan kebaikan dan kemurahan hati.</p><h4>2. Sedekah Menjauhkan dari Bencana</h4><p>Sedekah juga memiliki manfaat luar biasa dalam menjauhkan kita dari bencana. Dalam hadis lain, Rasulullah SAW bersabda:</p><blockquote>\"Bentengilah diri kalian dari api neraka walau dengan sebutir kurma.\" (HR. Bukhari dan Muslim)</blockquote><p>Hadis ini menunjukkan betapa besar manfaat sedekah, bahkan jika nilainya kecil. Sedekah dapat menjadi pelindung bagi kita dari berbagai musibah dan kesulitan hidup. Ketika kita bersedekah, kita membuka pintu rahmat dan perlindungan dari Allah SWT.</p><h4>3. Sedekah Membawa Keberkahan</h4><p>Sedekah adalah salah satu cara untuk menarik keberkahan dalam hidup kita. Allah SWT menjanjikan balasan yang berlipat ganda bagi mereka yang bersedekah. Dalam Al-Quran, Allah berfirman:</p><blockquote>\"Perumpamaan (nafkah yang dikeluarkan oleh) orang-orang yang menafkahkan hartanya di jalan Allah adalah serupa dengan sebutir benih yang menumbuhkan tujuh bulir, pada tiap-tiap bulir seratus biji. Allah melipatgandakan (ganjaran) bagi siapa yang Dia kehendaki. Dan Allah Maha Luas (karunia-Nya) lagi Maha Mengetahui.\" (QS. Al-Baqarah: 261)</blockquote><p>Dengan bersedekah, kita tidak akan kekurangan, justru kita akan mendapatkan lebih banyak rezeki yang berkah. Keberkahan ini tidak hanya dalam bentuk harta, tetapi juga dalam bentuk kesehatan, kebahagiaan, dan ketenangan hidup.</p><h4>4. Sedekah Membangun Solidaritas Sosial</h4><p>Sedekah juga berperan penting dalam membangun solidaritas sosial dan kepedulian terhadap sesama. Ketika kita bersedekah, kita ikut meringankan beban orang lain dan membantu mereka dalam kesulitan. Hal ini menciptakan rasa kebersamaan dan persaudaraan yang kuat dalam masyarakat.</p><p>Rasulullah SAW bersabda:</p><blockquote>\"Tidak beriman salah seorang dari kalian hingga ia mencintai saudaranya seperti ia mencintai dirinya sendiri.\" (HR. Bukhari dan Muslim)</blockquote><p>Sedekah adalah salah satu bentuk nyata dari cinta dan perhatian kita kepada sesama. Dengan bersedekah, kita menunjukkan bahwa kita peduli dan siap membantu saudara-saudara kita yang membutuhkan.</p><h4>5. Sedekah Mendekatkan Diri kepada Allah</h4><p>Sedekah adalah salah satu amalan yang dapat mendekatkan diri kita kepada Allah SWT. Dalam sebuah hadis qudsi, Allah SWT berfirman:</p><blockquote>\"Aku adalah sebagaimana yang hamba-Ku sangka terhadap-Ku. Aku bersamanya ketika dia mengingat-Ku. Jika dia mengingat-Ku dalam dirinya, maka Aku mengingatnya dalam diri-Ku. Jika dia mengingat-Ku di tengah orang banyak, maka Aku mengingatnya di tengah kumpulan yang lebih baik dari mereka. Jika dia mendekat kepada-Ku sejengkal, maka Aku mendekat kepadanya sehasta. Jika dia mendekat kepada-Ku sehasta, maka Aku mendekat kepadanya sedepa. Jika dia datang kepada-Ku berjalan, maka Aku datang kepadanya berlari.\" (HR. Bukhari dan Muslim)</blockquote><p>Sedekah adalah salah satu bentuk ibadah yang menunjukkan rasa syukur kita kepada Allah atas segala nikmat yang diberikan-Nya. Dengan bersedekah, kita berharap mendapatkan keridhaan dan cinta Allah SWT.</p><h4>6. Sedekah Sebagai Investasi Akhirat</h4><p>Sedekah adalah salah satu bentuk investasi terbaik untuk akhirat. Dalam kehidupan dunia yang sementara ini, kita sering kali lupa bahwa kehidupan akhiratlah yang kekal. Sedekah adalah salah satu cara untuk mengumpulkan pahala dan bekal bagi kehidupan akhirat kita.</p><p>Rasulullah SAW bersabda:</p><blockquote>\"Jika anak Adam meninggal dunia, maka terputuslah amalannya kecuali tiga perkara: sedekah jariyah, ilmu yang bermanfaat, atau anak shalih yang mendoakannya.\" (HR. Muslim)</blockquote><p>Sedekah jariyah adalah sedekah yang pahalanya terus mengalir meskipun kita telah meninggal dunia. Contohnya adalah membangun masjid, sekolah, atau sumur yang manfaatnya dapat dirasakan oleh banyak orang dalam waktu yang lama.</p>', 'Keutamaan-Sedekah-di-Bulan-Ramadhan-Bukan-Cuma-Menambah-Pahala-1.jpg', '', 5),
(54, 7, 'Hana Nurul', 'Mengajarkan Anak Berpuasa Sejak Dini', 'Mengajarkan anak berpuasa sejak dini memiliki banyak manfaat, baik secara spiritual maupun kesehatan.', 'Aktif', '2024-06-21 01:45:00', '<p>Mengajarkan anak berpuasa sejak dini adalah langkah penting dalam pendidikan agama mereka. Dengan membiasakan anak untuk berpuasa, kita tidak hanya menanamkan nilai-nilai keagamaan tetapi juga mengajarkan mereka tentang disiplin, kesabaran, dan empati terhadap orang lain yang kurang beruntung.</p><p>Puasa bukan hanya menahan diri dari makan dan minum, tetapi juga menahan diri dari perbuatan yang tidak baik. Oleh karena itu, penting bagi orang tua untuk menjelaskan kepada anak-anak tentang makna dan tujuan puasa. Mengajak mereka untuk berpuasa secara bertahap, seperti setengah hari atau beberapa jam, dapat membantu mereka memahami dan merasakan hikmah puasa.</p><p>Dalam hadits disebutkan, \"Latihlah anak-anakmu untuk berpuasa saat mereka berusia tujuh tahun, dan pukullah mereka jika tidak berpuasa ketika berusia sepuluh tahun.\" (HR. Abu Dawud). Hadits ini menunjukkan pentingnya mengajarkan anak untuk berpuasa sejak usia dini.</p><p>Selain manfaat spiritual, puasa juga memiliki manfaat kesehatan bagi anak-anak. Puasa dapat membantu mengatur pola makan, meningkatkan metabolisme, dan mengajarkan anak untuk memiliki pola hidup sehat. Puasa juga dapat membantu meningkatkan konsentrasi dan daya tahan tubuh mereka.</p><p>Berikut beberapa tips untuk mengajarkan anak berpuasa:</p><p>1. **Berikan Contoh yang Baik**: Anak-anak cenderung meniru perilaku orang tua mereka. Oleh karena itu, berikan contoh yang baik dengan menjalankan puasa dengan penuh semangat dan kesabaran.</p><p>2. **Beri Penjelasan yang Mudah Dipahami**: Jelaskan kepada anak-anak tentang pentingnya puasa dan manfaatnya. Gunakan bahasa yang sederhana dan mudah dipahami.</p><p>3. **Buat Suasana Menyenangkan**: Ciptakan suasana yang menyenangkan saat sahur dan berbuka puasa. Libatkan anak-anak dalam persiapan makanan agar mereka merasa lebih antusias.</p><p>4. **Berikan Penghargaan**: Berikan penghargaan kecil sebagai bentuk motivasi dan apresiasi atas usaha mereka dalam berpuasa. Penghargaan ini bisa berupa pujian, hadiah kecil, atau kegiatan menyenangkan.</p><p>5. **Pantau Kesehatan Anak**: Pastikan anak-anak tetap sehat dan tidak mengalami kelelahan berlebihan. Jika mereka merasa lelah atau sakit, beri mereka izin untuk berbuka puasa.</p><p>Dengan mengajarkan anak berpuasa sejak dini, kita berharap mereka dapat tumbuh menjadi pribadi yang kuat secara spiritual dan fisik. Semoga Allah SWT memberikan kemudahan dan keberkahan dalam mendidik anak-anak kita. Aamiin.</p><p><br></p>', 'ilustrasi-doa-untuk-orang-tua.jpeg', '', 4),
(55, 1, 'Laila Salsabila', 'Keutamaan dan Manfaat Membaca Surah Al-Kahfi', 'Membaca Surah Al-Kahfi pada hari Jumat memiliki banyak keutamaan dan manfaat.', 'Aktif', '2024-06-21 01:50:00', '<p>Surah Al-Kahfi adalah salah satu surah yang memiliki banyak keutamaan dalam Al-Quran. Surah ini terdiri dari 110 ayat dan sering dibaca pada hari Jumat. Membaca Surah Al-Kahfi pada hari Jumat memiliki banyak keutamaan dan manfaat yang sangat besar bagi umat Islam.</p><p>Rasulullah SAW bersabda, \"Barangsiapa membaca Surah Al-Kahfi pada hari Jumat, maka akan dipancarkan cahaya untuknya di antara dua Jumat.\" (HR. Al-Hakim). Hadits ini menunjukkan betapa besar keutamaan membaca Surah Al-Kahfi pada hari Jumat.</p><p>Keutamaan membaca Surah Al-Kahfi antara lain:</p><p><br></p><p>1. Mendapatkan Cahaya yang Terang: Membaca Surah Al-Kahfi pada hari Jumat akan memberikan cahaya yang terang bagi kita di antara dua Jumat. Cahaya ini akan menjadi petunjuk dan perlindungan bagi kita dalam menjalani kehidupan sehari-hari.</p><p>2. Terhindar dari Fitnah Dajjal: Rasulullah SAW bersabda, \"Barangsiapa yang menghafal sepuluh ayat pertama dari Surah Al-Kahfi, dia akan terlindung dari fitnah Dajjal.\" (HR. Muslim). Membaca dan menghafal Surah Al-Kahfi dapat menjadi sarana perlindungan dari fitnah Dajjal yang merupakan salah satu fitnah terbesar di akhir zaman.</p><p>3. Diberikan Ketenangan Hati: Membaca Surah Al-Kahfi dapat memberikan ketenangan hati dan pikiran. Surah ini mengandung kisah-kisah penuh hikmah yang dapat menjadi pelajaran bagi kita dalam menghadapi berbagai ujian dan cobaan dalam hidup.</p><p>Selain keutamaan spiritual, membaca Surah Al-Kahfi juga memiliki manfaat kesehatan rohani. Dengan membaca Surah Al-Kahfi, kita akan merasakan ketenangan jiwa dan kedamaian hati. Surah ini juga dapat membantu mengurangi stres dan kecemasan, serta meningkatkan keimanan dan ketakwaan kita kepada Allah SWT.</p><p>Berikut beberapa tips untuk membaca Surah Al-Kahfi:</p><p>1. Baca dengan Khusyuk: Bacalah Surah Al-Kahfi dengan khusyuk dan penuh penghayatan. Fokuskan pikiran dan hati kita kepada Allah SWT.</p><p>2. Fahami Maknanya: Usahakan untuk memahami makna dan tafsir dari ayat-ayat Surah Al-Kahfi. Hal ini dapat membantu kita lebih menghayati dan meresapi pesan-pesan yang terkandung di dalamnya.</p><p>3. Baca pada Waktu yang Tepat: Surah Al-Kahfi dianjurkan untuk dibaca pada malam Jumat atau hari Jumat, namun bisa juga dibaca pada hari-hari lainnya untuk mendapatkan keberkahan.</p><p>Mari kita jadikan membaca Surah Al-Kahfi sebagai amalan yang rutin dalam hidup kita. Dengan demikian, kita berharap mendapatkan keutamaan dan keberkahan dari Allah SWT, serta terlindung dari fitnah dunia dan akhirat. Aamiin.</p><p><br></p>', '17__Al_Kahfi.jpg', '', 1),
(56, 2, 'Fajar Hidayat', 'Pentingnya Beristighfar dalam Kehidupan Sehari-hari', 'Beristighfar memiliki banyak keutamaan dan manfaat bagi kehidupan kita sehari-hari.', 'Aktif', '2024-06-21 01:52:00', '<p>Beristighfar adalah salah satu amalan yang sangat dianjurkan dalam Islam. Istighfar adalah memohon ampunan kepada Allah SWT atas segala dosa dan kesalahan yang telah kita lakukan. Rasulullah SAW bersabda, \"Barangsiapa yang memperbanyak istighfar, maka Allah akan menjadikan untuknya jalan keluar dari setiap kesulitan dan memberi rezeki dari arah yang tidak disangka-sangka.\" (HR. Ahmad).</p><p><br></p><p>Keutamaan beristighfar antara lain:</p><p>1. **Menghapuskan Dosa**: Dengan beristighfar, kita memohon ampunan kepada Allah SWT atas segala dosa dan kesalahan kita. Allah SWT berfirman, \"Dan barangsiapa yang berbuat kejahatan atau menganiaya dirinya sendiri, kemudian ia memohon ampunan kepada Allah, niscaya ia mendapati Allah Maha Pengampun lagi Maha Penyayang.\" (QS. An-Nisa: 110).</p><p>2. **Mendatangkan Rezeki yang Berkah**: Beristighfar dapat mendatangkan rezeki yang berkah. Dalam Al-Quran, Allah SWT berfirman, \"Maka aku berkata (kepada mereka), \'Mohonlah ampun kepada Tuhanmu, sesungguhnya Dia adalah Maha Pengampun, niscaya Dia akan mengirimkan hujan kepadamu dengan lebat, dan membanyakkan harta dan anak-anakmu, dan mengadakan untukmu kebun-kebun dan mengadakan pula di dalamnya untukmu sungai-sungai.\'\" (QS. Nuh: 10-12).</p><p>3. **Menghilangkan Kesedihan dan Kesulitan**: Beristighfar dapat menjadi sarana untuk menghilangkan kesedihan dan kesulitan dalam hidup kita. Dengan beristighfar, kita berharap mendapatkan pertolongan dan rahmat dari Allah SWT.</p><p><br></p><p>Selain keutamaan spiritual, beristighfar juga memiliki manfaat kesehatan rohani. Dengan beristighfar, hati kita menjadi lebih tenang dan damai. Istighfar juga dapat membantu mengurangi stres dan kecemasan, serta meningkatkan kualitas hidup kita.</p><p>Berikut beberapa tips untuk beristighfar:</p><p>1. **Lakukan dengan Ikhlas**: Beristighfarlah dengan ikhlas dan penuh kesadaran. Fokuskan hati dan pikiran kita kepada Allah SWT saat beristighfar.</p><p>2. **Perbanyak Istighfar**: Usahakan untuk memperbanyak istighfar setiap hari. Jadikan istighfar sebagai amalan harian kita, baik setelah shalat maupun dalam berbagai kesempatan lainnya.</p><p>3. **Mohon Ampunan dengan Sungguh-sungguh**: Saat beristighfar, mohonlah ampunan kepada Allah SWT dengan sungguh-sungguh dan penuh penyesalan. Jangan hanya sekedar diucapkan, tetapi rasakan dalam hati kita.</p><p><br></p><p>Mari kita jadikan beristighfar sebagai amalan yang rutin dalam hidup kita. Dengan demikian, kita berharap mendapatkan keutamaan dan keberkahan dari Allah SWT, serta terhindar dari segala dosa dan kesalahan. Aamiin.</p><p><br></p>', 'istighfar-ilustrasi-_140213172301-355.jpg', '', 1),
(57, 1, 'Siti Nurhayati', 'Mengenal Keutamaan I\'tikaf di Bulan Ramadhan', 'I\'tikaf di bulan Ramadhan memiliki banyak keutamaan dan manfaat bagi umat Islam.', 'Aktif', '2024-06-20 21:57:00', '<p>I\'tikaf adalah salah satu ibadah yang sangat dianjurkan dalam Islam, terutama di bulan Ramadhan. I\'tikaf adalah berdiam diri di masjid dengan niat beribadah kepada Allah SWT, memperbanyak shalat, dzikir, membaca Al-Quran, dan amal ibadah lainnya. Rasulullah SAW sangat menganjurkan umatnya untuk melakukan i\'tikaf, terutama pada sepuluh hari terakhir di bulan Ramadhan.</p><p><br></p><p>Keutamaan i\'tikaf antara lain:</p><p><br></p><p>1. **Mendekatkan Diri kepada Allah**: I\'tikaf adalah sarana untuk mendekatkan diri kepada Allah SWT. Dengan berdiam diri di masjid dan fokus beribadah, kita dapat merasakan kedekatan dan kehadiran Allah dalam hidup kita.</p><p>2. **Menghidupkan Malam Lailatul Qadar**: I\'tikaf pada sepuluh hari terakhir di bulan Ramadhan bertujuan untuk menghidupkan malam Lailatul Qadar, malam yang lebih baik dari seribu bulan. Rasulullah SAW bersabda, \"Carilah malam Lailatul Qadar pada sepuluh malam terakhir dari bulan Ramadhan.\" (HR. Bukhari dan Muslim).</p><p>3. **Membersihkan Diri dari Dosa**: Dengan memperbanyak ibadah dan memohon ampunan kepada Allah selama i\'tikaf, kita berharap dapat membersihkan diri dari dosa-dosa yang telah kita lakukan.</p><p><br></p><p>Manfaat i\'tikaf juga sangat besar bagi kesehatan rohani. Dengan berdiam diri di masjid dan fokus beribadah, hati kita menjadi lebih tenang dan damai. I\'tikaf juga dapat membantu mengurangi stres dan kecemasan, serta meningkatkan kualitas hidup kita.</p><p><br></p><p>Berikut beberapa tips untuk melaksanakan i\'tikaf:</p><p><br></p><p>1. **Niat yang Ikhlas**: Lakukan i\'tikaf dengan niat yang ikhlas hanya karena Allah SWT. Jangan karena ingin dipuji atau dilihat oleh orang lain.</p><p>2. **Perbanyak Ibadah**: Selama i\'tikaf, perbanyaklah ibadah seperti shalat, dzikir, membaca Al-Quran, dan doa. Manfaatkan waktu sebaik-baiknya untuk mendekatkan diri kepada Allah.</p><p>3. **Jaga Kebersihan dan Ketertiban**: Selama berdiam di masjid, jaga kebersihan dan ketertiban. Jangan mengganggu jamaah lain yang sedang beribadah.</p><p>4. **Fokus pada Ibadah**: Hindari kegiatan yang tidak bermanfaat selama i\'tikaf, seperti berbicara tentang hal-hal duniawi atau menggunakan gadget untuk hal-hal yang tidak penting.</p><p><br></p><p>Mari kita manfaatkan kesempatan i\'tikaf di bulan Ramadhan untuk memperbanyak ibadah dan mendekatkan diri kepada Allah SWT. Semoga Allah menerima amal ibadah kita dan memberikan kita keberkahan serta ampunan. Aamiin.</p><p><br></p>', 'berdzikir_200819235753-198.jpg', '', 3),
(58, 7, 'Ahmad Ridwan', 'Menjaga Lisan dalam Kehidupan Sehari-hari', 'Menjaga lisan adalah salah satu bentuk ibadah yang sangat dianjurkan dalam Islam.', 'Aktif', '2024-06-21 02:01:00', '<p>Lisan adalah salah satu anggota tubuh yang sangat berpengaruh dalam kehidupan kita sehari-hari. Dengan lisan, kita bisa berbicara dan berkomunikasi dengan orang lain. Namun, lisan juga bisa menjadi sumber dosa jika tidak dijaga dengan baik. Rasulullah SAW bersabda, \"Barangsiapa yang beriman kepada Allah dan hari akhir, hendaklah ia berkata baik atau diam.\" (HR. Bukhari dan Muslim).</p><p><br></p><p>Menjaga lisan memiliki banyak keutamaan, antara lain:</p><p><br></p><p>1. **Menghindari Dosa**: Dengan menjaga lisan, kita dapat menghindari berbagai dosa yang disebabkan oleh ucapan yang tidak baik, seperti ghibah (menggunjing), namimah (mengadu domba), dan dusta. Allah SWT berfirman, \"Wahai orang-orang yang beriman, jauhilah kebanyakan prasangka (kecurigaan), karena sebagian dari prasangka itu dosa. Dan janganlah kamu mencari-cari kesalahan orang lain dan janganlah ada di antara kamu yang menggunjing sebagian yang lain.\" (QS. Al-Hujurat: 12).</p><p>2. **Mendapatkan Pahala**: Dengan berbicara yang baik dan menghindari ucapan yang tidak bermanfaat, kita dapat mendapatkan pahala yang besar. Rasulullah SAW bersabda, \"Barangsiapa yang dapat menjamin untukku (menjaga) apa yang ada di antara dua bibirnya (lisan) dan apa yang ada di antara dua kakinya (kemaluannya), maka aku menjamin untuknya surga.\" (HR. Bukhari).</p><p>3. **Menjaga Hubungan Sosial**: Menjaga lisan juga dapat membantu kita dalam menjaga hubungan sosial dengan orang lain. Dengan berbicara yang baik dan sopan, kita dapat menciptakan suasana yang harmonis dan damai dalam lingkungan kita.</p><p><br></p><p>Menjaga lisan juga memiliki manfaat kesehatan rohani. Dengan menjaga lisan, hati kita menjadi lebih tenang dan damai. Kita juga akan terhindar dari konflik dan pertengkaran yang disebabkan oleh ucapan yang tidak baik.</p><p><br></p><p>Berikut beberapa tips untuk menjaga lisan:</p><p><br></p><p>1. **Berpikir Sebelum Berbicara**: Sebelum mengucapkan sesuatu, pikirkan terlebih dahulu apakah ucapan tersebut bermanfaat atau tidak. Jika tidak, lebih baik diam.</p><p>2. **Hindari Berkata Kasar**: Hindari berkata kasar atau menyakiti perasaan orang lain. Berusahalah untuk selalu berbicara dengan sopan dan lembut.</p><p>3. **Perbanyak Dzikir dan Doa**: Perbanyaklah berdzikir dan berdoa kepada Allah agar diberikan kemampuan untuk menjaga lisan. Dengan berdzikir, kita akan lebih banyak mengingat Allah dan mengurangi ucapan yang tidak bermanfaat.</p><p>4. **Belajar Mengendalikan Emosi**: Belajarlah mengendalikan emosi agar tidak mudah marah atau terbawa perasaan. Dengan emosi yang terkendali, kita akan lebih mudah menjaga lisan.</p><p><br></p><p>Mari kita berusaha untuk selalu menjaga lisan dalam kehidupan sehari-hari. Dengan demikian, kita berharap dapat terhindar dari dosa dan mendapatkan pahala serta keberkahan dari Allah SWT. Aamiin.</p><p><br></p>', '7-doa-zikir-menjelang-berbuka-puasa-yang-bagus-untuk-diajarkan-ke-anak.jpeg', '', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_doa`
--

CREATE TABLE `tb_doa` (
  `id` int(7) NOT NULL,
  `nama_penulis` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL,
  `tanggal` datetime NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `urlvideo` varchar(255) NOT NULL,
  `id_kategori` int(7) NOT NULL,
  `count_hit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_doa`
--

INSERT INTO `tb_doa` (`id`, `nama_penulis`, `judul`, `deskripsi`, `status`, `tanggal`, `isi`, `gambar`, `urlvideo`, `id_kategori`, `count_hit`) VALUES
(9, 'Rina Sari', 'Keutamaan dan Manfaat Berdoa di Waktu Mustajab', 'Berdoa di waktu mustajab memiliki keutamaan dan manfaat yang sangat besar bagi umat Islam', 'Aktif', '2024-06-21 02:06:00', '<p>Doa adalah salah satu bentuk ibadah yang sangat dianjurkan dalam Islam. Allah SWT berfirman, \"Berdoalah kepada-Ku, niscaya akan Kuperkenankan bagimu.\" (QS. Ghafir: 60). Berdoa adalah sarana untuk mendekatkan diri kepada Allah dan memohon segala kebaikan dari-Nya. Ada waktu-waktu tertentu yang dikenal sebagai waktu mustajab, yaitu waktu-waktu yang doa lebih mudah dikabulkan oleh Allah SWT.</p><p><br></p><p>Beberapa waktu mustajab untuk berdoa antara lain:</p><p>1. **Sepertiga Malam Terakhir**: Sepertiga malam terakhir adalah waktu yang sangat dianjurkan untuk berdoa. Rasulullah SAW bersabda, \"Pada setiap malam, Rabb kita turun ke langit dunia ketika tersisa sepertiga malam terakhir. Allah berfirman, \'Barangsiapa yang berdoa kepada-Ku, niscaya akan Aku kabulkan, barangsiapa yang meminta kepada-Ku, niscaya akan Aku beri, dan barangsiapa yang meminta ampun kepada-Ku, niscaya akan Aku ampuni.\'\" (HR. Bukhari dan Muslim).</p><p>2. **Antara Adzan dan Iqamah**: Waktu antara adzan dan iqamah juga termasuk waktu mustajab untuk berdoa. Rasulullah SAW bersabda, \"Doa antara adzan dan iqamah tidak akan ditolak.\" (HR. Tirmidzi).</p><p>3. **Saat Berbuka Puasa**: Doa saat berbuka puasa juga termasuk waktu mustajab. Rasulullah SAW bersabda, \"Sesungguhnya bagi orang yang berpuasa, ketika waktu berbuka, ada doa yang tidak ditolak.\" (HR. Ibnu Majah).</p><p>4. **Hari Jumat**: Hari Jumat adalah hari yang sangat dianjurkan untuk berdoa. Rasulullah SAW bersabda, \"Pada hari Jumat ada waktu, yang jika seorang muslim berdoa ketika itu, pasti diberikan apa yang ia minta.\" (HR. Bukhari dan Muslim).</p><p><br></p><p>Berdoa di waktu mustajab memiliki banyak keutamaan dan manfaat. Dengan berdoa di waktu-waktu tersebut, kita berharap doa kita lebih mudah dikabulkan oleh Allah SWT. Selain itu, berdoa juga dapat memberikan ketenangan hati dan pikiran, serta mendekatkan diri kita kepada Allah.</p><p>Berikut beberapa tips untuk berdoa di waktu mustajab:</p><p>1. **Niat yang Ikhlas**: Berdoalah dengan niat yang ikhlas hanya karena Allah SWT. Jangan karena ingin dipuji atau dilihat oleh orang lain.</p><p>2. **Bersihkan Diri**: Sebelum berdoa, usahakan untuk membersihkan diri dengan berwudhu. Dengan tubuh yang bersih, kita akan lebih khusyuk dalam berdoa.</p><p>3. **Panjatkan Doa dengan Penuh Kesungguhan**: Berdoalah dengan penuh kesungguhan dan keyakinan bahwa Allah akan mengabulkan doa kita. Hindari berdoa dengan setengah hati atau ragu-ragu.</p><p>4. **Perbanyak Dzikir dan Shalawat**: Perbanyaklah berdzikir dan membaca shalawat kepada Nabi Muhammad SAW sebelum dan sesudah berdoa. Hal ini dapat membantu meningkatkan kualitas doa kita.</p><p><br></p><p>Mari kita manfaatkan waktu-waktu mustajab untuk berdoa dan memohon segala kebaikan dari Allah SWT. Semoga Allah mengabulkan doa-doa kita dan memberikan kita keberkahan serta rahmat-Nya. Aamiin.</p><p><br></p>', 'bacaan-istighfar-yang-benar-beserta-artinya-amalan-ringan-untuk-meminta-ampunan.jpg', '', 2, 2),
(10, 'Hadi', 'Keutamaan Bersabar dalam Menghadapi Ujian Hidup', 'Bersabar dalam menghadapi ujian hidup memiliki banyak keutamaan dan manfaat bagi umat Islam', 'Aktif', '2024-06-21 02:09:00', '<p>Bersabar adalah salah satu sifat yang sangat dianjurkan dalam Islam. Allah SWT berfirman, \"Sesungguhnya Allah beserta orang-orang yang sabar.\" (QS. Al-Baqarah: 153). Bersabar adalah kemampuan untuk tetap tenang dan tabah dalam menghadapi berbagai ujian dan cobaan hidup. Ujian dan cobaan adalah bagian dari kehidupan yang tidak bisa dihindari, namun dengan bersabar, kita dapat menghadapi semuanya dengan lebih baik.</p><p><br></p><p>Keutamaan bersabar antara lain:</p><p><br></p><p>1. **Mendapatkan Pertolongan Allah**: Allah SWT menjanjikan pertolongan-Nya kepada orang-orang yang bersabar. Dalam Al-Quran, Allah berfirman, \"Sesungguhnya Allah beserta orang-orang yang sabar.\" (QS. Al-Baqarah: 153). Dengan bersabar, kita berharap mendapatkan pertolongan dan rahmat dari Allah.</p><p>2. **Menghapuskan Dosa**: Bersabar dalam menghadapi ujian hidup dapat menjadi sarana untuk menghapuskan dosa-dosa kita. Rasulullah SAW bersabda, \"Tidaklah seorang muslim tertimpa suatu penyakit dan sejenisnya, melainkan Allah akan menggugurkan bersamanya dosa-dosanya, seperti pohon yang menggugurkan daun-daunnya.\" (HR. Bukhari dan Muslim).</p><p>3. **Menjadi Lebih Kuat dan Tangguh**: Bersabar dalam menghadapi ujian hidup dapat membuat kita menjadi lebih kuat dan tangguh. Dengan bersabar, kita belajar untuk menghadapi segala sesuatu dengan tenang dan bijaksana.</p><p><br></p><p>Bersabar juga memiliki manfaat kesehatan rohani. Dengan bersabar, hati kita menjadi lebih tenang dan damai. Kita juga akan terhindar dari stres dan kecemasan yang disebabkan oleh ujian hidup.</p><p><br></p><p>Berikut beberapa tips untuk bersabar dalam menghadapi ujian hidup:</p><p><br></p><p>1. **Percayalah kepada Allah**: Percayalah bahwa setiap ujian dan cobaan yang kita hadapi adalah bagian dari rencana Allah yang terbaik untuk kita. Allah tidak akan memberikan ujian di luar batas kemampuan kita.</p><p>2. **Berdoa dan Bertawakkal**: Berdoalah kepada Allah agar diberikan kesabaran dan kekuatan dalam menghadapi ujian hidup. Bertawakkal lah kepada Allah dan percayalah bahwa Dia akan memberikan jalan keluar yang terbaik.</p><p>3. **Perbanyak Dzikir dan Istighfar**: Perbanyaklah berdzikir dan beristighfar kepada Allah. Dengan berdzikir, hati kita akan menjadi lebih tenang dan kita akan lebih mudah bersabar.</p><p>4. **Jadikan Ujian sebagai Pelajaran**: Jadikan setiap ujian dan cobaan sebagai pelajaran untuk menjadi pribadi yang lebih baik. Belajarlah dari setiap pengalaman dan ambil hikmah dari setiap kejadian.</p><p><br></p><p>Mari kita berusaha untuk selalu bersabar dalam menghadapi ujian hidup. Dengan demikian, kita berharap dapat menghadapi segala ujian dengan lebih baik dan mendapatkan keberkahan serta rahmat dari Allah SWT. Aamiin.</p><p><br></p>', 's73gv8qe20vreqprvvpt.jpg', '', 5, 2),
(11, 'Arif Rahman', 'Keutamaan dan Manfaat Shalat Berjamaah', 'Shalat berjamaah memiliki banyak keutamaan dan manfaat bagi umat Islam', 'Aktif', '2024-06-21 02:18:00', '<p>Shalat berjamaah adalah salah satu ibadah yang sangat dianjurkan dalam Islam. Shalat berjamaah memiliki banyak keutamaan dan manfaat, baik dari segi spiritual maupun sosial. Rasulullah SAW bersabda, \"Shalat berjamaah lebih utama dibandingkan shalat sendirian sebanyak dua puluh tujuh derajat.\" (HR. Bukhari dan Muslim).</p><p><br></p><p>Keutamaan shalat berjamaah antara lain:</p><p><br></p><p>1. **Mendapatkan Pahala yang Lebih Besar**: Shalat berjamaah memiliki pahala yang lebih besar dibandingkan shalat sendirian. Dengan shalat berjamaah, kita mendapatkan pahala yang berlipat ganda dari Allah SWT.</p><p>2. **Menguatkan Ukhuwah Islamiyah**: Shalat berjamaah dapat memperkuat ukhuwah islamiyah (persaudaraan sesama muslim). Dengan shalat berjamaah, kita dapat bertemu dan berinteraksi dengan saudara-saudara seiman, sehingga hubungan persaudaraan kita semakin erat.</p><p>3. **Meningkatkan Kualitas Ibadah**: Shalat berjamaah dapat meningkatkan kualitas ibadah kita. Dengan shalat berjamaah, kita lebih fokus dan khusyuk dalam beribadah karena adanya imam yang memimpin shalat.</p><p><br></p><p>Selain keutamaan spiritual, shalat berjamaah juga memiliki manfaat sosial. Shalat berjamaah dapat menjadi sarana untuk mempererat hubungan sosial dengan lingkungan sekitar. Dengan shalat berjamaah, kita dapat saling mengenal dan membantu sesama jamaah.</p><p><br></p><p>Berikut beberapa tips untuk melaksanakan shalat berjamaah:</p><p><br></p><p>1. **Niat yang Ikhlas**: Laksanakan shalat berjamaah dengan niat yang ikhlas hanya karena Allah SWT. Jangan karena ingin dipuji atau dilihat oleh orang lain.</p><p>2. **Datang Lebih Awal**: Usahakan untuk datang lebih awal ke masjid agar dapat melaksanakan shalat sunnah dan mempersiapkan diri dengan baik sebelum shalat berjamaah dimulai.</p><p>3. **Ikuti Imam dengan Khusyuk**: Ikuti imam dengan khusyuk dan penuh penghayatan. Fokuskan pikiran dan hati kita kepada Allah SWT selama shalat berjamaah.</p><p>4. **Jaga Kebersihan dan Ketertiban**: Jaga kebersihan dan ketertiban selama di masjid. Hindari berbicara atau melakukan hal-hal yang dapat mengganggu jamaah lain yang sedang beribadah.</p><p><br></p><p>Mari kita rutin melaksanakan shalat berjamaah dalam kehidupan sehari-hari. Dengan demikian, kita berharap dapat meraih keutamaan dan manfaat dari shalat berjamaah, serta mendapatkan keberkahan dan rahmat dari Allah SWT. Aamiin.</p><p><br></p>', 'Ilustrasi-shalat-berjamaah.jpeg', '', 1, 1),
(12, 'Dewi Lestari', 'Pentingnya Menjaga Amanah dalam Islam', 'Menjaga amanah adalah salah satu sifat yang sangat dianjurkan dalam Islam.', 'Aktif', '2024-06-21 02:22:00', '<p>Amanah adalah salah satu sifat yang sangat dianjurkan dalam Islam. Amanah berarti menjaga dan menunaikan tanggung jawab yang telah dipercayakan kepada kita. Allah SWT berfirman, \"Sesungguhnya Allah menyuruh kamu menyampaikan amanat kepada yang berhak menerimanya...\" (QS. An-Nisa: 58). Menjaga amanah adalah salah satu bentuk keimanan dan ketaatan kita kepada Allah.</p><p><br></p><p>Keutamaan menjaga amanah antara lain:</p><p><br></p><p>1. **Mendapatkan Kepercayaan dari Allah dan Manusia**: Dengan menjaga amanah, kita mendapatkan kepercayaan dari Allah dan manusia. Allah akan memberikan kita rahmat dan keberkahan, serta manusia akan mempercayai kita dalam berbagai urusan.</p><p>2. **Menghindari Pengkhianatan**: Menjaga amanah dapat menghindarkan kita dari sifat pengkhianatan yang sangat dibenci oleh Allah. Rasulullah SAW bersabda, \"Tidak ada iman bagi orang yang tidak amanah.\" (HR. Ahmad).</p><p>3. **Menjadi Pribadi yang Bertanggung Jawab**: Menjaga amanah dapat menjadikan kita pribadi yang bertanggung jawab dan dapat diandalkan. Hal ini sangat penting dalam kehidupan sehari-hari, baik dalam urusan pribadi, keluarga, maupun pekerjaan.</p><p><br></p><p>Manfaat menjaga amanah juga sangat besar bagi kesehatan rohani. Dengan menjaga amanah, hati kita menjadi lebih tenang dan damai. Kita juga akan terhindar dari konflik dan masalah yang disebabkan oleh pengkhianatan amanah.</p><p><br></p><p>Berikut beberapa tips untuk menjaga amanah:</p><p><br></p><p>1. **Niat yang Ikhlas**: Jaga amanah dengan niat yang ikhlas hanya karena Allah SWT. Jangan karena ingin dipuji atau dilihat oleh orang lain.</p><p>2. **Tunaikan Amanah dengan Baik**: Tunaikan amanah yang dipercayakan kepada kita dengan baik dan penuh tanggung jawab. Jangan menunda-nunda atau mengabaikan amanah tersebut.</p><p>3. **Jaga Kepercayaan**: Jaga kepercayaan yang diberikan kepada kita dengan sebaik-baiknya. Jangan sekali-kali mengkhianati kepercayaan tersebut.</p><p>4. **Mohon Pertolongan Allah**: Mohonlah pertolongan kepada Allah agar diberikan kemampuan untuk menjaga amanah dengan baik. Dengan pertolongan Allah, kita akan lebih mudah dalam menjaga amanah.</p><p><br></p><p>Mari kita berusaha untuk selalu menjaga amanah dalam kehidupan sehari-hari. Dengan demikian, kita berharap dapat menjadi pribadi yang bertanggung jawab dan mendapatkan keberkahan serta rahmat dari Allah SWT. Aamiin.</p><p><br></p>', 'Hukum-Jabat-Tangan-Dengan-Lawan-Jenis-Dalam-Islam-bimbingan-islam-e1588220326665.jpg', '', 5, 1),
(13, 'Nadia Safitri', 'Keutamaan dan Manfaat Menghafal Al-Quran', 'Menghafal Al-Quran memiliki banyak keutamaan dan manfaat bagi umat Islam.', 'Aktif', '2024-06-21 02:23:00', '<p>Menghafal Al-Quran adalah salah satu ibadah yang sangat dianjurkan dalam Islam. Al-Quran adalah kitab suci yang menjadi pedoman hidup bagi umat Islam. Menghafal Al-Quran memiliki banyak keutamaan dan manfaat, baik dari segi spiritual maupun intelektual.</p><p><br></p><p>Keutamaan menghafal Al-Quran antara lain:</p><p><br></p><p>1. **Mendapatkan Pahala yang Besar**: Menghafal Al-Quran adalah ibadah yang sangat mulia. Rasulullah SAW bersabda, \"Sebaik-baik kalian adalah orang yang belajar Al-Quran dan mengajarkannya.\" (HR. Bukhari). Dengan menghafal Al-Quran, kita mendapatkan pahala yang besar dari Allah SWT.</p><p>2. **Menjadi Ahli Al-Quran**: Menghafal Al-Quran dapat menjadikan kita ahli Al-Quran, yang memiliki kedudukan tinggi di sisi Allah dan manusia. Rasulullah SAW bersabda, \"Orang yang ahli dalam Al-Quran akan bersama para malaikat yang mulia dan taat.\" (HR. Bukhari dan Muslim).</p><p>3. **Mendapatkan Syafaat di Hari Kiamat**: Menghafal Al-Quran dapat menjadi salah satu cara untuk mendapatkan syafaat di hari kiamat. Rasulullah SAW bersabda, \"Bacalah Al-Quran, karena ia akan datang pada hari kiamat sebagai syafaat bagi pembacanya.\" (HR. Muslim).</p><p><br></p><p>Menghafal Al-Quran juga memiliki manfaat intelektual yang sangat besar. Dengan menghafal Al-Quran, kita dapat meningkatkan daya ingat dan konsentrasi. Proses menghafal yang melibatkan berpikir dan mengulang-ulang ayat-ayat Al-Quran dapat membantu meningkatkan fungsi kognitif otak kita.</p><p><br></p><p>Berikut beberapa tips untuk menghafal Al-Quran:</p><p><br></p><p>1. **Niat yang Ikhlas**: Menghafal Al-Quran dengan niat yang ikhlas hanya karena Allah SWT. Jangan karena ingin dipuji atau dilihat oleh orang lain.</p><p>2. **Lakukan Secara Bertahap**: Menghafal Al-Quran dilakukan secara bertahap, sedikit demi sedikit, namun istiqamah. Mulailah dengan menghafal ayat-ayat yang pendek dan mudah diingat.</p><p>3. **Perbanyak Mengulang**: Perbanyak mengulang-ulang hafalan agar hafalan tersebut lebih kuat dan melekat dalam ingatan. Luangkan waktu setiap hari untuk mengulang hafalan yang sudah dihafal.</p><p>4. **Gunakan Metode yang Tepat**: Gunakan metode yang tepat untuk menghafal Al-Quran, seperti metode talaqqi (menghafal dengan bimbingan guru) atau metode muraja\'ah (mengulang hafalan secara berkala).</p><p><br></p><p>Mari kita berusaha untuk menghafal Al-Quran dalam kehidupan sehari-hari. Dengan demikian, kita berharap dapat meraih keutamaan dan manfaat dari menghafal Al-Quran, serta mendapatkan keberkahan dan rahmat dari Allah SWT. Aamiin.</p><p><br></p>', 'Al-Quran-20231227090000.jpg', '', 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hit`
--

CREATE TABLE `tb_hit` (
  `id_hit` int(11) NOT NULL,
  `id_related` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `kategori` enum('artikel','doa','video') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_hit`
--

INSERT INTO `tb_hit` (`id_hit`, `id_related`, `tanggal`, `kategori`) VALUES
(2617, 52, '2024-06-11 14:47:04', 'artikel'),
(2618, 52, '2024-06-11 14:48:51', 'artikel'),
(2619, 52, '2024-06-11 14:48:52', 'artikel'),
(2620, 52, '2024-06-11 14:48:52', 'artikel'),
(2621, 52, '2024-06-11 14:48:52', 'artikel'),
(2622, 21, '2024-06-11 14:54:32', 'video'),
(2623, 21, '2024-06-11 14:54:55', 'video'),
(2624, 52, '2024-06-11 14:55:04', 'artikel'),
(2625, 52, '2024-06-11 14:55:09', 'artikel'),
(2626, 52, '2024-06-11 14:55:15', 'artikel'),
(2627, 21, '2024-06-11 14:55:18', 'video'),
(2628, 21, '2024-06-11 14:56:26', 'video'),
(2629, 21, '2024-06-11 14:56:27', 'video'),
(2630, 21, '2024-06-11 14:56:57', 'video'),
(2631, 21, '2024-06-11 14:58:20', 'video'),
(2632, 21, '2024-06-11 14:58:22', 'video'),
(2633, 21, '2024-06-11 14:58:22', 'video'),
(2634, 21, '2024-06-11 14:58:23', 'video'),
(2635, 52, '2024-06-11 15:16:10', 'artikel'),
(2636, 21, '2024-06-11 15:16:51', 'video'),
(2637, 21, '2024-06-11 15:21:35', 'video'),
(2638, 21, '2024-06-14 16:02:49', 'video'),
(2639, 21, '2024-06-19 17:12:53', 'video'),
(2640, 21, '2024-06-19 17:13:11', 'video'),
(2641, 21, '2024-06-19 17:13:12', 'video'),
(2642, 21, '2024-06-19 17:13:12', 'video'),
(2643, 21, '2024-06-19 17:13:12', 'video'),
(2644, 21, '2024-06-19 17:13:16', 'video'),
(2645, 52, '2024-06-19 17:32:59', 'artikel'),
(2646, 21, '2024-06-19 17:33:33', 'video'),
(2647, 21, '2024-06-19 17:33:34', 'video'),
(2648, 21, '2024-06-19 17:33:36', 'video'),
(2649, 21, '2024-06-19 17:33:38', 'video'),
(2650, 21, '2024-06-19 17:33:41', 'video'),
(2651, 21, '2024-06-19 17:33:44', 'video'),
(2652, 21, '2024-06-19 17:33:46', 'video'),
(2653, 21, '2024-06-19 17:33:50', 'video'),
(2654, 21, '2024-06-19 17:33:54', 'video'),
(2655, 21, '2024-06-19 17:33:57', 'video'),
(2656, 21, '2024-06-19 17:33:59', 'video'),
(2657, 52, '2024-06-21 00:46:39', 'artikel'),
(2658, 21, '2024-06-21 00:46:41', 'video'),
(2659, 53, '2024-06-21 00:55:17', 'artikel'),
(2660, 53, '2024-06-21 00:55:36', 'artikel'),
(2661, 52, '2024-06-21 00:56:09', 'artikel'),
(2662, 53, '2024-06-21 00:56:12', 'artikel'),
(2663, 52, '2024-06-21 00:56:16', 'artikel'),
(2664, 21, '2024-06-21 00:56:19', 'video'),
(2665, 21, '2024-06-21 00:56:24', 'video'),
(2666, 21, '2024-06-21 00:56:51', 'video'),
(2667, 21, '2024-06-21 00:56:59', 'video'),
(2668, 21, '2024-06-21 01:00:00', 'video'),
(2669, 21, '2024-06-21 01:01:13', 'video'),
(2670, 22, '2024-06-21 01:11:34', 'video'),
(2671, 53, '2024-06-21 01:15:03', 'artikel'),
(2672, 52, '2024-06-21 01:15:16', 'artikel'),
(2673, 21, '2024-06-21 01:18:03', 'video'),
(2674, 23, '2024-06-21 01:18:10', 'video'),
(2675, 24, '2024-06-21 01:23:07', 'video'),
(2676, 24, '2024-06-21 01:23:09', 'video'),
(2677, 21, '2024-06-21 01:24:07', 'video'),
(2678, 24, '2024-06-21 01:24:10', 'video'),
(2679, 24, '2024-06-21 01:24:12', 'video'),
(2680, 24, '2024-06-21 01:25:32', 'video'),
(2681, 52, '2024-06-21 01:29:19', 'artikel'),
(2682, 52, '2024-06-21 01:29:20', 'artikel'),
(2683, 52, '2024-06-21 01:29:20', 'artikel'),
(2684, 52, '2024-06-21 01:29:20', 'artikel'),
(2685, 52, '2024-06-21 01:29:20', 'artikel'),
(2686, 24, '2024-06-21 01:29:22', 'video'),
(2687, 24, '2024-06-21 01:29:23', 'video'),
(2688, 24, '2024-06-21 01:29:23', 'video'),
(2689, 24, '2024-06-21 01:29:23', 'video'),
(2690, 24, '2024-06-21 01:29:23', 'video'),
(2691, 24, '2024-06-21 01:29:23', 'video'),
(2692, 24, '2024-06-21 01:29:23', 'video'),
(2693, 24, '2024-06-21 01:29:24', 'video'),
(2694, 24, '2024-06-21 01:29:24', 'video'),
(2695, 24, '2024-06-21 01:29:24', 'video'),
(2696, 24, '2024-06-21 01:29:24', 'video'),
(2697, 21, '2024-06-21 01:29:38', 'video'),
(2698, 21, '2024-06-21 01:29:39', 'video'),
(2699, 21, '2024-06-21 01:29:40', 'video'),
(2700, 21, '2024-06-21 01:29:40', 'video'),
(2701, 21, '2024-06-21 01:29:40', 'video'),
(2702, 21, '2024-06-21 01:29:40', 'video'),
(2703, 21, '2024-06-21 01:29:40', 'video'),
(2704, 21, '2024-06-21 01:29:40', 'video'),
(2705, 21, '2024-06-21 01:29:41', 'video'),
(2706, 21, '2024-06-21 01:29:41', 'video'),
(2707, 21, '2024-06-21 01:29:41', 'video'),
(2708, 52, '2024-06-21 01:29:43', 'artikel'),
(2709, 25, '2024-06-21 01:29:49', 'video'),
(2710, 26, '2024-06-21 01:33:00', 'video'),
(2711, 21, '2024-06-21 01:34:41', 'video'),
(2712, 54, '2024-06-21 01:47:21', 'artikel'),
(2713, 54, '2024-06-21 01:47:38', 'artikel'),
(2714, 23, '2024-06-21 01:47:59', 'video'),
(2715, 54, '2024-06-21 01:48:59', 'artikel'),
(2716, 55, '2024-06-21 01:55:26', 'artikel'),
(2717, 53, '2024-06-21 01:55:30', 'artikel'),
(2718, 56, '2024-06-21 01:55:46', 'artikel'),
(2719, 57, '2024-06-21 01:59:31', 'artikel'),
(2720, 57, '2024-06-21 01:59:44', 'artikel'),
(2721, 57, '2024-06-21 02:00:50', 'artikel'),
(2722, 27, '2024-06-21 02:03:17', 'video'),
(2723, 21, '2024-06-21 02:16:49', 'video'),
(2724, 10, '2024-06-21 02:17:02', 'doa'),
(2725, 58, '2024-06-21 02:17:06', 'artikel'),
(2726, 12, '2024-06-21 02:24:06', 'doa'),
(2727, 10, '2024-06-21 02:24:08', 'doa'),
(2728, 11, '2024-06-21 02:24:09', 'doa'),
(2729, 9, '2024-06-21 02:24:11', 'doa'),
(2730, 9, '2024-06-21 02:24:46', 'doa'),
(2731, 13, '2024-06-21 02:24:50', 'doa'),
(2732, 21, '2024-06-21 07:59:54', 'video'),
(2733, 58, '2024-06-21 08:00:34', 'artikel'),
(2734, 26, '2024-06-21 08:00:38', 'video'),
(2735, 54, '2024-06-21 08:00:42', 'artikel'),
(2736, 27, '2024-06-21 08:09:33', 'video'),
(2737, 21, '2024-06-21 08:09:43', 'video'),
(2738, 58, '2024-06-21 08:11:48', 'artikel'),
(2739, 27, '2024-06-21 08:11:58', 'video');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(7) NOT NULL,
  `nama` varchar(55) NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama`, `status`) VALUES
(1, 'Amalan', 'Aktif'),
(2, 'Sunnah', 'Aktif'),
(5, 'Harian', 'Aktif'),
(6, 'Al-Quran', 'Aktif'),
(7, 'Akhlak', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_video`
--

CREATE TABLE `tb_video` (
  `id` int(7) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `status` enum('Aktif','Nonaktif') NOT NULL,
  `isi` text NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `urlvideo` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `id_kategori` int(7) DEFAULT NULL,
  `count_hit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_video`
--

INSERT INTO `tb_video` (`id`, `judul`, `status`, `isi`, `deskripsi`, `tanggal`, `urlvideo`, `gambar`, `id_kategori`, `count_hit`) VALUES
(21, 'Hikmah Puasa di Bulan Ramadan', 'Aktif', '<p>Bulan Ramadan adalah bulan yang penuh berkah dan ampunan. Puasa di bulan Ramadan memiliki banyak hikmah, baik dari segi spiritual maupun kesehatan. Secara spiritual, puasa mengajarkan kita untuk lebih mendekatkan diri kepada Allah SWT, meningkatkan ketakwaan, dan menahan diri dari segala yang tidak baik.</p><p><br></p><p>Secara kesehatan, puasa membantu tubuh untuk melakukan detoksifikasi, mengurangi kadar lemak, dan meningkatkan sistem pencernaan. Dengan berpuasa, kita juga belajar untuk lebih bersabar dan lebih menghargai nikmat yang telah Allah berikan.</p><p><br></p>', 'Puasa di bulan Ramadan memiliki banyak hikmah dan manfaat. Artikel ini membahas beberapa di antaranya.', '2024-06-11 14:50:00', 'https://www.youtube.com/watch?v=S_RobSXCd7I', '24714-ilustrasi-sholat-pexels.jpg', 1, 48),
(22, 'Pentingnya Mencari Ilmu dalam Islam', 'Aktif', '<p>Islam sangat menganjurkan umatnya untuk menuntut ilmu. Rasulullah SAW bersabda, \"Menuntut ilmu itu wajib atas setiap Muslim.\" (HR. Ibnu Majah). Ilmu adalah cahaya yang menerangi jalan kita dalam kehidupan. Dengan ilmu, kita dapat membedakan antara yang baik dan yang buruk, yang benar dan yang salah.</p><p><br></p><p>Mencari ilmu tidak hanya terbatas pada ilmu agama, tetapi juga ilmu pengetahuan yang bermanfaat bagi kehidupan dunia dan akhirat. Oleh karena itu, mari kita jadikan menuntut ilmu sebagai bagian dari hidup kita.</p><p><br></p>', 'Mencari ilmu adalah kewajiban setiap muslim. Artikel ini membahas pentingnya menuntut ilmu dalam Islam.', '2024-06-21 01:09:00', 'https://www.youtube.com/watch?v=dRYmvSEl3es&pp=ygUcaWxtdSBtZW5jYXJpIGlzbGFtIGl0dSBpbmRhaA%3D%3D', 'urutan-cabang-ilmu-dari-yang-paling-pokok-dalam-belajar-islam-cqs.jpg', 5, 1),
(23, 'Keutamaan Membaca Al-Quran', 'Aktif', '<p>Membaca Al-Quran memiliki banyak keutamaan. Artikel ini membahas beberapa keutamaan membaca Al-Quran</p>', 'Membaca Al-Quran memiliki banyak keutamaan. Artikel ini membahas beberapa keutamaan membaca Al-Quran.', '2024-06-21 01:12:00', 'https://www.youtube.com/watch?v=D9VkB1L-V54&pp=ygUjbWVuZ2FtYWxrYW4gYWxxdXJhbiBpc2xhbSBpdHUgaW5kYWg%3D', 'B110846-Cover-ayat-alquran-tentang-menuntut-ilmu.jpg', 1, 2),
(24, 'Manfaat Membaca Al-Quran Setiap Hari', 'Aktif', '<p>Membaca Al-Quran setiap hari adalah salah satu amalan yang sangat dianjurkan dalam Islam. Al-Quran adalah kitab suci yang menjadi pedoman hidup bagi umat Islam. Selain mendapatkan pahala yang besar, membaca Al-Quran setiap hari memiliki banyak manfaat baik untuk kesehatan rohani maupun jasmani.</p><p>Secara rohani, membaca Al-Quran dapat memberikan ketenangan hati dan pikiran. Allah SWT berfirman dalam Al-Quran, \"Ingatlah, hanya dengan mengingat Allah hati menjadi tenteram.\" (QS. Ar-Ra\'d: 28). Membaca Al-Quran juga dapat meningkatkan keimanan dan ketakwaan kita kepada Allah SWT. Dengan rutin membaca Al-Quran, kita akan selalu merasa dekat dengan Allah dan mendapatkan petunjuk dalam setiap langkah kehidupan kita.</p><p>Dari segi kesehatan jasmani, membaca Al-Quran dapat memberikan efek positif bagi tubuh kita. Menurut beberapa penelitian, membaca Al-Quran dapat membantu menurunkan tekanan darah, mengurangi stres, dan meningkatkan kualitas tidur. Suara lantunan ayat-ayat suci Al-Quran juga dapat memberikan efek menenangkan yang dapat dirasakan oleh siapa saja yang mendengarnya.</p><p>Selain itu, membaca Al-Quran juga dapat meningkatkan kemampuan kognitif dan memori kita. Membaca, menghafal, dan memahami ayat-ayat Al-Quran melibatkan proses berpikir yang intensif, yang dapat membantu menjaga otak kita tetap aktif dan sehat. Membaca Al-Quran juga dapat meningkatkan konsentrasi dan daya ingat kita, yang sangat bermanfaat dalam kehidupan sehari-hari.</p><p>Maka dari itu, mari kita jadikan membaca Al-Quran sebagai rutinitas harian kita. Tidak perlu banyak, cukup beberapa ayat setiap hari, namun dilakukan dengan istiqamah. Dengan demikian, kita akan merasakan manfaatnya dalam kehidupan kita, baik di dunia maupun di akhirat. Aamiin</p><p><br></p>', 'Membaca Al-Quran setiap hari memiliki banyak manfaat untuk kesehatan rohani dan jasmani.', '2024-06-21 01:21:00', 'https://www.youtube.com/watch?v=D9VkB1L-V54&pp=ygUjbWVuZ2FtYWxrYW4gYWxxdXJhbiBpc2xhbSBpdHUgaW5kYWg%3D', 'ciriciri-orang-yang-mendapatkan-keberkahan-ilmu-feq.jpg', 6, 16),
(25, 'Keutamaan Shalat Tahajud dan Cara Melaksanakannya', 'Aktif', '<p><strong>Shalat Tahajud</strong> adalah salah satu shalat sunnah yang sangat dianjurkan dalam Islam. Shalat ini dilakukan pada waktu sepertiga malam terakhir, setelah tidur. Rasulullah SAW bersabda, \"Shalat yang paling utama setelah shalat fardhu adalah shalat malam.\" (HR. Muslim).</p><p>Keutamaan shalat Tahajud sangatlah besar. Allah SWT berfirman dalam Al-Quran, \"Dan pada sebagian malam hari shalat tahajudlah kamu sebagai suatu ibadah tambahan bagimu; mudah-mudahan Tuhanmu mengangkat kamu ke tempat yang terpuji.\" (QS. Al-Isra\': 79). Dengan melaksanakan shalat Tahajud, kita berharap mendapatkan kedudukan yang tinggi di sisi Allah dan mendapatkan ridha-Nya.</p><blockquote>Shalat Tahajud juga memiliki banyak manfaat bagi kesehatan rohani dan jasmani. Secara rohani, shalat Tahajud dapat mendekatkan diri kita kepada Allah, meningkatkan keimanan dan ketakwaan, serta memberikan ketenangan jiwa. Shalat Tahajud juga dapat menjadi sarana untuk memohon ampunan dan rahmat Allah, serta memperbanyak doa dan dzikir.</blockquote><p>Dari segi kesehatan jasmani, shalat Tahajud dapat membantu menjaga kesehatan tubuh. Gerakan shalat yang dilakukan pada waktu malam dapat melancarkan peredaran darah, meningkatkan fleksibilitas tubuh, dan memberikan efek relaksasi. Selain itu, bangun pada waktu sepertiga malam terakhir dan melakukan aktivitas fisik dapat membantu mengatur pola tidur dan meningkatkan kualitas tidur.</p><p>Untuk melaksanakan shalat Tahajud, berikut adalah cara-caranya:</p><ol><li>1. Niat dalam hati untuk melaksanakan shalat Tahajud.</li><li>2. Bangun pada waktu sepertiga malam terakhir, setelah tidur.</li><li>3. Melakukan wudhu dengan sempurna.</li><li>4. Melaksanakan shalat Tahajud minimal dua rakaat, dan bisa dilanjutkan dengan rakaat tambahan sesuai kemampuan.</li><li>5. Setelah shalat Tahajud, disunnahkan untuk memperbanyak doa dan dzikir.</li></ol><p>Dengan melaksanakan shalat Tahajud secara rutin, kita berharap mendapatkan keutamaan dan keberkahan dari Allah SWT. Semoga kita termasuk hamba-hamba yang istiqamah dalam melaksanakan ibadah ini. Aamiin.</p><p><br></p>', 'Shalat Tahajud adalah shalat sunnah yang memiliki banyak keutamaan. Artikel ini membahas cara melaksanakannya.', '2024-06-21 01:26:00', 'https://www.youtube.com/watch?v=gK30KrZoBng&pp=ygUXdGFoYWp1ZCBpc2xhbSBpdHUgaW5kYWg%3D', '1701577205.jpg', 1, 1),
(26, 'Keutamaan Membaca Shalawat Nabi', 'Aktif', '<p>Membaca shalawat Nabi adalah salah satu amalan yang sangat dianjurkan dalam Islam. Shalawat adalah bentuk penghormatan dan doa kepada Nabi Muhammad SAW. Allah SWT berfirman dalam Al-Quran, \"Sesungguhnya Allah dan malaikat-malaikat-Nya bershalawat untuk Nabi. Hai orang-orang yang beriman, bershalawatlah kamu untuk Nabi dan ucapkanlah salam penghormatan kepadanya.\" (QS. Al-Ahzab: 56).</p><p>Membaca shalawat Nabi memiliki banyak keutamaan dan manfaat. Salah satu keutamaannya adalah mendapatkan syafaat Nabi Muhammad SAW di hari kiamat. Rasulullah SAW bersabda, \"Barangsiapa yang bershalawat kepadaku satu kali, maka Allah akan bershalawat kepadanya sepuluh kali.\" (HR. Muslim).</p><p>Selain itu, membaca shalawat juga dapat mendatangkan keberkahan dalam hidup kita. Dengan memperbanyak membaca shalawat, kita berharap mendapatkan ridha dan rahmat Allah SWT, serta mendapatkan rezeki yang berkah. Shalawat juga dapat menjadi sarana untuk menghilangkan kesusahan dan kesedihan dalam hidup kita.</p><p>Membaca shalawat juga memiliki manfaat bagi kesehatan rohani kita. Dengan membaca shalawat, hati kita menjadi lebih tenang dan damai. Shalawat juga dapat meningkatkan cinta dan penghormatan kita kepada Nabi Muhammad SAW, serta memperkuat ikatan kita dengan beliau.</p><p>Ada banyak jenis shalawat yang bisa kita baca, seperti Shalawat Ibrahimiyah, Shalawat Nariyah, Shalawat Munjiyat, dan lain-lain. Semua shalawat ini memiliki keutamaan yang besar dan bisa kita baca sesuai dengan kesempatan dan kebutuhan kita.</p><p>Mari kita jadikan membaca shalawat sebagai amalan harian kita. Dengan memperbanyak membaca shalawat, kita berharap mendapatkan keutamaan dan keberkahan dari Allah SWT, serta mendapatkan syafaat dari Nabi Muhammad SAW di hari kiamat. Aamiin.</p><p><br></p>', 'Membaca shalawat Nabi memiliki banyak keutamaan dan manfaat. Artikel ini membahas beberapa di antaranya.', '2024-06-21 01:30:00', 'https://www.youtube.com/watch?v=3p82Tk-uZRY&pp=ygUdc2hhbGF3YXQgbmFiaSBpc2xhbSBpdHUgaW5kYWg%3D', 'l-img10e78038471be5cfc890cd6bdf746516ee20230913102643-bimacms.jpg', 2, 2),
(27, 'Keutamaan Berbakti kepada Orang Tua', 'Aktif', '<p>Berbakti kepada orang tua adalah salah satu kewajiban yang sangat ditekankan dalam Islam. Allah SWT berfirman dalam Al-Quran, \"Dan Kami perintahkan kepada manusia (berbuat baik) kepada kedua orang tua...\" (QS. Al-Ahqaf: 15). Berbakti kepada orang tua adalah bentuk rasa syukur kita atas segala jasa dan pengorbanan mereka dalam membesarkan dan mendidik kita.</p><p>Rasulullah SAW bersabda, \"Keridhaan Allah tergantung pada keridhaan orang tua dan kemurkaan Allah tergantung pada kemurkaan orang tua.\" (HR. Tirmidzi). Hadis ini menunjukkan betapa pentingnya berbakti kepada orang tua. Dengan berbakti kepada orang tua, kita berharap mendapatkan ridha Allah dan keberkahan dalam hidup kita.</p><p>Berbakti kepada orang tua juga memiliki banyak manfaat, baik dari segi rohani maupun jasmani. Secara rohani, berbakti kepada orang tua dapat meningkatkan ketakwaan dan keimanan kita kepada Allah SWT. Berbakti kepada orang tua juga dapat menjadi sarana untuk mendapatkan pahala yang besar di sisi Allah.</p><p>Dari segi jasmani, berbakti kepada orang tua dapat memberikan kebahagiaan dan ketenangan hati. Ketika kita berbakti kepada orang tua, kita akan merasa lebih bahagia dan puas dengan hidup kita. Berbakti kepada orang tua juga dapat mendatangkan rezeki yang berkah dan meningkatkan kualitas hidup kita.</p><p>Ada banyak cara untuk berbakti kepada orang tua, seperti menghormati dan menghargai mereka, membantu mereka dalam pekerjaan sehari-hari, memberikan nafkah, serta mendoakan mereka. Kita juga harus selalu berusaha untuk membuat mereka bahagia dan tidak membuat mereka merasa sedih atau kecewa.</p><p>Mari kita jadikan berbakti kepada orang tua sebagai prioritas utama dalam hidup kita. Dengan demikian, kita akan mendapatkan kebahagiaan dan keberkahan hidup, serta mendapatkan ridha Allah SWT. Aamiin.</p><p><br></p>', 'Berbakti kepada orang tua adalah kewajiban setiap muslim. Artikel ini membahas pentingnya berbakti kepada orang tua.', '2024-06-21 01:35:00', 'https://www.youtube.com/watch?v=DpiNrkC13UE&pp=ygUqaXNsYW0gaXR1IGluZGFoIGJlcmJha3RpIGtlcGFkYSBvcmFuZyB0dWEg', 'hipwee-adobestock-83006463-1024x683-1024x630-6381d9cf34b89873782d4e22.jpeg', 5, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_visitors`
--

CREATE TABLE `tb_visitors` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `visit_time` datetime NOT NULL,
  `page_visited` varchar(255) NOT NULL,
  `user_agent` text NOT NULL,
  `unique_user_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_visitors`
--

INSERT INTO `tb_visitors` (`id`, `ip_address`, `visit_time`, `page_visited`, `user_agent`, `unique_user_id`) VALUES
(559, '::1', '2024-06-11 14:18:48', 'List Video', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'user_6666d2df80bb18.53971436'),
(560, '::1', '2024-06-11 14:19:22', 'List Video', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'user_6666d2df80bb18.53971436'),
(561, '::1', '2024-06-11 14:19:22', 'List Video', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'user_6666d2df80bb18.53971436'),
(562, '::1', '2024-06-11 14:19:48', 'List Video', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'user_6666d2df80bb18.53971436'),
(563, '::1', '2024-06-11 14:20:09', 'List Video', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'user_6666d2df80bb18.53971436'),
(564, '::1', '2024-06-11 14:20:28', 'Beranda', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 'user_6666d2df80bb18.53971436'),
(565, '::1', '2024-06-11 14:20:38', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(566, '::1', '2024-06-11 14:20:42', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(567, '::1', '2024-06-11 14:20:50', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(568, '::1', '2024-06-11 14:20:57', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(569, '::1', '2024-06-11 14:21:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(570, '::1', '2024-06-11 14:21:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(571, '::1', '2024-06-11 14:21:35', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(572, '::1', '2024-06-11 14:21:38', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(573, '::1', '2024-06-11 14:21:41', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(574, '::1', '2024-06-11 14:21:43', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(575, '::1', '2024-06-11 14:21:44', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(576, '::1', '2024-06-11 14:21:45', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(577, '::1', '2024-06-11 14:21:51', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(578, '::1', '2024-06-11 14:24:24', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(579, '::1', '2024-06-11 14:24:34', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(580, '::1', '2024-06-11 14:24:36', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(581, '::1', '2024-06-11 14:24:40', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(582, '::1', '2024-06-11 14:24:47', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(583, '::1', '2024-06-11 14:24:49', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(584, '::1', '2024-06-11 14:24:52', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(585, '::1', '2024-06-11 14:24:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(586, '::1', '2024-06-11 14:25:08', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(587, '::1', '2024-06-11 14:25:10', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(588, '::1', '2024-06-11 14:25:12', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(589, '::1', '2024-06-11 14:25:27', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(590, '::1', '2024-06-11 14:25:31', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(591, '::1', '2024-06-11 14:25:33', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(592, '::1', '2024-06-11 14:25:40', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(593, '::1', '2024-06-11 14:25:48', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(594, '::1', '2024-06-11 14:25:52', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(595, '::1', '2024-06-11 14:25:55', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(596, '::1', '2024-06-11 14:26:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(597, '::1', '2024-06-11 14:26:21', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(598, '::1', '2024-06-11 14:26:24', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(599, '::1', '2024-06-11 14:26:33', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(600, '::1', '2024-06-11 14:26:36', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(601, '::1', '2024-06-11 14:26:42', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(602, '::1', '2024-06-11 14:26:45', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(603, '::1', '2024-06-11 14:26:50', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(604, '::1', '2024-06-11 14:26:51', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(605, '::1', '2024-06-11 14:26:55', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(606, '::1', '2024-06-11 14:26:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(607, '::1', '2024-06-11 14:27:02', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(608, '::1', '2024-06-11 14:27:07', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(609, '::1', '2024-06-11 14:27:10', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(610, '::1', '2024-06-11 14:27:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(611, '::1', '2024-06-11 14:27:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(612, '::1', '2024-06-11 14:27:20', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(613, '::1', '2024-06-11 14:27:21', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(614, '::1', '2024-06-11 14:27:29', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(615, '::1', '2024-06-11 14:27:34', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(616, '::1', '2024-06-11 14:27:43', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(617, '::1', '2024-06-11 14:27:45', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(618, '::1', '2024-06-11 14:27:56', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(619, '::1', '2024-06-11 14:28:03', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(620, '::1', '2024-06-11 14:28:04', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(621, '::1', '2024-06-11 14:28:08', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(622, '::1', '2024-06-11 14:28:09', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(623, '::1', '2024-06-11 14:28:18', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(624, '::1', '2024-06-11 14:28:20', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(625, '::1', '2024-06-11 14:28:28', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(626, '::1', '2024-06-11 14:28:42', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(627, '::1', '2024-06-11 14:28:52', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(628, '::1', '2024-06-11 14:28:53', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(629, '::1', '2024-06-11 14:28:57', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(630, '::1', '2024-06-11 14:30:57', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(631, '::1', '2024-06-11 14:30:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(632, '::1', '2024-06-11 14:31:01', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(633, '::1', '2024-06-11 14:40:30', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(634, '::1', '2024-06-11 14:40:45', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(635, '::1', '2024-06-11 14:46:32', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(636, '::1', '2024-06-11 14:47:04', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(637, '::1', '2024-06-11 14:47:04', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(638, '::1', '2024-06-11 14:47:22', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(639, '::1', '2024-06-11 14:48:15', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(640, '::1', '2024-06-11 14:48:16', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(641, '::1', '2024-06-11 14:48:51', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(642, '::1', '2024-06-11 14:48:51', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(643, '::1', '2024-06-11 14:48:52', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(644, '::1', '2024-06-11 14:48:52', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(645, '::1', '2024-06-11 14:48:52', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(646, '::1', '2024-06-11 14:48:52', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(647, '::1', '2024-06-11 14:48:52', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(648, '::1', '2024-06-11 14:48:52', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(649, '::1', '2024-06-11 14:49:01', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(650, '::1', '2024-06-11 14:52:56', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(651, '::1', '2024-06-11 14:52:57', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(652, '::1', '2024-06-11 14:53:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(653, '::1', '2024-06-11 14:54:22', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(654, '::1', '2024-06-11 14:54:28', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(655, '::1', '2024-06-11 14:54:32', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(656, '::1', '2024-06-11 14:54:32', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(657, '::1', '2024-06-11 14:54:55', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(658, '::1', '2024-06-11 14:54:55', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(659, '::1', '2024-06-11 14:55:03', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(660, '::1', '2024-06-11 14:55:04', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(661, '::1', '2024-06-11 14:55:04', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(662, '::1', '2024-06-11 14:55:05', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(663, '::1', '2024-06-11 14:55:06', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(664, '::1', '2024-06-11 14:55:09', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(665, '::1', '2024-06-11 14:55:09', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(666, '::1', '2024-06-11 14:55:13', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(667, '::1', '2024-06-11 14:55:14', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(668, '::1', '2024-06-11 14:55:15', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(669, '::1', '2024-06-11 14:55:15', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(670, '::1', '2024-06-11 14:55:16', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(671, '::1', '2024-06-11 14:55:18', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(672, '::1', '2024-06-11 14:55:18', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(673, '::1', '2024-06-11 14:56:26', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(674, '::1', '2024-06-11 14:56:26', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(675, '::1', '2024-06-11 14:56:27', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(676, '::1', '2024-06-11 14:56:27', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(677, '::1', '2024-06-11 14:56:29', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(678, '::1', '2024-06-11 14:56:30', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(679, '::1', '2024-06-11 14:56:32', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(680, '::1', '2024-06-11 14:56:48', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(681, '::1', '2024-06-11 14:56:51', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(682, '::1', '2024-06-11 14:56:54', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(683, '::1', '2024-06-11 14:56:57', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(684, '::1', '2024-06-11 14:56:57', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(685, '::1', '2024-06-11 14:57:08', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(686, '::1', '2024-06-11 14:57:09', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(687, '::1', '2024-06-11 14:57:43', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(688, '::1', '2024-06-11 14:57:55', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(689, '::1', '2024-06-11 14:58:03', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(690, '::1', '2024-06-11 14:58:05', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(691, '::1', '2024-06-11 14:58:11', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(692, '::1', '2024-06-11 14:58:17', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(693, '::1', '2024-06-11 14:58:18', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(694, '::1', '2024-06-11 14:58:20', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(695, '::1', '2024-06-11 14:58:20', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(696, '::1', '2024-06-11 14:58:22', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(697, '::1', '2024-06-11 14:58:22', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(698, '::1', '2024-06-11 14:58:22', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(699, '::1', '2024-06-11 14:58:22', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(700, '::1', '2024-06-11 14:58:23', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(701, '::1', '2024-06-11 14:58:23', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(702, '::1', '2024-06-11 15:16:10', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(703, '::1', '2024-06-11 15:16:10', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(704, '::1', '2024-06-11 15:16:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(705, '::1', '2024-06-11 15:16:15', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(706, '::1', '2024-06-11 15:16:16', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(707, '::1', '2024-06-11 15:16:17', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(708, '::1', '2024-06-11 15:16:18', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(709, '::1', '2024-06-11 15:16:18', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(710, '::1', '2024-06-11 15:16:21', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(711, '::1', '2024-06-11 15:16:38', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(712, '::1', '2024-06-11 15:16:39', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(713, '::1', '2024-06-11 15:16:40', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(714, '::1', '2024-06-11 15:16:40', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(715, '::1', '2024-06-11 15:16:42', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(716, '::1', '2024-06-11 15:16:42', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(717, '::1', '2024-06-11 15:16:44', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(718, '::1', '2024-06-11 15:16:49', 'Pencarian: puasa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(719, '::1', '2024-06-11 15:16:51', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(720, '::1', '2024-06-11 15:16:51', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(721, '::1', '2024-06-11 15:16:53', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(722, '::1', '2024-06-11 15:16:54', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(723, '::1', '2024-06-11 15:16:57', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(724, '::1', '2024-06-11 15:16:57', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(725, '::1', '2024-06-11 15:17:04', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(726, '::1', '2024-06-11 15:17:04', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(727, '::1', '2024-06-11 15:17:08', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(728, '::1', '2024-06-11 15:21:35', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(729, '::1', '2024-06-11 15:21:35', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(730, '::1', '2024-06-11 15:21:37', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6666d2df80bb18.53971436'),
(731, '::1', '2024-06-14 16:02:44', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_666c07343c3c32.70423275'),
(732, '::1', '2024-06-14 16:02:49', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_666c07343c3c32.70423275'),
(733, '::1', '2024-06-14 16:02:49', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_666c07343c3c32.70423275'),
(734, '::1', '2024-06-19 17:12:53', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(735, '::1', '2024-06-19 17:12:53', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(736, '::1', '2024-06-19 17:13:11', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(737, '::1', '2024-06-19 17:13:11', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(738, '::1', '2024-06-19 17:13:12', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(739, '::1', '2024-06-19 17:13:12', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(740, '::1', '2024-06-19 17:13:12', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(741, '::1', '2024-06-19 17:13:12', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(742, '::1', '2024-06-19 17:13:12', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(743, '::1', '2024-06-19 17:13:12', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(744, '::1', '2024-06-19 17:13:16', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(745, '::1', '2024-06-19 17:13:16', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(746, '::1', '2024-06-19 17:13:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(747, '::1', '2024-06-19 17:13:18', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(748, '::1', '2024-06-19 17:13:19', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(749, '::1', '2024-06-19 17:13:22', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(750, '::1', '2024-06-19 17:13:22', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(751, '::1', '2024-06-19 17:13:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(752, '::1', '2024-06-19 17:13:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(753, '::1', '2024-06-19 17:13:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(754, '::1', '2024-06-19 17:13:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(755, '::1', '2024-06-19 17:13:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(756, '::1', '2024-06-19 17:13:44', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(757, '::1', '2024-06-19 17:13:48', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(758, '::1', '2024-06-19 17:13:48', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(759, '::1', '2024-06-19 17:13:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(760, '::1', '2024-06-19 17:13:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(761, '::1', '2024-06-19 17:13:50', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(762, '::1', '2024-06-19 17:13:50', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(763, '::1', '2024-06-19 17:14:03', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(764, '::1', '2024-06-19 17:14:04', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(765, '::1', '2024-06-19 17:14:18', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(766, '::1', '2024-06-19 17:14:20', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(767, '::1', '2024-06-19 17:14:22', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(768, '::1', '2024-06-19 17:14:24', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(769, '::1', '2024-06-19 17:14:24', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(770, '::1', '2024-06-19 17:14:33', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(771, '::1', '2024-06-19 17:14:35', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(772, '::1', '2024-06-19 17:14:35', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(773, '::1', '2024-06-19 17:14:35', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(774, '::1', '2024-06-19 17:32:11', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(775, '::1', '2024-06-19 17:32:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(776, '::1', '2024-06-19 17:32:59', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(777, '::1', '2024-06-19 17:32:59', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(778, '::1', '2024-06-19 17:33:00', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(779, '::1', '2024-06-19 17:33:11', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(780, '::1', '2024-06-19 17:33:19', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(781, '::1', '2024-06-19 17:33:21', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(782, '::1', '2024-06-19 17:33:23', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(783, '::1', '2024-06-19 17:33:25', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(784, '::1', '2024-06-19 17:33:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(785, '::1', '2024-06-19 17:33:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(786, '::1', '2024-06-19 17:33:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(787, '::1', '2024-06-19 17:33:30', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(788, '::1', '2024-06-19 17:33:32', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(789, '::1', '2024-06-19 17:33:32', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(790, '::1', '2024-06-19 17:33:33', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(791, '::1', '2024-06-19 17:33:33', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(792, '::1', '2024-06-19 17:33:33', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(793, '::1', '2024-06-19 17:33:34', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(794, '::1', '2024-06-19 17:33:34', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(795, '::1', '2024-06-19 17:33:34', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(796, '::1', '2024-06-19 17:33:34', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(797, '::1', '2024-06-19 17:33:35', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(798, '::1', '2024-06-19 17:33:35', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(799, '::1', '2024-06-19 17:33:36', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(800, '::1', '2024-06-19 17:33:36', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(801, '::1', '2024-06-19 17:33:36', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(802, '::1', '2024-06-19 17:33:37', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(803, '::1', '2024-06-19 17:33:37', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(804, '::1', '2024-06-19 17:33:38', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(805, '::1', '2024-06-19 17:33:38', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(806, '::1', '2024-06-19 17:33:41', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(807, '::1', '2024-06-19 17:33:41', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(808, '::1', '2024-06-19 17:33:44', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625');
INSERT INTO `tb_visitors` (`id`, `ip_address`, `visit_time`, `page_visited`, `user_agent`, `unique_user_id`) VALUES
(809, '::1', '2024-06-19 17:33:44', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(810, '::1', '2024-06-19 17:33:46', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(811, '::1', '2024-06-19 17:33:46', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(812, '::1', '2024-06-19 17:33:50', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(813, '::1', '2024-06-19 17:33:50', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(814, '::1', '2024-06-19 17:33:54', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(815, '::1', '2024-06-19 17:33:54', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(816, '::1', '2024-06-19 17:33:57', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(817, '::1', '2024-06-19 17:33:57', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(818, '::1', '2024-06-19 17:33:59', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(819, '::1', '2024-06-19 17:33:59', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(820, '::1', '2024-06-19 17:34:02', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(821, '::1', '2024-06-19 17:34:10', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(822, '::1', '2024-06-19 17:34:10', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(823, '::1', '2024-06-19 17:34:11', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(824, '::1', '2024-06-19 17:34:12', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(825, '::1', '2024-06-19 17:34:13', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(826, '::1', '2024-06-19 17:34:13', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(827, '::1', '2024-06-19 17:34:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(828, '::1', '2024-06-19 17:34:15', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(829, '::1', '2024-06-19 17:34:22', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(830, '::1', '2024-06-19 17:34:24', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(831, '::1', '2024-06-19 17:34:29', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(832, '::1', '2024-06-19 17:34:30', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(833, '::1', '2024-06-19 17:35:00', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(834, '::1', '2024-06-19 17:35:02', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(835, '::1', '2024-06-19 17:35:03', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(836, '::1', '2024-06-19 17:35:05', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(837, '::1', '2024-06-19 17:35:07', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(838, '::1', '2024-06-19 17:35:07', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(839, '::1', '2024-06-19 17:35:10', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(840, '::1', '2024-06-19 17:35:14', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(841, '::1', '2024-06-19 17:35:17', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(842, '::1', '2024-06-19 17:35:19', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(843, '::1', '2024-06-19 17:35:24', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(844, '::1', '2024-06-19 17:35:28', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(845, '::1', '2024-06-19 17:35:35', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(846, '::1', '2024-06-19 17:35:44', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(847, '::1', '2024-06-19 17:35:45', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(848, '::1', '2024-06-19 17:35:47', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(849, '::1', '2024-06-19 17:36:00', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(850, '::1', '2024-06-19 17:36:04', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(851, '::1', '2024-06-19 17:36:06', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(852, '::1', '2024-06-19 17:36:09', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(853, '::1', '2024-06-19 17:36:11', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(854, '::1', '2024-06-19 17:36:17', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(855, '::1', '2024-06-19 17:36:19', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(856, '::1', '2024-06-19 17:36:20', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(857, '::1', '2024-06-19 17:36:41', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(858, '::1', '2024-06-19 17:36:43', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(859, '::1', '2024-06-19 17:36:44', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(860, '::1', '2024-06-20 00:42:11', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'user_6672af256ef490.89612625'),
(861, '::1', '2024-06-20 23:53:32', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(862, '::1', '2024-06-20 23:55:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(863, '::1', '2024-06-20 23:55:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(864, '::1', '2024-06-20 23:55:21', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(865, '::1', '2024-06-20 23:55:21', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(866, '::1', '2024-06-20 23:55:26', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(867, '::1', '2024-06-20 23:55:26', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(868, '::1', '2024-06-20 23:55:59', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(869, '::1', '2024-06-20 23:55:59', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(870, '::1', '2024-06-20 23:56:17', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(871, '::1', '2024-06-20 23:56:17', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(872, '::1', '2024-06-20 23:56:27', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(873, '::1', '2024-06-20 23:56:27', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(874, '::1', '2024-06-20 23:56:54', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(875, '::1', '2024-06-20 23:56:54', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(876, '::1', '2024-06-20 23:57:01', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(877, '::1', '2024-06-20 23:57:02', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(878, '::1', '2024-06-20 23:57:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(879, '::1', '2024-06-20 23:57:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(880, '::1', '2024-06-20 23:57:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(881, '::1', '2024-06-20 23:57:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(882, '::1', '2024-06-20 23:57:19', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(883, '::1', '2024-06-20 23:57:19', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(884, '::1', '2024-06-20 23:57:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(885, '::1', '2024-06-20 23:57:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(886, '::1', '2024-06-20 23:57:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(887, '::1', '2024-06-20 23:57:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(888, '::1', '2024-06-20 23:57:32', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(889, '::1', '2024-06-20 23:57:33', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(890, '::1', '2024-06-20 23:57:40', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(891, '::1', '2024-06-20 23:57:40', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(892, '::1', '2024-06-20 23:57:44', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(893, '::1', '2024-06-20 23:57:44', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(894, '::1', '2024-06-20 23:57:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(895, '::1', '2024-06-20 23:57:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(896, '::1', '2024-06-20 23:57:52', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(897, '::1', '2024-06-20 23:57:52', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(898, '::1', '2024-06-20 23:57:56', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(899, '::1', '2024-06-20 23:57:56', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(900, '::1', '2024-06-20 23:58:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(901, '::1', '2024-06-20 23:58:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(902, '::1', '2024-06-20 23:58:11', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(903, '::1', '2024-06-20 23:58:12', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(904, '::1', '2024-06-20 23:58:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(905, '::1', '2024-06-20 23:58:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(906, '::1', '2024-06-20 23:58:22', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(907, '::1', '2024-06-20 23:58:22', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(908, '::1', '2024-06-20 23:58:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(909, '::1', '2024-06-20 23:58:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(910, '::1', '2024-06-20 23:58:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(911, '::1', '2024-06-20 23:58:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(912, '::1', '2024-06-20 23:58:52', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(913, '::1', '2024-06-20 23:58:52', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(914, '::1', '2024-06-20 23:58:54', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(915, '::1', '2024-06-20 23:58:54', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(916, '::1', '2024-06-20 23:59:02', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(917, '::1', '2024-06-20 23:59:02', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(918, '::1', '2024-06-20 23:59:04', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(919, '::1', '2024-06-20 23:59:04', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(920, '::1', '2024-06-20 23:59:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(921, '::1', '2024-06-20 23:59:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(922, '::1', '2024-06-20 23:59:37', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(923, '::1', '2024-06-20 23:59:37', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(924, '::1', '2024-06-20 23:59:40', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(925, '::1', '2024-06-20 23:59:40', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(926, '::1', '2024-06-20 23:59:46', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(927, '::1', '2024-06-20 23:59:46', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(928, '::1', '2024-06-20 23:59:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(929, '::1', '2024-06-20 23:59:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(930, '::1', '2024-06-21 00:00:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(931, '::1', '2024-06-21 00:00:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(932, '::1', '2024-06-21 00:00:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(933, '::1', '2024-06-21 00:00:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(934, '::1', '2024-06-21 00:00:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(935, '::1', '2024-06-21 00:00:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(936, '::1', '2024-06-21 00:00:20', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(937, '::1', '2024-06-21 00:00:20', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(938, '::1', '2024-06-21 00:00:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(939, '::1', '2024-06-21 00:00:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(940, '::1', '2024-06-21 00:00:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(941, '::1', '2024-06-21 00:00:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(942, '::1', '2024-06-21 00:00:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(943, '::1', '2024-06-21 00:00:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(944, '::1', '2024-06-21 00:00:32', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(945, '::1', '2024-06-21 00:00:32', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(946, '::1', '2024-06-21 00:00:36', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(947, '::1', '2024-06-21 00:00:36', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(948, '::1', '2024-06-21 00:00:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(949, '::1', '2024-06-21 00:00:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(950, '::1', '2024-06-21 00:00:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(951, '::1', '2024-06-21 00:00:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(952, '::1', '2024-06-21 00:01:00', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(953, '::1', '2024-06-21 00:01:00', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(954, '::1', '2024-06-21 00:01:02', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(955, '::1', '2024-06-21 00:01:02', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(956, '::1', '2024-06-21 00:01:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(957, '::1', '2024-06-21 00:01:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(958, '::1', '2024-06-21 00:01:07', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(959, '::1', '2024-06-21 00:01:07', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(960, '::1', '2024-06-21 00:01:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(961, '::1', '2024-06-21 00:01:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(962, '::1', '2024-06-21 00:01:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(963, '::1', '2024-06-21 00:01:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(964, '::1', '2024-06-21 00:01:34', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(965, '::1', '2024-06-21 00:01:34', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(966, '::1', '2024-06-21 00:01:38', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(967, '::1', '2024-06-21 00:01:38', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(968, '::1', '2024-06-21 00:01:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(969, '::1', '2024-06-21 00:01:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(970, '::1', '2024-06-21 00:01:51', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(971, '::1', '2024-06-21 00:01:51', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(972, '::1', '2024-06-21 00:01:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(973, '::1', '2024-06-21 00:01:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(974, '::1', '2024-06-21 00:02:01', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(975, '::1', '2024-06-21 00:02:01', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(976, '::1', '2024-06-21 00:02:03', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(977, '::1', '2024-06-21 00:02:03', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(978, '::1', '2024-06-21 00:02:18', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(979, '::1', '2024-06-21 00:02:18', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(980, '::1', '2024-06-21 00:02:20', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(981, '::1', '2024-06-21 00:02:20', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(982, '::1', '2024-06-21 00:02:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(983, '::1', '2024-06-21 00:02:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(984, '::1', '2024-06-21 00:02:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(985, '::1', '2024-06-21 00:02:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(986, '::1', '2024-06-21 00:02:39', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(987, '::1', '2024-06-21 00:02:40', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(988, '::1', '2024-06-21 00:02:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(989, '::1', '2024-06-21 00:02:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(990, '::1', '2024-06-21 00:02:56', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(991, '::1', '2024-06-21 00:02:56', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(992, '::1', '2024-06-21 00:03:03', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(993, '::1', '2024-06-21 00:03:03', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(994, '::1', '2024-06-21 00:03:06', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(995, '::1', '2024-06-21 00:03:06', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(996, '::1', '2024-06-21 00:03:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(997, '::1', '2024-06-21 00:03:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(998, '::1', '2024-06-21 00:03:13', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(999, '::1', '2024-06-21 00:03:13', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1000, '::1', '2024-06-21 00:03:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1001, '::1', '2024-06-21 00:03:15', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1002, '::1', '2024-06-21 00:03:17', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1003, '::1', '2024-06-21 00:03:17', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1004, '::1', '2024-06-21 00:05:46', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1005, '::1', '2024-06-21 00:05:46', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1006, '::1', '2024-06-21 00:05:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1007, '::1', '2024-06-21 00:05:49', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1008, '::1', '2024-06-21 00:05:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1009, '::1', '2024-06-21 00:05:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1010, '::1', '2024-06-21 00:05:58', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1011, '::1', '2024-06-21 00:05:58', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1012, '::1', '2024-06-21 00:06:00', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1013, '::1', '2024-06-21 00:06:00', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1014, '::1', '2024-06-21 00:06:04', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1015, '::1', '2024-06-21 00:06:04', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1016, '::1', '2024-06-21 00:06:19', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1017, '::1', '2024-06-21 00:06:20', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1018, '::1', '2024-06-21 00:06:22', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1019, '::1', '2024-06-21 00:06:22', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1020, '::1', '2024-06-21 00:07:11', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1021, '::1', '2024-06-21 00:07:11', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1022, '::1', '2024-06-21 00:07:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1023, '::1', '2024-06-21 00:07:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1024, '::1', '2024-06-21 00:07:18', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1025, '::1', '2024-06-21 00:07:18', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1026, '::1', '2024-06-21 00:07:21', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1027, '::1', '2024-06-21 00:07:22', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1028, '::1', '2024-06-21 00:07:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1029, '::1', '2024-06-21 00:07:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1030, '::1', '2024-06-21 00:07:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1031, '::1', '2024-06-21 00:07:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1032, '::1', '2024-06-21 00:07:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1033, '::1', '2024-06-21 00:07:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1034, '::1', '2024-06-21 00:07:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1035, '::1', '2024-06-21 00:07:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1036, '::1', '2024-06-21 00:07:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1037, '::1', '2024-06-21 00:07:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1038, '::1', '2024-06-21 00:07:34', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1039, '::1', '2024-06-21 00:07:34', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1040, '::1', '2024-06-21 00:08:57', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1041, '::1', '2024-06-21 00:08:57', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1042, '::1', '2024-06-21 00:08:59', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1043, '::1', '2024-06-21 00:08:59', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1044, '::1', '2024-06-21 00:09:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1045, '::1', '2024-06-21 00:09:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1046, '::1', '2024-06-21 00:10:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1047, '::1', '2024-06-21 00:10:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1048, '::1', '2024-06-21 00:10:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1049, '::1', '2024-06-21 00:10:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1050, '::1', '2024-06-21 00:10:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1051, '::1', '2024-06-21 00:10:28', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1052, '::1', '2024-06-21 00:10:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1053, '::1', '2024-06-21 00:10:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1054, '::1', '2024-06-21 00:10:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1055, '::1', '2024-06-21 00:10:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1056, '::1', '2024-06-21 00:10:58', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1057, '::1', '2024-06-21 00:10:58', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1058, '::1', '2024-06-21 00:11:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1059, '::1', '2024-06-21 00:11:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1060, '::1', '2024-06-21 00:11:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1061, '::1', '2024-06-21 00:11:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1062, '::1', '2024-06-21 00:11:33', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1063, '::1', '2024-06-21 00:11:33', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996');
INSERT INTO `tb_visitors` (`id`, `ip_address`, `visit_time`, `page_visited`, `user_agent`, `unique_user_id`) VALUES
(1064, '::1', '2024-06-21 00:12:33', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1065, '::1', '2024-06-21 00:12:33', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1066, '::1', '2024-06-21 00:12:39', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1067, '::1', '2024-06-21 00:12:39', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1068, '::1', '2024-06-21 00:13:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1069, '::1', '2024-06-21 00:13:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1070, '::1', '2024-06-21 00:13:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1071, '::1', '2024-06-21 00:13:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1072, '::1', '2024-06-21 00:13:21', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1073, '::1', '2024-06-21 00:13:21', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1074, '::1', '2024-06-21 00:13:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1075, '::1', '2024-06-21 00:13:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1076, '::1', '2024-06-21 00:13:41', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1077, '::1', '2024-06-21 00:13:41', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1078, '::1', '2024-06-21 00:13:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1079, '::1', '2024-06-21 00:13:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1080, '::1', '2024-06-21 00:13:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1081, '::1', '2024-06-21 00:13:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1082, '::1', '2024-06-21 00:13:48', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1083, '::1', '2024-06-21 00:13:48', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1084, '::1', '2024-06-21 00:14:01', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1085, '::1', '2024-06-21 00:14:01', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1086, '::1', '2024-06-21 00:14:04', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1087, '::1', '2024-06-21 00:14:04', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1088, '::1', '2024-06-21 00:14:06', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1089, '::1', '2024-06-21 00:14:06', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1090, '::1', '2024-06-21 00:14:10', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1091, '::1', '2024-06-21 00:14:10', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1092, '::1', '2024-06-21 00:14:11', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1093, '::1', '2024-06-21 00:14:11', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1094, '::1', '2024-06-21 00:14:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1095, '::1', '2024-06-21 00:14:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1096, '::1', '2024-06-21 00:14:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1097, '::1', '2024-06-21 00:14:16', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1098, '::1', '2024-06-21 00:14:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1099, '::1', '2024-06-21 00:14:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1100, '::1', '2024-06-21 00:14:27', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1101, '::1', '2024-06-21 00:14:27', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1102, '::1', '2024-06-21 00:14:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1103, '::1', '2024-06-21 00:14:29', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1104, '::1', '2024-06-21 00:14:31', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1105, '::1', '2024-06-21 00:14:31', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1106, '::1', '2024-06-21 00:14:32', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1107, '::1', '2024-06-21 00:14:32', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1108, '::1', '2024-06-21 00:14:34', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1109, '::1', '2024-06-21 00:14:34', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1110, '::1', '2024-06-21 00:14:44', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1111, '::1', '2024-06-21 00:14:45', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1112, '::1', '2024-06-21 00:14:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1113, '::1', '2024-06-21 00:14:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1114, '::1', '2024-06-21 00:14:53', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1115, '::1', '2024-06-21 00:14:53', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1116, '::1', '2024-06-21 00:14:56', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1117, '::1', '2024-06-21 00:14:56', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1118, '::1', '2024-06-21 00:15:18', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1119, '::1', '2024-06-21 00:15:18', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1120, '::1', '2024-06-21 00:15:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1121, '::1', '2024-06-21 00:15:23', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1122, '::1', '2024-06-21 00:15:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1123, '::1', '2024-06-21 00:15:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1124, '::1', '2024-06-21 00:15:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1125, '::1', '2024-06-21 00:15:30', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1126, '::1', '2024-06-21 00:18:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1127, '::1', '2024-06-21 00:18:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1128, '::1', '2024-06-21 00:18:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1129, '::1', '2024-06-21 00:18:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1130, '::1', '2024-06-21 00:19:10', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1131, '::1', '2024-06-21 00:19:10', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1132, '::1', '2024-06-21 00:19:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1133, '::1', '2024-06-21 00:19:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1134, '::1', '2024-06-21 00:19:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1135, '::1', '2024-06-21 00:19:24', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1136, '::1', '2024-06-21 00:19:26', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1137, '::1', '2024-06-21 00:19:26', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1138, '::1', '2024-06-21 00:19:38', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1139, '::1', '2024-06-21 00:19:38', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1140, '::1', '2024-06-21 00:19:41', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1141, '::1', '2024-06-21 00:19:41', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1142, '::1', '2024-06-21 00:19:42', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1143, '::1', '2024-06-21 00:19:42', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1144, '::1', '2024-06-21 00:19:57', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1145, '::1', '2024-06-21 00:19:58', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1146, '::1', '2024-06-21 00:20:03', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1147, '::1', '2024-06-21 00:20:03', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1148, '::1', '2024-06-21 00:20:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1149, '::1', '2024-06-21 00:20:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1150, '::1', '2024-06-21 00:20:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1151, '::1', '2024-06-21 00:20:14', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1152, '::1', '2024-06-21 00:20:39', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1153, '::1', '2024-06-21 00:20:39', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1154, '::1', '2024-06-21 00:20:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1155, '::1', '2024-06-21 00:20:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1156, '::1', '2024-06-21 00:20:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1157, '::1', '2024-06-21 00:20:47', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1158, '::1', '2024-06-21 00:20:51', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1159, '::1', '2024-06-21 00:20:51', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1160, '::1', '2024-06-21 00:21:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1161, '::1', '2024-06-21 00:21:08', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1162, '::1', '2024-06-21 00:32:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1163, '::1', '2024-06-21 00:32:10', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1164, '::1', '2024-06-21 00:46:30', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1165, '::1', '2024-06-21 00:46:39', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1166, '::1', '2024-06-21 00:46:39', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1167, '::1', '2024-06-21 00:46:40', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1168, '::1', '2024-06-21 00:46:41', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1169, '::1', '2024-06-21 00:46:42', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1170, '::1', '2024-06-21 00:46:43', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1171, '::1', '2024-06-21 00:47:22', 'Pencarian: shalat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1172, '::1', '2024-06-21 00:47:25', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1173, '::1', '2024-06-21 00:47:42', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1174, '::1', '2024-06-21 00:47:47', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1175, '::1', '2024-06-21 00:55:10', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1176, '::1', '2024-06-21 00:55:17', 'Artikel: Keutamaan Sedekah dalam Islam', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1177, '::1', '2024-06-21 00:55:17', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1178, '::1', '2024-06-21 00:55:31', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1179, '::1', '2024-06-21 00:55:36', 'Artikel: Keutamaan Sedekah dalam Islam', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1180, '::1', '2024-06-21 00:55:36', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1181, '::1', '2024-06-21 00:55:39', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1182, '::1', '2024-06-21 00:56:09', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1183, '::1', '2024-06-21 00:56:09', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1184, '::1', '2024-06-21 00:56:11', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1185, '::1', '2024-06-21 00:56:12', 'Artikel: Keutamaan Sedekah dalam Islam', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1186, '::1', '2024-06-21 00:56:12', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1187, '::1', '2024-06-21 00:56:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1188, '::1', '2024-06-21 00:56:16', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1189, '::1', '2024-06-21 00:56:16', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1190, '::1', '2024-06-21 00:56:18', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1191, '::1', '2024-06-21 00:56:19', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1192, '::1', '2024-06-21 00:56:20', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1193, '::1', '2024-06-21 00:56:22', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1194, '::1', '2024-06-21 00:56:24', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1195, '::1', '2024-06-21 00:56:24', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1196, '::1', '2024-06-21 00:56:51', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1197, '::1', '2024-06-21 00:56:51', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1198, '::1', '2024-06-21 00:56:57', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1199, '::1', '2024-06-21 00:56:58', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1200, '::1', '2024-06-21 00:57:00', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1201, '::1', '2024-06-21 00:57:00', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1202, '::1', '2024-06-21 01:00:00', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1203, '::1', '2024-06-21 01:00:00', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1204, '::1', '2024-06-21 01:01:13', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1205, '::1', '2024-06-21 01:01:13', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1206, '::1', '2024-06-21 01:01:18', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1207, '::1', '2024-06-21 01:01:19', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1208, '::1', '2024-06-21 01:01:20', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1209, '::1', '2024-06-21 01:01:28', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1210, '::1', '2024-06-21 01:01:29', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1211, '::1', '2024-06-21 01:01:36', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1212, '::1', '2024-06-21 01:01:38', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1213, '::1', '2024-06-21 01:02:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1214, '::1', '2024-06-21 01:02:48', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1215, '::1', '2024-06-21 01:03:33', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1216, '::1', '2024-06-21 01:03:33', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1217, '::1', '2024-06-21 01:03:34', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1218, '::1', '2024-06-21 01:03:35', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1219, '::1', '2024-06-21 01:03:43', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1220, '::1', '2024-06-21 01:03:58', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1221, '::1', '2024-06-21 01:04:02', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1222, '::1', '2024-06-21 01:04:18', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1223, '::1', '2024-06-21 01:04:19', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1224, '::1', '2024-06-21 01:04:20', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1225, '::1', '2024-06-21 01:04:21', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1226, '::1', '2024-06-21 01:04:21', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1227, '::1', '2024-06-21 01:04:23', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1228, '::1', '2024-06-21 01:04:27', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1229, '::1', '2024-06-21 01:04:30', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1230, '::1', '2024-06-21 01:04:32', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1231, '::1', '2024-06-21 01:04:35', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1232, '::1', '2024-06-21 01:04:59', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1233, '::1', '2024-06-21 01:05:57', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1234, '::1', '2024-06-21 01:06:03', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1235, '::1', '2024-06-21 01:07:12', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1236, '::1', '2024-06-21 01:07:25', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1237, '::1', '2024-06-21 01:07:27', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1238, '::1', '2024-06-21 01:07:27', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1239, '::1', '2024-06-21 01:07:27', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1240, '::1', '2024-06-21 01:07:28', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1241, '::1', '2024-06-21 01:07:29', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1242, '::1', '2024-06-21 01:07:32', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1243, '::1', '2024-06-21 01:11:25', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1244, '::1', '2024-06-21 01:11:34', 'Video: Pentingnya Mencari Ilmu dalam Islam', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1245, '::1', '2024-06-21 01:11:34', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1246, '::1', '2024-06-21 01:11:41', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1247, '::1', '2024-06-21 01:14:15', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1248, '::1', '2024-06-21 01:14:40', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1249, '::1', '2024-06-21 01:15:03', 'Artikel: Keutamaan Sedekah dalam Islam', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1250, '::1', '2024-06-21 01:15:03', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1251, '::1', '2024-06-21 01:15:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1252, '::1', '2024-06-21 01:15:16', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1253, '::1', '2024-06-21 01:15:16', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1254, '::1', '2024-06-21 01:15:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1255, '::1', '2024-06-21 01:15:43', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1256, '::1', '2024-06-21 01:15:45', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1257, '::1', '2024-06-21 01:15:45', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1258, '::1', '2024-06-21 01:15:48', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1259, '::1', '2024-06-21 01:15:48', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1260, '::1', '2024-06-21 01:17:25', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1261, '::1', '2024-06-21 01:17:55', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1262, '::1', '2024-06-21 01:18:03', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1263, '::1', '2024-06-21 01:18:03', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1264, '::1', '2024-06-21 01:18:07', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1265, '::1', '2024-06-21 01:18:10', 'Video: Keutamaan Membaca Al-Quran', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1266, '::1', '2024-06-21 01:18:10', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1267, '::1', '2024-06-21 01:18:12', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1268, '::1', '2024-06-21 01:22:52', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1269, '::1', '2024-06-21 01:23:07', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1270, '::1', '2024-06-21 01:23:07', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1271, '::1', '2024-06-21 01:23:08', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1272, '::1', '2024-06-21 01:23:09', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1273, '::1', '2024-06-21 01:23:09', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1274, '::1', '2024-06-21 01:23:22', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1275, '::1', '2024-06-21 01:24:07', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1276, '::1', '2024-06-21 01:24:07', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1277, '::1', '2024-06-21 01:24:09', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1278, '::1', '2024-06-21 01:24:10', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1279, '::1', '2024-06-21 01:24:10', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1280, '::1', '2024-06-21 01:24:12', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1281, '::1', '2024-06-21 01:24:12', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1282, '::1', '2024-06-21 01:25:32', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1283, '::1', '2024-06-21 01:25:32', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1284, '::1', '2024-06-21 01:25:36', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1285, '::1', '2024-06-21 01:25:59', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1286, '::1', '2024-06-21 01:26:05', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1287, '::1', '2024-06-21 01:26:27', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1288, '::1', '2024-06-21 01:28:39', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1289, '::1', '2024-06-21 01:28:59', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1290, '::1', '2024-06-21 01:29:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1291, '::1', '2024-06-21 01:29:19', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1292, '::1', '2024-06-21 01:29:19', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1293, '::1', '2024-06-21 01:29:20', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1294, '::1', '2024-06-21 01:29:20', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1295, '::1', '2024-06-21 01:29:20', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1296, '::1', '2024-06-21 01:29:20', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1297, '::1', '2024-06-21 01:29:20', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1298, '::1', '2024-06-21 01:29:20', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1299, '::1', '2024-06-21 01:29:20', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1300, '::1', '2024-06-21 01:29:20', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1301, '::1', '2024-06-21 01:29:21', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1302, '::1', '2024-06-21 01:29:22', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1303, '::1', '2024-06-21 01:29:22', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1304, '::1', '2024-06-21 01:29:23', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1305, '::1', '2024-06-21 01:29:23', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1306, '::1', '2024-06-21 01:29:23', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1307, '::1', '2024-06-21 01:29:23', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1308, '::1', '2024-06-21 01:29:23', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1309, '::1', '2024-06-21 01:29:23', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1310, '::1', '2024-06-21 01:29:23', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1311, '::1', '2024-06-21 01:29:23', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1312, '::1', '2024-06-21 01:29:23', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996');
INSERT INTO `tb_visitors` (`id`, `ip_address`, `visit_time`, `page_visited`, `user_agent`, `unique_user_id`) VALUES
(1313, '::1', '2024-06-21 01:29:23', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1314, '::1', '2024-06-21 01:29:23', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1315, '::1', '2024-06-21 01:29:23', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1316, '::1', '2024-06-21 01:29:24', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1317, '::1', '2024-06-21 01:29:24', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1318, '::1', '2024-06-21 01:29:24', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1319, '::1', '2024-06-21 01:29:24', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1320, '::1', '2024-06-21 01:29:24', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1321, '::1', '2024-06-21 01:29:24', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1322, '::1', '2024-06-21 01:29:24', 'Video: Manfaat Membaca Al-Quran Setiap Hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1323, '::1', '2024-06-21 01:29:24', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1324, '::1', '2024-06-21 01:29:24', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1325, '::1', '2024-06-21 01:29:25', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1326, '::1', '2024-06-21 01:29:27', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1327, '::1', '2024-06-21 01:29:31', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1328, '::1', '2024-06-21 01:29:32', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1329, '::1', '2024-06-21 01:29:33', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1330, '::1', '2024-06-21 01:29:35', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1331, '::1', '2024-06-21 01:29:36', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1332, '::1', '2024-06-21 01:29:38', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1333, '::1', '2024-06-21 01:29:38', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1334, '::1', '2024-06-21 01:29:39', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1335, '::1', '2024-06-21 01:29:39', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1336, '::1', '2024-06-21 01:29:40', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1337, '::1', '2024-06-21 01:29:40', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1338, '::1', '2024-06-21 01:29:40', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1339, '::1', '2024-06-21 01:29:40', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1340, '::1', '2024-06-21 01:29:40', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1341, '::1', '2024-06-21 01:29:40', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1342, '::1', '2024-06-21 01:29:40', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1343, '::1', '2024-06-21 01:29:40', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1344, '::1', '2024-06-21 01:29:40', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1345, '::1', '2024-06-21 01:29:40', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1346, '::1', '2024-06-21 01:29:40', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1347, '::1', '2024-06-21 01:29:40', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1348, '::1', '2024-06-21 01:29:41', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1349, '::1', '2024-06-21 01:29:41', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1350, '::1', '2024-06-21 01:29:41', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1351, '::1', '2024-06-21 01:29:41', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1352, '::1', '2024-06-21 01:29:41', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1353, '::1', '2024-06-21 01:29:41', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1354, '::1', '2024-06-21 01:29:41', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1355, '::1', '2024-06-21 01:29:43', 'Artikel: Pentingnya Shalat Dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1356, '::1', '2024-06-21 01:29:43', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1357, '::1', '2024-06-21 01:29:44', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1358, '::1', '2024-06-21 01:29:45', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1359, '::1', '2024-06-21 01:29:48', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1360, '::1', '2024-06-21 01:29:49', 'Video: Keutamaan Shalat Tahajud dan Cara Melaksanakannya', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1361, '::1', '2024-06-21 01:29:49', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1362, '::1', '2024-06-21 01:29:57', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1363, '::1', '2024-06-21 01:30:10', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1364, '::1', '2024-06-21 01:30:13', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1365, '::1', '2024-06-21 01:30:15', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1366, '::1', '2024-06-21 01:30:18', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1367, '::1', '2024-06-21 01:30:19', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1368, '::1', '2024-06-21 01:32:57', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1369, '::1', '2024-06-21 01:33:00', 'Video: Keutamaan Membaca Shalawat Nabi', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1370, '::1', '2024-06-21 01:33:00', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1371, '::1', '2024-06-21 01:33:08', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1372, '::1', '2024-06-21 01:33:13', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1373, '::1', '2024-06-21 01:33:32', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1374, '::1', '2024-06-21 01:33:32', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1375, '::1', '2024-06-21 01:33:33', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1376, '::1', '2024-06-21 01:33:34', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1377, '::1', '2024-06-21 01:33:35', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1378, '::1', '2024-06-21 01:33:36', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1379, '::1', '2024-06-21 01:33:37', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1380, '::1', '2024-06-21 01:33:59', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1381, '::1', '2024-06-21 01:34:05', 'Pencarian: nabi', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1382, '::1', '2024-06-21 01:34:12', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1383, '::1', '2024-06-21 01:34:13', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1384, '::1', '2024-06-21 01:34:15', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1385, '::1', '2024-06-21 01:34:37', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1386, '::1', '2024-06-21 01:34:41', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1387, '::1', '2024-06-21 01:34:41', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1388, '::1', '2024-06-21 01:34:44', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1389, '::1', '2024-06-21 01:34:47', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1390, '::1', '2024-06-21 01:34:48', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1391, '::1', '2024-06-21 01:37:29', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1392, '::1', '2024-06-21 01:37:32', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1393, '::1', '2024-06-21 01:37:36', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1394, '::1', '2024-06-21 01:37:47', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1395, '::1', '2024-06-21 01:37:55', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1396, '::1', '2024-06-21 01:37:56', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1397, '::1', '2024-06-21 01:37:57', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1398, '::1', '2024-06-21 01:37:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1399, '::1', '2024-06-21 01:38:56', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1400, '::1', '2024-06-21 01:38:57', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1401, '::1', '2024-06-21 01:38:57', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1402, '::1', '2024-06-21 01:38:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1403, '::1', '2024-06-21 01:38:59', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1404, '::1', '2024-06-21 01:39:00', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1405, '::1', '2024-06-21 01:39:15', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1406, '::1', '2024-06-21 01:39:19', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1407, '::1', '2024-06-21 01:39:20', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1408, '::1', '2024-06-21 01:39:21', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1409, '::1', '2024-06-21 01:39:22', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1410, '::1', '2024-06-21 01:39:27', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1411, '::1', '2024-06-21 01:39:28', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1412, '::1', '2024-06-21 01:39:29', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1413, '::1', '2024-06-21 01:39:30', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1414, '::1', '2024-06-21 01:39:51', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1415, '::1', '2024-06-21 01:39:55', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1416, '::1', '2024-06-21 01:40:13', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1417, '::1', '2024-06-21 01:40:34', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1418, '::1', '2024-06-21 01:40:35', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1419, '::1', '2024-06-21 01:40:50', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1420, '::1', '2024-06-21 01:40:53', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1421, '::1', '2024-06-21 01:41:08', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1422, '::1', '2024-06-21 01:41:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1423, '::1', '2024-06-21 01:41:28', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1424, '::1', '2024-06-21 01:41:30', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1425, '::1', '2024-06-21 01:42:59', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1426, '::1', '2024-06-21 01:42:59', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1427, '::1', '2024-06-21 01:43:24', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1428, '::1', '2024-06-21 01:44:27', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1429, '::1', '2024-06-21 01:44:28', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1430, '::1', '2024-06-21 01:44:29', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1431, '::1', '2024-06-21 01:44:29', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1432, '::1', '2024-06-21 01:44:34', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1433, '::1', '2024-06-21 01:44:35', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1434, '::1', '2024-06-21 01:44:40', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1435, '::1', '2024-06-21 01:44:42', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1436, '::1', '2024-06-21 01:44:44', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1437, '::1', '2024-06-21 01:47:04', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1438, '::1', '2024-06-21 01:47:08', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1439, '::1', '2024-06-21 01:47:16', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1440, '::1', '2024-06-21 01:47:19', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1441, '::1', '2024-06-21 01:47:21', 'Artikel: Mengajarkan Anak Berpuasa Sejak Dini', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1442, '::1', '2024-06-21 01:47:21', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1443, '::1', '2024-06-21 01:47:22', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1444, '::1', '2024-06-21 01:47:33', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1445, '::1', '2024-06-21 01:47:38', 'Artikel: Mengajarkan Anak Berpuasa Sejak Dini', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1446, '::1', '2024-06-21 01:47:38', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1447, '::1', '2024-06-21 01:47:41', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1448, '::1', '2024-06-21 01:47:42', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1449, '::1', '2024-06-21 01:47:43', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1450, '::1', '2024-06-21 01:47:44', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1451, '::1', '2024-06-21 01:47:45', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1452, '::1', '2024-06-21 01:47:59', 'Video: Keutamaan Membaca Al-Quran', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1453, '::1', '2024-06-21 01:47:59', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1454, '::1', '2024-06-21 01:48:00', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1455, '::1', '2024-06-21 01:48:02', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1456, '::1', '2024-06-21 01:48:03', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1457, '::1', '2024-06-21 01:48:03', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1458, '::1', '2024-06-21 01:48:04', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1459, '::1', '2024-06-21 01:48:09', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1460, '::1', '2024-06-21 01:48:13', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1461, '::1', '2024-06-21 01:48:28', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1462, '::1', '2024-06-21 01:48:29', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1463, '::1', '2024-06-21 01:48:30', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1464, '::1', '2024-06-21 01:48:30', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1465, '::1', '2024-06-21 01:48:31', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1466, '::1', '2024-06-21 01:48:59', 'Artikel: Mengajarkan Anak Berpuasa Sejak Dini', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1467, '::1', '2024-06-21 01:48:59', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1468, '::1', '2024-06-21 01:49:04', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1469, '::1', '2024-06-21 01:49:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1470, '::1', '2024-06-21 01:51:50', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1471, '::1', '2024-06-21 01:51:53', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1472, '::1', '2024-06-21 01:51:55', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1473, '::1', '2024-06-21 01:54:18', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1474, '::1', '2024-06-21 01:54:24', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1475, '::1', '2024-06-21 01:55:15', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1476, '::1', '2024-06-21 01:55:16', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1477, '::1', '2024-06-21 01:55:17', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1478, '::1', '2024-06-21 01:55:19', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1479, '::1', '2024-06-21 01:55:22', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1480, '::1', '2024-06-21 01:55:26', 'Artikel: Keutamaan dan Manfaat Membaca Surah Al-Kahfi', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1481, '::1', '2024-06-21 01:55:26', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1482, '::1', '2024-06-21 01:55:28', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1483, '::1', '2024-06-21 01:55:30', 'Artikel: Keutamaan Sedekah dalam Islam', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1484, '::1', '2024-06-21 01:55:30', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1485, '::1', '2024-06-21 01:55:32', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1486, '::1', '2024-06-21 01:55:46', 'Artikel: Pentingnya Beristighfar dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1487, '::1', '2024-06-21 01:55:46', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1488, '::1', '2024-06-21 01:55:47', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1489, '::1', '2024-06-21 01:55:50', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1490, '::1', '2024-06-21 01:55:53', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1491, '::1', '2024-06-21 01:55:54', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1492, '::1', '2024-06-21 01:55:59', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1493, '::1', '2024-06-21 01:56:12', 'Pencarian: puasa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1494, '::1', '2024-06-21 01:56:37', 'Pencarian: puasa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1495, '::1', '2024-06-21 01:56:39', 'Pencarian: puasa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1496, '::1', '2024-06-21 01:56:40', 'Pencarian: puasa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1497, '::1', '2024-06-21 01:56:41', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1498, '::1', '2024-06-21 01:56:59', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1499, '::1', '2024-06-21 01:57:02', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1500, '::1', '2024-06-21 01:59:20', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1501, '::1', '2024-06-21 01:59:22', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1502, '::1', '2024-06-21 01:59:27', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1503, '::1', '2024-06-21 01:59:27', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1504, '::1', '2024-06-21 01:59:28', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1505, '::1', '2024-06-21 01:59:29', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1506, '::1', '2024-06-21 01:59:31', 'Artikel: Mengenal Keutamaan I\'tikaf di Bulan Ramadhan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1507, '::1', '2024-06-21 01:59:31', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1508, '::1', '2024-06-21 01:59:33', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1509, '::1', '2024-06-21 01:59:41', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1510, '::1', '2024-06-21 01:59:44', 'Artikel: Mengenal Keutamaan I\'tikaf di Bulan Ramadhan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1511, '::1', '2024-06-21 01:59:44', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1512, '::1', '2024-06-21 02:00:50', 'Artikel: Mengenal Keutamaan I\'tikaf di Bulan Ramadhan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1513, '::1', '2024-06-21 02:00:51', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1514, '::1', '2024-06-21 02:00:52', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1515, '::1', '2024-06-21 02:02:56', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1516, '::1', '2024-06-21 02:02:59', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1517, '::1', '2024-06-21 02:03:10', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1518, '::1', '2024-06-21 02:03:14', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1519, '::1', '2024-06-21 02:03:17', 'Video: Keutamaan Berbakti kepada Orang Tua', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1520, '::1', '2024-06-21 02:03:17', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1521, '::1', '2024-06-21 02:03:19', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1522, '::1', '2024-06-21 02:03:21', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1523, '::1', '2024-06-21 02:03:35', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1524, '::1', '2024-06-21 02:03:35', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1525, '::1', '2024-06-21 02:03:36', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1526, '::1', '2024-06-21 02:03:36', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1527, '::1', '2024-06-21 02:03:37', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1528, '::1', '2024-06-21 02:03:38', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1529, '::1', '2024-06-21 02:05:45', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1530, '::1', '2024-06-21 02:05:49', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1531, '::1', '2024-06-21 02:05:58', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1532, '::1', '2024-06-21 02:06:01', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1533, '::1', '2024-06-21 02:07:44', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1534, '::1', '2024-06-21 02:08:19', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1535, '::1', '2024-06-21 02:08:20', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1536, '::1', '2024-06-21 02:08:20', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1537, '::1', '2024-06-21 02:08:21', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1538, '::1', '2024-06-21 02:08:22', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1539, '::1', '2024-06-21 02:08:24', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1540, '::1', '2024-06-21 02:08:25', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1541, '::1', '2024-06-21 02:10:14', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1542, '::1', '2024-06-21 02:13:25', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1543, '::1', '2024-06-21 02:13:31', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1544, '::1', '2024-06-21 02:15:08', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1545, '::1', '2024-06-21 02:15:11', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1546, '::1', '2024-06-21 02:15:42', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1547, '::1', '2024-06-21 02:15:46', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1548, '::1', '2024-06-21 02:15:49', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1549, '::1', '2024-06-21 02:16:10', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1550, '::1', '2024-06-21 02:16:20', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1551, '::1', '2024-06-21 02:16:25', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1552, '::1', '2024-06-21 02:16:42', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1553, '::1', '2024-06-21 02:16:43', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1554, '::1', '2024-06-21 02:16:44', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1555, '::1', '2024-06-21 02:16:45', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1556, '::1', '2024-06-21 02:16:47', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1557, '::1', '2024-06-21 02:16:49', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1558, '::1', '2024-06-21 02:16:49', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1559, '::1', '2024-06-21 02:16:51', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1560, '::1', '2024-06-21 02:16:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996');
INSERT INTO `tb_visitors` (`id`, `ip_address`, `visit_time`, `page_visited`, `user_agent`, `unique_user_id`) VALUES
(1561, '::1', '2024-06-21 02:17:02', 'Doa: Keutamaan Bersabar dalam Menghadapi Ujian Hidup', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1562, '::1', '2024-06-21 02:17:02', 'Doa: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1563, '::1', '2024-06-21 02:17:03', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1564, '::1', '2024-06-21 02:17:04', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1565, '::1', '2024-06-21 02:17:06', 'Artikel: Menjaga Lisan dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1566, '::1', '2024-06-21 02:17:06', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1567, '::1', '2024-06-21 02:17:07', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1568, '::1', '2024-06-21 02:17:08', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1569, '::1', '2024-06-21 02:17:09', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1570, '::1', '2024-06-21 02:17:10', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1571, '::1', '2024-06-21 02:17:15', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1572, '::1', '2024-06-21 02:18:08', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1573, '::1', '2024-06-21 02:18:17', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1574, '::1', '2024-06-21 02:19:53', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1575, '::1', '2024-06-21 02:19:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1576, '::1', '2024-06-21 02:22:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1577, '::1', '2024-06-21 02:22:30', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1578, '::1', '2024-06-21 02:23:57', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1579, '::1', '2024-06-21 02:23:59', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1580, '::1', '2024-06-21 02:24:01', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1581, '::1', '2024-06-21 02:24:06', 'Doa: Pentingnya Menjaga Amanah dalam Islam', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1582, '::1', '2024-06-21 02:24:06', 'Doa: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1583, '::1', '2024-06-21 02:24:06', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1584, '::1', '2024-06-21 02:24:08', 'Doa: Keutamaan Bersabar dalam Menghadapi Ujian Hidup', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1585, '::1', '2024-06-21 02:24:08', 'Doa: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1586, '::1', '2024-06-21 02:24:09', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1587, '::1', '2024-06-21 02:24:09', 'Doa: Keutamaan dan Manfaat Shalat Berjamaah', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1588, '::1', '2024-06-21 02:24:09', 'Doa: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1589, '::1', '2024-06-21 02:24:10', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1590, '::1', '2024-06-21 02:24:11', 'Doa: Keutamaan dan Manfaat Berdoa di Waktu Mustajab', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1591, '::1', '2024-06-21 02:24:11', 'Doa: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1592, '::1', '2024-06-21 02:24:11', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1593, '::1', '2024-06-21 02:24:33', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1594, '::1', '2024-06-21 02:24:41', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1595, '::1', '2024-06-21 02:24:41', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1596, '::1', '2024-06-21 02:24:42', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1597, '::1', '2024-06-21 02:24:42', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1598, '::1', '2024-06-21 02:24:46', 'Doa: Keutamaan dan Manfaat Berdoa di Waktu Mustajab', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1599, '::1', '2024-06-21 02:24:46', 'Doa: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1600, '::1', '2024-06-21 02:24:48', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1601, '::1', '2024-06-21 02:24:50', 'Doa: Keutamaan dan Manfaat Menghafal Al-Quran', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1602, '::1', '2024-06-21 02:24:50', 'Doa: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1603, '::1', '2024-06-21 02:24:51', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1604, '::1', '2024-06-21 02:24:53', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1605, '::1', '2024-06-21 02:24:54', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1606, '::1', '2024-06-21 02:24:59', 'Pencarian: puasa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1607, '::1', '2024-06-21 02:25:04', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1608, '::1', '2024-06-21 02:25:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1609, '::1', '2024-06-21 02:25:55', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1610, '::1', '2024-06-21 02:25:57', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1611, '::1', '2024-06-21 02:25:57', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1612, '::1', '2024-06-21 02:26:00', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1613, '::1', '2024-06-21 02:26:00', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1614, '::1', '2024-06-21 02:26:01', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1615, '::1', '2024-06-21 03:09:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1616, '::1', '2024-06-21 03:09:05', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1617, '::1', '2024-06-21 03:09:33', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1618, '::1', '2024-06-21 03:09:33', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1619, '::1', '2024-06-21 03:11:42', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1620, '::1', '2024-06-21 03:11:42', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1621, '::1', '2024-06-21 03:12:26', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1622, '::1', '2024-06-21 03:12:28', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1623, '::1', '2024-06-21 03:12:28', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1624, '::1', '2024-06-21 03:12:29', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1625, '::1', '2024-06-21 03:12:30', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1626, '::1', '2024-06-21 03:12:39', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1627, '::1', '2024-06-21 03:12:51', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1628, '::1', '2024-06-21 03:13:23', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1629, '::1', '2024-06-21 03:31:52', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1630, '::1', '2024-06-21 03:31:57', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1631, '::1', '2024-06-21 03:31:57', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1632, '::1', '2024-06-21 03:31:58', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1633, '::1', '2024-06-21 07:58:32', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1634, '::1', '2024-06-21 07:59:09', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1635, '::1', '2024-06-21 07:59:11', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1636, '::1', '2024-06-21 07:59:12', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1637, '::1', '2024-06-21 07:59:13', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1638, '::1', '2024-06-21 07:59:13', 'List Doa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1639, '::1', '2024-06-21 07:59:18', 'Pencarian: puasa', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1640, '::1', '2024-06-21 07:59:54', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1641, '::1', '2024-06-21 07:59:54', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1642, '::1', '2024-06-21 08:00:33', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1643, '::1', '2024-06-21 08:00:33', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1644, '::1', '2024-06-21 08:00:34', 'Artikel: Menjaga Lisan dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1645, '::1', '2024-06-21 08:00:34', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1646, '::1', '2024-06-21 08:00:37', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1647, '::1', '2024-06-21 08:00:38', 'Video: Keutamaan Membaca Shalawat Nabi', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1648, '::1', '2024-06-21 08:00:38', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1649, '::1', '2024-06-21 08:00:40', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1650, '::1', '2024-06-21 08:00:42', 'Artikel: Mengajarkan Anak Berpuasa Sejak Dini', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1651, '::1', '2024-06-21 08:00:42', 'Artikel: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1652, '::1', '2024-06-21 08:02:25', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1653, '::1', '2024-06-21 08:03:06', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1654, '::1', '2024-06-21 08:03:06', 'Pedoman Siber', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1655, '::1', '2024-06-21 08:03:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1656, '::1', '2024-06-21 08:03:09', 'About Us', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1657, '::1', '2024-06-21 08:07:22', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1658, '::1', '2024-06-21 08:08:14', 'List Artikel', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1659, '::1', '2024-06-21 08:09:29', 'List Video', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1660, '::1', '2024-06-21 08:09:33', 'Video: Keutamaan Berbakti kepada Orang Tua', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1661, '::1', '2024-06-21 08:09:33', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1662, '::1', '2024-06-21 08:09:43', 'Video: Hikmah Puasa di Bulan Ramadan', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1663, '::1', '2024-06-21 08:09:43', 'Video: ', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996'),
(1664, '::1', '2024-06-21 08:11:25', 'Beranda', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'user_66745e8cca3da2.15065996'),
(1665, '::1', '2024-06-21 08:11:36', 'List Artikel', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'user_66745e8cca3da2.15065996'),
(1666, '::1', '2024-06-21 08:11:48', 'Artikel: Menjaga Lisan dalam Kehidupan Sehari-hari', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'user_66745e8cca3da2.15065996'),
(1667, '::1', '2024-06-21 08:11:49', 'Artikel: ', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'user_66745e8cca3da2.15065996'),
(1668, '::1', '2024-06-21 08:11:56', 'List Video', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'user_66745e8cca3da2.15065996'),
(1669, '::1', '2024-06-21 08:11:58', 'Video: Keutamaan Berbakti kepada Orang Tua', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'user_66745e8cca3da2.15065996'),
(1670, '::1', '2024-06-21 08:11:59', 'Video: ', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'user_66745e8cca3da2.15065996'),
(1671, '::1', '2024-06-21 08:21:05', 'Beranda', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'user_66745e8cca3da2.15065996');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indeks untuk tabel `tb_artikel`
--
ALTER TABLE `tb_artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_doa`
--
ALTER TABLE `tb_doa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_hit`
--
ALTER TABLE `tb_hit`
  ADD PRIMARY KEY (`id_hit`),
  ADD KEY `id_related` (`id_related`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tb_video`
--
ALTER TABLE `tb_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `tb_visitors`
--
ALTER TABLE `tb_visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `tb_artikel`
--
ALTER TABLE `tb_artikel`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `tb_doa`
--
ALTER TABLE `tb_doa`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_hit`
--
ALTER TABLE `tb_hit`
  MODIFY `id_hit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2740;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_video`
--
ALTER TABLE `tb_video`
  MODIFY `id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_visitors`
--
ALTER TABLE `tb_visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1672;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `admin_role` (`id`);

--
-- Ketidakleluasaan untuk tabel `tb_artikel`
--
ALTER TABLE `tb_artikel`
  ADD CONSTRAINT `tb_artikel_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `tb_doa`
--
ALTER TABLE `tb_doa`
  ADD CONSTRAINT `tb_doa_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `tb_video`
--
ALTER TABLE `tb_video`
  ADD CONSTRAINT `tb_video_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
