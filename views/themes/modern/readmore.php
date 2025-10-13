        <!-- Blog Start -->
        <div class="container-fluid team py-5">
            <div class="container py-5">
                <div class="section-title mb-5 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="sub-style">
                        <h4 class="sub-title px-3 mb-0"><?=$title;?></h4>
                    </div>
                    <h1 class="display-3 mb-4"><?=$query['post_title'];?></h1>
                    <!-- <p class="mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat deleniti amet at
                        atque sequi quibusdam cumque itaque repudiandae temporibus, eius nam mollitia voluptas maxime
                        veniam necessitatibus saepe in ab? Repellat!</p> -->
                </div>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-12 col-lg-12 col-xl-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="card border-primary border-1 shadow-sm rounded-3 overflow-hidden">
                            <?php if ($query['post_image'] != NULL && file_exists('assets/post/' . $query['post_image'])) {?>
                            <img src="<?=base_url('assets/post/' . $query['post_image']);?>"
                                alt="<?=$query['post_title'];?>" />
                            <?php } ?>
                            <div class="card-body p-4">
                                <div
                                    class="d-flex flex-wrap justify-content-between align-items-center mb-3 small text-muted">
                                    <span><i
                                            class="fa fa-calendar-alt text-primary me-1"></i><?=indo_date($query['post_date']);?></span>
                                    <span><i
                                            class="fa fa-user text-primary me-1"></i><?=$query['display_name'];?></span>
                                    <span><i class="fa fa-eye text-primary me-1"></i><?=$query['counter'];?></span>
                                </div>
                                <div class="card-text post-content">
                                    <?= $query['post_content']; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog End -->