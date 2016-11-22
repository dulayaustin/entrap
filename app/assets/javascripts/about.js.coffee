$ ->
  # https://github.com/turbolinks/turbolinks/issues/9
  $(document).on "turbolinks:load", ->
    $('[data-provider="summernote"]').each ->
      $(this).summernote()