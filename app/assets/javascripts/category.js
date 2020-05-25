$(document).on('ready', function() {
    // init Masonry
    var $grid = $('.grid').masonry({
        itemSelector: '.pin-item',
        isFitWidth: '.pin-item'
    });

    // layout Masonry after each image loads
    $grid.imagesLoaded().progress( function() {
        $grid.masonry('layout');
    });
});
