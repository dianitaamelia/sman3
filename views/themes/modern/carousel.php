<!-- Carousel Start -->
<div class="header-carousel owl-carousel">
    <?php if ($silder->num_rows() > 0) { ?>
    <?php foreach ($silder->result() as $slide) { ?>
    <div class="header-carousel-item">
        <?php if ($slide->post_image != NULL && file_exists('assets/post/' . $slide->post_image)) {?>
        <img src="<?=base_url('assets/post/' . $slide->post_image);?>" class="img-fluid w-100"
            alt="<?=$slide->post_title;?>" />
        <?php } else {?>
        <img src="<?=base_url('assets/430x430.gif');?>" class="img-fluid w-100" alt="<?=$slide->post_title;?>" />
        <?php } ?>
        <div class="carousel-caption">
            <div class="carousel-caption-content p-3">
                <h5 class="text-white text-uppercase fw-bold mb-4"
                    href="<?=site_url('home/readmore/' . $slide->post_id . '/' . $slide->slug);?>"
                    style="letter-spacing: 3px;">SMAN 3 Surabaya
                </h5>
                <h1 class="display-1 text-capitalize text-white mb-4"><?=$slide->post_title;?></h1>
                <p class="mb-5 fs-6"><?=substr(strip_tags($slide->post_content), 0, 350);?>...
                </p>
            </div>
        </div>
    </div>
    <?php } ?>
    <?php } ?>
</div>
<!-- Carousel End -->