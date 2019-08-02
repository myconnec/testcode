/* Since CH uses turbolinks, as per Rails 4, this is the correct way to trigger DOM ready events.*/
$(document).on('ready turbolinks:load', function() {
    $('.grid').imagesLoaded( function() {
        $('.grid').masonry({
            itemSelector: '.pin-item',
            isFitWidth: '.pin-item'
        });   
    });
});