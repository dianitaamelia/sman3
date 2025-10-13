<div class="container-fluid about py-5">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-lg-3 wow fadeInLeft" data-wow-delay="0.2s">
                <div class="about-img pb-5 ps-5">
                    <img src="<?=base_url('assets/ptk/'.$kepsek['photo']);?>" class="img-fluid rounded w-100"
                        style="object-fit: cover;" alt="Image">
                    <div class="about-experience">KEPALA SEKOLAH</div>
                </div>
            </div>
            <div class="col-lg-9 wow fadeInRight" data-wow-delay="0.4s">
                <div class="section-title text-start mb-5">
                    <h4 class="sub-title pe-3 mb-0">
                        <?=$menu['sambutan_kepala_sekolah'] == '' ? 'Sambutan Kepala Sekolah' : $menu['sambutan_kepala_sekolah'];?>
                    </h4>
                    <?php if ($this->uri->segment(2) != 'sambutan_kepala_sekolah') : ?>
                    <p class="mb-4 text-justify">
                        <?= strip_tags(substr($this->setting['sambutan_kepala_sekolah'], 0, 600)); ?>...
                    </p>
                    <div class="mt-3">
                        <a class="btn btn-outline-primary btn-sm rounded-pill"
                            href="<?= site_url('home/sambutan_kepala_sekolah'); ?>">
                            Selengkapnya <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                    <?php else: ?>
                    <p class="text-justify">
                        <?= $this->setting['sambutan_kepala_sekolah']; ?>
                    </p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid testimonial py-5 wow zoomInDown" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="section-title mb-5">
            <h1 class="text-white mb-4">Video Profil SMA Negeri 3 Surabaya</h1>
        </div>
        <div class="ratio ratio-16x9">
            <iframe width="500" height="281" src="https://www.youtube.com/embed/iLr013kkzVg?si=TXCTGNQM1FS6rOET"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
    </div>
</div>

