$ ->
  $(document).on "click", "#product_category_category", (e) ->
    e.preventDefault()
    $( "#product_sub_category_id" ).prop( "disabled", false )

  $(document).on "click", ".category", (e) ->
    e.preventDefault()
    $(this).parent().siblings().removeClass("active")
    $(this).parent().addClass("active")    
    id = $(this).attr("id")
    $(".child").hide()
    
    if $(".parent").hasClass("active")           
      $(".child[data-category-id='#{id}']").show()
      
    
