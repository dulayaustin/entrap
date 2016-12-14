$ ->
  $(document).on "turbolinks:load", ->
    $(".images li:first").addClass("active")

    $('#star-rating').raty
      path: '/assets'
      score: 4
      scoreName: 'review[rating]'

    $('.star-rating').raty
      path: '/assets/'
      readOnly: true
      starOn: 'red-star-on.png'
      starOff: 'red-star-off.png'
      score: ->
        $(this).attr 'data-score'


  $(document).on "click", ".category", (e) ->
    e.preventDefault()
    $(this).parent().siblings().removeClass("active")
    $(".child").children().removeClass("active")
    $(this).parent().addClass("active")    
    id = $(this).attr("id")    
    $(".category").not(this).siblings(".child").slideUp()
    
    if $(".parent").hasClass("active")           
      $(".child[data-category-id='#{id}']").slideDown()


  $(document).on "click", "#sub-category", (e) ->
    e.preventDefault()
    $(this).parent().siblings().removeClass("active")
    $(this).parent().addClass("active")


  $(document).on "click", ".product-image", (e) ->
    e.preventDefault()
    $(".images li").removeClass("active")
    $(this).parent().addClass("active")
    src = $(this).children().attr("src")
    src = src.split("/")
    index = src.indexOf("small")
    src[index] = "large"
    src_large = src.join("/")
    
    $(".main-product-image img").attr("src", src_large)


  $(document).on "change", "#product_category_category", (e) ->
    e.preventDefault()
    $("#product_sub_category_id").prop("disabled", false)
    $.ajax
      type: "GET"
      url: "/products/new"
      dataType: "script"
      data:
        category_id: $(this).val()


  $(document).on "change", "#product_sub_category_id", (e) ->
    e.preventDefault()
    $.ajax
      type: "GET"
      url: "/products/new"
      dataType: "script"
      data:
        sub_category_id: $(this).val()
    


    
