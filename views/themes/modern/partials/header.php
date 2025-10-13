<style>
/* Dropdown submenu support */
.dropdown-submenu {
    position: relative;
}

.dropdown-submenu .dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: 0;
    margin-left: .1rem;
    display: none;
    position: absolute;
}

.dropdown-submenu:hover .dropdown-menu {
    display: block;
}
</style>

<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SMAN 3 Surabaya</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600&family=Playfair+Display:wght@400;500;600&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<?=base_url('views/themes/modern/assets/lib/animate/animate.min.css" rel="stylesheet');?>">
    <link href="<?=base_url('views/themes/modern/assets/lib/owlcarousel/assets/owl.carousel.min.css');?>"
        rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="<?=base_url('views/themes/modern/assets/css/bootstrap.min.css');?>" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<?=base_url('views/themes/modern/assets/css/style.css');?>" rel="stylesheet">
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-dark px-5 d-none d-lg-block">
        <div class="row gx-0 align-items-center" style="height: 45px;">
            <div class="col-lg-8 text-center text-lg-start mb-lg-0">
                <div class="d-flex flex-wrap">
                    <a href="#" class="text-light me-4"><i class="fas fa-map-marker-alt text-primary me-2"></i>Find A
                        Location</a>
                    <a href="#" class="text-light me-4"><i class="fas fa-phone-alt text-primary me-2"></i>(031)
                        3812356</a>
                    <a href="#" class="text-light me-0"><i
                            class="fas fa-envelope text-primary me-2"></i>sman3sby@sch.co.id</a>
                </div>
            </div>
            <div class="col-lg-4 text-center text-lg-end">
                <div class="d-flex align-items-center justify-content-end">
                    <a href="#" class="btn btn-light btn-square border rounded-circle nav-fill me-3"><i
                            class="fab fa-facebook-f"></i></a>
                    <a href="#" class="btn btn-light btn-square border rounded-circle nav-fill me-3"><i
                            class="fab fa-twitter"></i></a>
                    <a href="#" class="btn btn-light btn-square border rounded-circle nav-fill me-3"><i
                            class="fab fa-instagram"></i></a>
                    <a href="#" class="btn btn-light btn-square border rounded-circle nav-fill me-0"><i
                            class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->

    <!-- Navbar & Hero Start -->
    <div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-light bg-white px-4 px-lg-5 py-3 py-lg-0">
            <a href="<?= site_url(''); ?>" class="navbar-brand p-0">
                <img src="<?=base_url('views/themes/modern/assets/img/logo-1.png" rel="stylesheet');?>" alt="Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <?php 
                        $parent = $this->m_global->get_parent_page();
                        foreach ($parent as $nav) {
                            // Jika punya anak (submenu)
                            if (count($nav['child']) > 0) {
                                echo '<div class="nav-item dropdown">';
                                echo '<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">'
                                        . strtoupper($nav['post_title']) . '</a>';
                                echo '<div class="dropdown-menu m-0">';
                                
                                // Loop submenu anak
                                foreach ($nav['child'] as $child) {
                                    $href = site_url('home/readmore/' . $child['post_id'] . '/' . $child['slug']);
                                    echo '<a href="' . $href . '" class="dropdown-item">'
                                            . ucfirst($child['post_title']) . '</a>';
                                }

                                echo '</div></div>';
                            } 
                            else {
                                $href = site_url('home/readmore/' . $nav['post_id'] . '/' . $nav['slug']);
                                echo '<a href="' . $href . '" class="nav-item nav-link">'
                                        . strtoupper($nav['post_title']) . '</a>';
                            }
                        }
                        ?>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                KEPEGAWAIAN
                            </a>
                            <div class="dropdown-menu m-0">
                                <a href="<?= site_url('home/ptk'); ?>" class="dropdown-item">DIREKTORI GURU</a>
                                <a href="<?= site_url('home/siswa'); ?>" class="dropdown-item">
                                    <?= strtoupper($menu['direktori_siswa'] == '' ? 'Direktori Siswa' : $menu['direktori_siswa']); ?>
                                </a>
                                <a href="<?= site_url('home/alumni'); ?>" class="dropdown-item">
                                    <?= strtoupper($menu['direktori_alumni'] == '' ? 'Direktori Alumni' : $menu['direktori_alumni']); ?>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="navbar-nav ms-auto py-0">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Profil</a>
                        <div class="dropdown-menu m-0">
                            <a href="" class="dropdown-item">Visi Misi</a>
                            <a href="" class="dropdown-item">Struktur Organisasi</a>
                            <a href="" class="dropdown-item">Sejarah</a>
                            <a href="" class="dropdown-item">Logo SMAN 3 SBY</a>
                        </div>
                    </div>
                    <a href="" class="nav-item nav-link">PPBD</a>
                    <a href="" class="nav-item nav-link">Pengumuman</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Kesiswaan</a>
                        <div class="dropdown-menu m-0">
                            <a href="" class="dropdown-item">Tata Tertib</a>
                            <a href="" class="dropdown-item">Extrakulikuler</a>
                            <a href="" class="dropdown-item">Model Seragam</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Kepegawaian</a>
                        <div class="dropdown-menu m-0">
                            <a href="" class="dropdown-item">Guru</a>
                            <a href="" class="dropdown-item">Manajemen</a>
                            <a href="" class="dropdown-item">Tenaga Kependidikan</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Fasilitas</a>
                        <div class="dropdown-menu m-0">
                            <a href="" class="dropdown-item">Denah</a>
                            <a href="" class="dropdown-item">Ruang & Alat</a>
                            <a href="" class="dropdown-item">Bangunan & Alamat</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Alumni</a>
                        <div class="dropdown-menu m-0">
                            <a href="" class="dropdown-item">Data Alumni</a>
                        </div>
                    </div>
                    <a href="" class="nav-item nav-link">Contact</a>
                </div> -->
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- Carousel atau Header Start -->
        <?php if (($this->uri->segment(1) == '' || $this->uri->segment(1) == 'home') && $this->uri->segment(2) == ''): ?>
        <!-- Jika di halaman utama, tampilkan carousel -->
        <?php $this->load->view('themes/modern/carousel'); ?>
        <?php elseif (($this->uri->segment(1) == '' || $this->uri->segment(1) == 'home') && $this->uri->segment(2) == 'sambutan_kepala_sekolah'): ?>
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4 wow fadeInDown" data-wow-delay="0.1s">
                </h3>
                <ol class="breadcrumb justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                    <li class="breadcrumb-item text-white"><?=$title;?></a></li>
                </ol>
            </div>
        </div>
        <?php else: ?>
        <!-- Jika selain home (misalnya readmore, profil, dll), tampilkan header statis -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4 wow fadeInDown" data-wow-delay="0.1s">
                    <?=$query['post_title'];?>
                </h3>
                <ol class="breadcrumb justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                    <li class="breadcrumb-item text-white"><?=$title;?></a></li>
                    <li class="breadcrumb-item active text-primary">
                        <?=$query['post_title'];?>
                    </li>
                </ol>
            </div>
        </div>
        <?php endif; ?>

        <!-- Carousel atau Header End -->


        <!-- Carousel End -->
    </div>
    <!-- Navbar & Hero End -->