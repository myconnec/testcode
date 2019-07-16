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
      option.attr('data-chargable', subcategory.chargable);
      option.text(subcategory.name);
      $subcategories.append(option);
    });
  })
};

$(document).ready(function() {
  $('#listing_category_id').on('change', function(){
    // on change of Category DDL, trigger subcategory population
    getSubcategories($('#listing_category_id').val());
  });
  
  $('#listing_category_id').on('change', function(){
    // set elements default state
    $('#listing_price').val('').attr('disabled', false);
    $('#payment_form').addClass('hidden');

    // community and free category posts do not cost anything, set price to 0.00 and disable the field
    if ($(this).val() == '2' || $(this).val() == '5') {
      $('#listing_price').val('0.00').attr('disabled', true);
      $('#payment_form').addClass('hidden');
      return
    }
  })

  $('#listing_subcategory_id').on('change', function(){
    if ($('#listing_subcategory_id > option').data('chargable')) {
      console.log('asdf')
      // when the subcategory is changed AND if the subcategory option has 'chargable' show payment notice
      $('#payment_form').removeClass('hidden');
    }
  })

  $('#listing_subcategory_id').on('change', function(){
    if ($('#listing_subcategory_id > option').data('chargable')) {
      console.log('asdf')
      // when the subcategory is changed AND if the subcategory option has 'chargable' show payment notice
      $('#payment_form').removeClass('hidden');
    }
  })

  $("#listings_submit").on('click', function() {
    // lodaing animation when form is submitted
    $("#overlay").toggle();
  });
});