<div class="container-fluid blog py-5 bg-warning">
    <div class="container py-5">
        <div class="section-title mb-5 wow fadeInUp" data-wow-delay="0.1s">
            <h1 class="display-3 mb-4 text-white text-shadow-lg">Berita Terkini</h1>
            <p class="mb-0 text-white text-shadow">Bagian khusus yang menyajikan informasi terbaru mengenai SMA Negeri 3
                Surabaya
                yang
                mencakup segala kegiatan, pengumuman, dan prestasi agar siswa, guru, orang tua, serta masyarakat
                selalu mendapatkan update terbaru secara cepat dan mudah.</p>
        </div>
        <div class="row g-4 justify-content-center">
            <?php foreach ($more_post_3_only->result() as $more) { ?>
            <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                <div class="blog-item rounded d-flex flex-column h-100 shadow-sm">
                    <!-- Gambar -->
                    <div class="blog-img">
                        <?php if ($more->post_image != NULL && file_exists('assets/post/thumb/' . $more->post_image)) { ?>
                        <img src="<?=base_url('assets/post/thumb/' . $more->post_image);?>"
                            alt="<?=$more->post_title;?>" class="img-fluid w-100"
                            style="object-fit: cover; height: 220px; border-top-left-radius: .5rem; border-top-right-radius: .5rem;">
                        <?php } else { ?>
                        <img src="<?=base_url('assets/70x70.gif');?>" alt="<?=$more->post_title;?>"
                            class="img-fluid w-100"
                            style="object-fit: cover; height: 220px; border-top-left-radius: .5rem; border-top-right-radius: .5rem;">
                        <?php } ?>
                    </div>

                    <!-- Konten -->
                    <div class="blog-content p-4 d-flex flex-column flex-grow-1">
                        <div class="d-flex justify-content-between mb-3 small text-muted">
                            <span><i class="fa fa-calendar-alt text-primary"></i>
                                <?=indo_date($more->post_date);?></span>
                            <span><i class="fa fa-comments text-primary"></i> 3 Comments</span>
                        </div>

                        <!-- Judul -->
                        <a href="<?=site_url('home/readmore/' . $more->post_id . '/' . $more->slug);?>"
                            class="h5 text-dark text-decoration-none d-block blog-title text-truncate"
                            title="<?=$more->post_title;?>">
                            <?=$more->post_title;?>
                        </a>

                        <!-- Isi -->
                        <p class="my-3 flex-grow-1 blog-excerpt">
                            <?=substr(strip_tags($more->post_content), 0, 150);?>...
                        </p>

                        <!-- Tombol -->
                        <div class="mt-auto">
                            <a href="<?=site_url('home/readmore/' . $more->post_id . '/' . $more->slug);?>"
                                class="btn btn-primary rounded-pill text-white py-2 px-4 w-100">
                                Selengkapnya
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>

<!-- Services Start -->
<div class="container-fluid service py-5 bg-light">
    <div class="container py-5">
        <div class="section-title mb-5 wow fadeInUp" data-wow-delay="0.2s">
            <h1 class="display-3 mb-4">Prestasi</h1>
            <p class="mb-0">Bagian Prestasi menampilkan berbagai pencapaian siswa, guru, maupun sekolah dalam bidang
                akademik maupun non-akademik sebagai wujud kebanggaan sekaligus motivasi bagi seluruh warga SMA
                Negeri 3 Surabaya untuk terus berprestasi.</p>
        </div>
        <div class="row g-4 justify-content-center">
            <?php foreach ($prestasi_home->result() as $prestasi): ?>
            <div class="col-md-6 col-lg-4 col-xl-3 wow fadeInUp" data-wow-delay="0.1s">
                <div class="service-item rounded d-flex flex-column h-100">
                    <div class="service-img rounded-top">
                        <?php if (!empty($prestasi->post_image) && file_exists('assets/post/thumb/' . $prestasi->post_image)): ?>
                        <img src="<?= base_url('assets/post/thumb/' . $prestasi->post_image); ?>"
                            alt="<?= $prestasi->post_title; ?>" class="card-img-top"
                            style="img-fluid rounded-top w-100">
                        <?php else: ?>
                        <img src="<?= base_url('assets/190x190.gif'); ?>" alt="No Image" class="img-fluid w-100"
                            style="object-fit: cover; height: 200px;">
                        <?php endif; ?>
                    </div>
                    <div class="service-content rounded-bottom bg-light p-4 flex-grow-1">
                        <div class="service-content-inner d-flex flex-column flex-grow-1">
                            <h5 class="mb-4"><?= $prestasi->post_title; ?></h5>
                            <p class="mb-4 prestasi-excerpt">
                                <?= substr(strip_tags($prestasi->post_content), 0, 120); ?>...</p>
                            <button type="button" class="btn btn-primary rounded-pill text-white py-2 px-4 mb-2"
                                data-bs-toggle="modal" data-bs-target="#modalPrestasi<?= $prestasi->post_id; ?>">
                                Lihat Detail
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Detail -->
            <div class="modal fade" id="modalPrestasi<?= $prestasi->post_id; ?>" tabindex="-1"
                aria-labelledby="modalLabel<?= $prestasi->post_id; ?>" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                    <div class="modal-content border-primary border-2 shadow-lg rounded-4">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title mb-0 text-white">Prestasi</h5>
                        </div>
                        <div class="modal-body p-4">
                            <h5 class="fw-bold text-primary mb-4" id="modalLabel<?= $prestasi->post_id; ?>">
                                <?= $prestasi->post_title; ?>
                            </h5>
                            <div class="row align-items-start">
                                <?php if ($prestasi->post_image != NULL && file_exists('./assets/post/thumb/' . $prestasi->post_image)) {?>
                                <div class="col-md-4 mb-3 text-center">
                                    <img src="<?= base_url('assets/post/thumb/' . $prestasi->post_image); ?>"
                                        class="img-fluid rounded-3 border shadow-sm"
                                        alt="<?= $prestasi->post_title; ?>">
                                </div>
                                <?php } else {?>
                                <div class="col-md-4 mb-3 text-center">
                                    <img src="<?= base_url('assets/190x190.gif'); ?>"
                                        class="img-fluid rounded-3 border shadow-sm" alt="No Image">
                                </div>
                                <?php } ?>
                                <div class="col-md-8">
                                    <div class="post-content">
                                        <?= $prestasi->post_content; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary rounded-pill px-4 text-white"
                                data-bs-dismiss="modal">Tutup</button>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>
<!-- Services End -->

<!-- Book Appointment Start -->
<div class="container-fluid appointment py-5">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-lg-12 wow fadeInRight" data-wow-delay="0.4s">
                <div class="appointment-form rounded p-5">
                    <h1 class="display-5 mb-4 text-white">Kritik dan Saran</h1>
                    <form>
                        <div class="row gy-3 gx-4">
                            <div class="col-xl-6">
                                <input type="text" class="form-control py-3 border-primary bg-transparent text-white"
                                    placeholder="Nama">
                            </div>
                            <div class="col-xl-6">
                                <input type="email" class="form-control py-3 border-primary bg-transparent text-white"
                                    placeholder="Email">
                            </div>
                            <div class="col-xl-6">
                                <input type="phone" class="form-control py-3 border-primary bg-transparent"
                                    placeholder="Telepon">
                            </div>
                            <div class="col-xl-6">
                                <select class="form-select py-3 border-primary bg-transparent"
                                    aria-label="Default select example">
                                    <option selected>Jenis Kelamin</option>
                                    <option value="1">Laki</option>
                                    <option value="2">Perempuan</option>
                                </select>
                            </div>
                            <div class="col-xl-6">
                                <input type="date" class="form-control py-3 border-primary bg-transparent">
                            </div>
                            <div class="col-xl-6">
                                <select class="form-select py-3 border-primary bg-transparent"
                                    aria-label="Default select example">
                                    <option selected>Department</option>
                                    <option value="1">Physiotherapy</option>
                                    <option value="2">Physical Helth</option>
                                    <option value="2">Treatments</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <button type="button" class="btn btn-primary text-white w-100 py-3 px-5">Kirim</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>