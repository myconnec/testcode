$(document).ready(function(){
    $('.grid').imagesLoaded( function() {
       $('.grid').masonry({
           itemSelector: '.pin-item',
           isFitWidth: '.pin-item'
       });   
    });
 });