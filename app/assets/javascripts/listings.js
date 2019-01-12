var getSubcategories = function(category_id){
  var $subcategories = $('#listing_subcategory_id');
  
  $.get('/subcategories/find_by_category', { category_id: category_id }, function(data){
    $subcategories.empty();
    $.each(data.subcategories, function(index, subcategory){
      var option = $('<option />');
      option.attr('value', subcategory.id);
      option.text(subcategory.name);
      $subcategories.append(option)
    });   
  })
};

// on change of Category DDL, trigger Sub-category population
$('#listing_category_id').on('change', function(){
  getSubcategories($('#listing_category_id').val());
});

$(document).ready(function(){
 // get list for initiallty  selected Category item
 getSubcategories(1);
});
