$ ->
  $(document).on "click", ".category", (e) ->
    e.preventDefault()
    $(this).parent().siblings().removeClass("active")
    $(this).parent().addClass("active")    
    id = $(this).attr("id")
    $(".child").hide()
    
    if $(".parent").hasClass("active")           
      $(".child[data-category-id='#{id}']").show()
  

  $(document).on "change", "#product_category_category", (e) ->
    e.preventDefault()
    $("#product_sub_category_id").prop("disabled", false)
    $("#product_sub_category_id option").wrap('<span/>')
    val = $(this).val()
    
    if val == "1"
      sub_val = [3, 2, 1]        
      $.each sub_val, (index, value) ->
        $("#product_sub_category_id option[value='#{value}']").unwrap('<span/>')
    else if val == "2"
      sub_val = [5, 4]        
      $.each sub_val, (index, value) ->
        $("#product_sub_category_id option[value='#{value}']").unwrap('<span/>')
    else if val == "3"
      sub_val = [7, 6]        
      $.each sub_val, (index, value) ->
        $("#product_sub_category_id option[value='#{value}']").unwrap('<span/>')
    else if val == "4"
      sub_val = [9, 8]        
      $.each sub_val, (index, value) ->
        $("#product_sub_category_id option[value='#{value}']").unwrap('<span/>')
    else
      return
      

    
