$ ->
  $(document).on "click", "#product_category_category", (e) ->
    e.preventDefault()
    $( "#product_sub_category_id" ).prop( "disabled", false )

  $(document).on "click", ".parent", (e) ->
    e.preventDefault()
    $(this).toggleClass("active")    
    id = $(this).attr("id")

    if $(this).hasClass("active")
      $('.child[data-category-id="' + id + '"]').slideDown()
    else
      $('.child[data-category-id="' + id + '"]').slideUp()