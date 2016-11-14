$ ->
  $(document).on "click", "#product_category_category", (e) ->
    e.preventDefault()
    $( "#product_sub_category_id" ).prop( "disabled", false )

  $(document).on "click", ".parent", (e) ->
    e.preventDefault()
    $(".parent").not(this).removeClass("active")
    $(this).addClass("active")    
    id = $(this).find("a").attr("id")
    $(".child").hide()
    
    if $(".parent").hasClass("active")           
      $(".child[data-category-id='#{id}']").show()
      
    
