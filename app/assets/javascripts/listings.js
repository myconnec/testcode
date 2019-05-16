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
$('#listing_category_id, #listing_category_id').on('change', function(){
  console.log('changed0');
  $('#payment_form').addClass('hidden');
})

$('#listing_subcategory_id').on('change', function(){
  if ($('#listing_subcategory_id').val() > 10) {
    console.log('toggle1');
    $('#payment_form').removeClass('hidden');
  }

  if ($('#listing_subcategory_id').val() > 10) {
    console.log('toggle1');
    $('#payment_form').removeClass('hidden');
  }
});
