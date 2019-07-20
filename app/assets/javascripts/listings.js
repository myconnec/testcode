$( document ).ready(function() {

  window.URL = window.URL || window.webkitURL;

  var getSubcategories = function(category_id){
    var $subcategories = $('#listing_subcategory_id');
  
    if (isNaN(parseInt(category_id))) {
      $subcategories.empty();
      return;
    }
  
    $.get('/subcategories/find_by_category', { category_id: category_id }, function(data){
      $subcategories.empty();
      $subcategories.append('<option value=""></option>')
      $.each(data.subcategories, function(index, subcategory) {
        var option = $('<option />');
        option.attr('value', subcategory.id);
        option.text(subcategory.name);
        $subcategories.append(option);
      })
    })
  }
  
  var myVideos = [];

  // get the media  runtime and display to the user.
  $('#listing_media').on('change', function (){
    files = this.files;
    myVideos.push(files[0]);
    var video = document.createElement('video');
    video.preload = 'metadata';

    video.onloadedmetadata = function() {
      var duration = video.duration;
      myVideos[myVideos.length - 1].duration = duration;
      var infos = document.getElementById('listing_media_info');
      infos.textContent = "";
      for (var i = 0; i < myVideos.length; i++) {
        var minutes = Math.floor(myVideos[i].duration / 60); // 7
        var seconds = Math.floor(myVideos[i].duration % 60); // 30
        infos.textContent += "Run time: " + minutes + ' min. and ' + seconds +  ' secs.\n';
      }
    }

    video.src = URL.createObjectURL(files[0]);
  })

  // on change of Category DDL, trigger Sub-category population
  $('#listing_category_id').on('change', function(){
    getSubcategories($('#listing_category_id').val());
  });
  
  // remove element on any change of the category DDL
  $('#listing_category_id, #listing_subcategory_id').on('change', function(){
    $('#listing_price').val('').attr('disabled', false);
    $('#payment_form').addClass('hidden');
  
    // community category posts do not cost anything, set price to 0.00 and disable the field
    if ($('#listing_category_id').val() == '2') {
      $('#listing_price').val('0.00').attr('disabled', true);
    }
  })
  
  $('#listing_subcategory_id').on('change', function(){
    // if 'community' category is selected, no payment required.
    if ($('#listing_category_id').val() == '2') {
      return true;
    }

    if ($('#listing_subcategory_id').val() > 10) {
      $('#payment_form').removeClass('hidden');
    }

    if ($('#listing_subcategory_id').val() > 10) {
      $('#payment_form').removeClass('hidden');
    }
  });

  // $('#new_listing').on('submit', function (event){
  //   event.preventDefault()
  //   console.log('Show loading spinner...')
  //   // $("#overlay").toggle()
  // });

  $('#new_listing').find("input:file").each(function(i, elem) {
    var fileInput = $(elem);
    var form = $(fileInput.parents('form:first'));

    fileInput.fileupload({
        fileInput: fileInput,
        url: form.data('url'),
        type: 'POST',
        autoUpload: true,
        formData: form.data('form-data'),
        paramName: 'file',
        dataType: 'XML',
        // replaceFileInput: false,
      });
  });
});
