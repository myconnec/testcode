var getSubcategories = function(category_id){
  var $subcategories = $('#listing_subcategory_id');

  if (isNaN(parseInt(category_id))) {
    $subcategories.empty();
    return;
  }

  $.get('/subcategories/find_by_category', { category_id: category_id }, function(data){
    $subcategories.empty();
    $subcategories.append('<option value=""></option>')
    $.each(data.subcategories, function(index, subcategory){
      var option = $('<option />');
      option.attr('data-chargable', subcategory.chargable);
      option.attr('value', subcategory.id);
      option.text(subcategory.name);
      $subcategories.append(option);
    });
  })
};

$('#listing_category_id').on('change', function(){
  // on change of Category DDL, trigger Sub-category population
  getSubcategories($('#listing_category_id').val());
});

$('#listing_category_id, #listing_subcategory_id').on('change', function(){
  if ($('#listing_category_id').val() == '2' || $('#listing_category_id').val() == '5') {
    // if 'community'  or 'free' category is selected, no payment required.
    console.log('free subcategories')
    $('#listing_price').val('0.00').attr('disabled', true);
    $('#payment_form').addClass('hidden');
  } else if ($('#listing_subcategory_id > option').data( 'chargable' ) == true) {
    // if the sub-catagory has the data-chargable attribute
    console.log('paid subcategories')
    $('#listing_price').attr('disabled', false);
    $('#payment_form').removeClass('hidden');
  } else {
    // resets for `normal` subcategories
    console.log('normal subcategories')
    $('#listing_price').val('').attr('disabled', false);
    $('#payment_form').addClass('hidden');
  }
});

$(document).ready(function() {
  $("#listings_submit").on('click', function() {
        $("#overlay").toggle();
  });
});


