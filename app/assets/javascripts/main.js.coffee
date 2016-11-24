$ ->
  $(document).on "turbolinks:load", ->
    $('[data-provider="summernote"]').each ->
      $(this).summernote({minHeight: 200})

    $('[type="file"]').on 'change', (event) ->
      files = event.target.files
      $.each files, (index, value) ->
        reader = new FileReader

        reader.onload = (file) ->
          img = new Image
          img.src = file.target.result
          $('#preview').append(img)
          $('#preview img').addClass("img-responsive")

        reader.readAsDataURL value
