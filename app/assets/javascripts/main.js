
/*
Theme Name:       Classix - Classified Ads and Listing Template
Author:           UIdeck
Author URI:       http://uideck.com
Text Domain:      UIdeck
Domain Path:      /languages/

JS INDEX
================================================
1. preloader js
2. scroll to top js
3. slick menu js
4. sticky menu js
6. counter js
9. wow js
================================================*/

(function($) {

  var $main_window = $(window);

  /*====================================
  preloader js
  ======================================*/
  $main_window.on("load", function() {
      $("#preloader").fadeOut("slow");
  });

  /*====================================
  scroll to top js
  ======================================*/
  $main_window.on("scroll", function() {
    if ($(this).scrollTop() > 250) {
      $(".back-to-top").fadeIn(200);
    } else {
      $(".back-to-top").fadeOut(200);
    }
  });
  $(".back-to-top").on("click", function() {
    $("html, body").animate(
      {
        scrollTop: 0
      },
      "slow"
    );
    return false;
  });
    
  /*====================================
  slick menu js
  ======================================*/
  var logo_path=$('.mobile-menu').data('logo');
  $('#main-navbar').slicknav({
      appendTo:'.mobile-menu',
      removeClasses:false,
      label:'',
      closedSymbol:'<i class="lni-chevron-right"><i/>',
      openedSymbol:'<i class="lni-chevron-right"><i/>',
      brand:'<a href="/"><img src="'+logo_path+'" class="img-responsive" alt="Connechub"></a>'
  });

  /*====================================
  sticky menu js
  ======================================*/
  $main_window.on('scroll', function () {  
    var scroll = $(window).scrollTop();
    if (scroll >= 10) {
        $(".scrolling-navbar").addClass("top-nav-collapse");
    } else {
        $(".scrolling-navbar").removeClass("top-nav-collapse");
    }
  });

  /*=======================================
  counter
  ======================================= */
  if ($(".counter").length > 0) {
    $(".counterUp").counterUp({
      delay: 10,
      time: 2000
    });
  }

})(jQuery);
