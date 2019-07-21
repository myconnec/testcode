$( document ).ready(function() {
  // $('select#listing_category_id>option:eq(1)').attr('selected', true);
  $('#listing_price').val('1.23');
  $('#listing_title').val('Test Title');
  $('#listing_city').val('Tampa');
  $('#listing_state').val('FL');
  $('#listing_zipcode').val('33612');
  $('#listing_description').val('Test Description');        

  $('span.CardField-number.CardField-child > span:nth-child(2) > span > input').val('4242424242424242');
  $('span.CardField-expiry.CardField-child > span > span > input').val('1234');
  $('span.CardField-cvc.CardField-child > span > span > input').val('567');
  $('span.CardField-postalCode.CardField-child > span > span > input').val('89012');

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
    $('#listing_price').attr('disabled', false);
  
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
  });

  $('#new_listing').on('submit', function (event){
    console.log('Show loading spinner...')
    $("#overlay").toggle()
  });
});