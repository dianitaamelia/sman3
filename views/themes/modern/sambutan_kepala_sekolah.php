        <!-- Blog Start -->
        <div class="container-fluid team py-5">
            <div class="container py-5">
                <div class="section-title mb-5 wow fadeInUp" data-wow-delay="0.1s">
                    <h1 class="display-3 mb-4"><?=$title;?></h1>
                    <!-- <p class="mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat deleniti amet at
                        atque sequi quibusdam cumque itaque repudiandae temporibus, eius nam mollitia voluptas maxime
                        veniam necessitatibus saepe in ab? Repellat!</p> -->
                </div>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-12 col-lg-10 col-xl-8 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="card border-primary border-1 shadow-sm rounded-3 overflow-hidden text-center">
                            <?php if ($kepsek['photo'] != '' && file_exists('./assets/ptk/' . $kepsek['photo'])) { ?>
                            <div class="ratio ratio-1x1 mx-auto mt-3" style="max-width: 200px;">
                                <img src="<?= base_url('assets/ptk/' . $kepsek['photo']); ?>"
                                    alt="Sambutan Kepala Sekolah"
                                    class="img-fluid rounded-3 border border-2 border-primary object-fit-cover"
                                    style="width: 200px; height: 200px; object-fit: cover;">
                            </div>
                            <?php } ?>
                            <div class="card-body p-4">
                                <h4 class="card-title mb-3 fw-bold"><?= $kepsek['nama']; ?></h4>
                                <hr class="border-primary opacity-75">
                                <div class="card-text post-content text-start">
                                    <?= $this->setting['sambutan_kepala_sekolah']; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Blog End -->