// init Masonry
var $grid = $('.grid').masonry({
    itemSelector: '.grid-item',
    isFitWidth: '.grid-item'
});

$(document).on('ready', function() {
    console.log('DOM ready')
    // layout Masonry after each image loads
    $grid.imagesLoaded().progress( function() {
        console.log('progress!')
        $grid.masonry();
    });
});
