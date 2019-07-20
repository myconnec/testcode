$( document ).ready(function() {
  $('#new_listing').find("input:file").each(function(i, elem) {
    var fileInput = $(elem);
    var form = $(fileInput.parents('form:first'));

    fileInput.fileupload({
        autoUpload: true,
        dataType: 'XML',
        fileInput: fileInput,
        formData: form.data('form-data'),
        paramName: 'file',
        replaceFileInput: true,
        type: 'POST',
        url: form.data('url'),
      });
  });
});
