// init Masonry
var $grid = $('.grid').masonry({
    itemSelector: '.grid-item',
    isFitWidth: '.grid-item'
});

$(document).on('ready', function() {
    console.log('masonry DOM ready...')

    // layout Masonry after each image loads
    $grid.imagesLoaded().progress( function() {
        console.log('masonry progress...')
        $grid.masonry();
    });
});
