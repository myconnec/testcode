const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2
})


$( document ).on('turbolinks:load', function() {
  if (location.host != 'www.connechub.com') {
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
        option.attr('data-chargable', subcategory.chargable);
        $subcategories.append(option);
      })
    })
  }

  // on change of Category DDL, trigger Sub-category population
  $('#listing_category_id').on('change', function(){
    getSubcategories($('#listing_category_id').val());
  });

  $('#listing_subcategory_id').on('change', function(){

    if ($('#listing_category_id').val() == '2' || $('#listing_category_id').val() == '5') {
      // if 'community' or 'free' category is selected, no cost is valid
      $('#listing_price').val('0.00').attr('disabled', true);
      $('#sub_category_cost_container').css("display", "none");
      return;
    }

    if ($('#listing_subcategory_id :selected').data('chargable') != 0) {
      // if sub category has a chargable amount != 0, show message
      $('#listing_price').attr('disabled', false);
      $('#sub_category_cost_container').css("display", "block");

      // display fee that will be required
      $('#fee_amount ').text(formatter.format($('#listing_subcategory_id :selected').data('chargable') / 100) + ' USD ')
      return
    }

    // if not a free category and not a fee sub category, return to default state
    $('#listing_price').attr('disabled', false);
    $('#sub_category_cost_container').css("display", "none");
  });

  $('#new_listing').submit(function() {
    if ($('#listing_category_id').val() == '2' || $('#listing_category_id').val() == '5') {
      $('#listing_price').val('0.00').attr('disabled', false);
      $('#sub_category_cost_container').css("display", "none");
      return;
    }

    return true;
  });

  $('#listings_submit').on('click', function() {
    console.log('Show loading spinner...')
    $("#overlay").toggle()
  });
});