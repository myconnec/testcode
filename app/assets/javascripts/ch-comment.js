/* Disable the submit button until the comment_body has a value. */
$(document).on('ready', function () {
    /* Disable submit btn by default. */
    $('#submit-btn').prop('disabled', true);

    /* When comment_body changes */
    $('#comment_body').keyup(function () {

        /* Disable submit btn by default. */
        $('#submit-btn').prop('disabled', true);

        /* ... check tha value is != '' */
        if ($('#comment_body').val() != '') {
            $('#submit-btn').prop('disabled', false);
        }
    });
});