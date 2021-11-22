var formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 2
})

var getSubcategories = function (category_id) {
    var $subcategories = $('#listing_subcategory_id');

    if (isNaN(parseInt(category_id))) {
        $subcategories.empty();
        return;
    }

    $.get('/subcategories/find_by_category', { category_id: category_id }, function (data) {
        $subcategories.empty();
        $subcategories.append('<option value=""></option>')
        $.each(data.subcategories, function (index, subcategory) {
            var option = $('<option />');
            option.attr('value', subcategory.id);
            option.text(subcategory.name);
            option.attr('data-chargable', subcategory.chargable);
            $subcategories.append(option);
        })
    })
}

var select_sub_category = function () {
    listing_id = window.location.pathname.split('/')[2]
    $.get('/listings/show_json/' + listing_id, function (data) {
        $('#listing_subcategory_id > option:nth-child(2)').attr('selected', true);
    })
}

$(document).on('ready', function () {
    // if (location.host == 'dev.connechub.com') {
    //     $('select#listing_category_id>option:eq(1)').attr('selected', true);
    //     $('#listing_price').val('10');
    //     $('#listing_condition_id').val('3');
    //     $('#listing_title').val('Test Title ' + Date.now());
    //     $('#listing_city').val('Tampa');
    //     $('#listing_state').val('FL');
    //     $('#listing_zipcode').val('33612');
    //     $('#listing_description').val('Test Description ' + Date.now());
    //     $('span.CardField-number.CardField-child > span:nth-child(2) > span > input').val('4242424242424242');
    //     $('span.CardField-expiry.CardField-child > span > span > input').val('1234');
    //     $('span.CardField-cvc.CardField-child > span > span > input').val('567');
    //     $('span.CardField-postalCode.CardField-child > span > span > input').val('89012');
    // }

    getSubcategories($('#listing_category_id').val());

    // on change of Category DDL, trigger Sub-category population
    $('#listing_category_id').on('change', function () {
        getSubcategories($('#listing_category_id').val());

        // if not a free category and not a fee sub category, return to default state
        $('#listing_price').attr('disabled', false);
        $('#sub_category_cost_container').css("display", "none");
    });

    $('#listing_subcategory_id').on('change', function () {

        if ($('#listing_subcategory_id :selected').data('chargable') != '0') {
            // if sub category has a chargable amount != 0, show message
            $('#listing_price').attr('disabled', false);
            $('#sub_category_cost_container').css("display", "block");

            // display fee that will be required
            $('#fee_amount').text(formatter.format($('#listing_subcategory_id :selected').data('chargable') / 100) + ' USD ')
            return
        }
    });
});
