$( document ).ready(function() {
  // Upload directly to S3
  $('#new_listing, #listings_submit').on('submit', function (event){
    console.log('Show loading spinner...')
    event.preventDefault()
    // $("#overlay").toggle()
    return false
  });

  var myVideos = [];

  window.URL = window.URL || window.webkitURL;

  $('#listing_media').on('change', function (){
    files = this.files;
    myVideos.push(files[0]);
    var video = document.createElement('video');
    video.preload = 'metadata';

    video.onloadedmetadata = function() {
      window.URL.revokeObjectURL(video.src);
      var duration = video.duration;
      myVideos[myVideos.length - 1].duration = duration;
      updateInfos();
    }

    video.src = URL.createObjectURL(files[0]);;    
  })

  function updateInfos() {
    var infos = document.getElementById('listing_media_info');
    infos.textContent = "";
    for (var i = 0; i < myVideos.length; i++) {
      // infos.textContent += myVideos[i].name + " duration: " + myVideos[i].duration + '\n';
      var minutes = Math.floor(myVideos[i].duration / 60); // 7
      var seconds = Math.floor(myVideos[i].duration % 60); // 30
      infos.textContent += "Run time: " + minutes + ' min. and ' + seconds +  ' secs.\n';
    }
  }

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

  $('.directUpload').find("input:file").each(function(i, elem) {
    var fileInput    = $(elem);
    var form         = $(fileInput.parents('form:first'));
    var submitButton = form.find('input[type="submit"]');
    var progressBar  = $("<div class='bar'></div>");
    var barContainer = $("<div class='progress'></div>").append(progressBar);
    fileInput.after(barContainer);
    fileInput.fileupload({
        fileInput:  fileInput,
        url:  form.data('url'),
        type: 'POST',
        autoUpload: true,
        formData: form.data('form-data'),
        paramName:  'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
        dataType: 'XML',  // S3 returns XML if success_action_status is set to 201
        replaceFileInput: false,
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            progressBar.css('width', progress + '%')
        },
        start: function (e) {
            submitButton.prop('disabled', true);
            progressBar.
              css('background', 'green').
              css('display', 'block').
              css('width', '0%').
              text("Loading...");
        },
        done: function(e, data) {
            submitButton.prop('disabled', false);
            progressBar.text("Uploading done");

            // extract key and generate URL from response
            var key   = $(data.jqXHR.responseXML).find("Key").text();
            var url   = '//' + form.data('host') + '/' + key;

            // create hidden field
            var input = $("<input />", { type:'input', name: fileInput.attr('name'), value: url })
            form.append(input);
        },
        fail: function(e, data) {
            submitButton.prop('disabled', false);
            progressBar.
              css("background", "red").
              text("Failed");
        }
    });
  });
})
