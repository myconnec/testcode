$(document).on('ready', function() {
    // init Masonry
    var $grid = $('.grid').masonry({
        itemSelector: '.grid-item',
        isFitWidth: '.grid-item'
    });

    // layout Masonry after each image loads
    $grid.imagesLoaded().progress( function() {
        $grid.masonry();
    });
});
