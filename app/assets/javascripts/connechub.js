$(document).ready(function(){
   $('.grid').imagesLoaded( function() {
      $('.grid').masonry({
      // options
          itemSelector: '.pin-item',
          isFitWidth: '.pin-item'
      });   
   });
});