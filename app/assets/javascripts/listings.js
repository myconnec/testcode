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
      option.attr('value', subcategory.id);
      option.text(subcategory.name);
      $subcategories.append(option);
    });
  })
};

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

$(document).ready(function() {
  $("#listings_submit").on('click', function() {
        console.log('Show loading spinner...')
        $("#overlay").toggle();
  });
});