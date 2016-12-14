module ProductsHelper
  def price_with_unit(amount)
    number_to_currency(amount, unit: "₱")
  end

  def stock_status(quantity)
    if quantity == 0
      status = "Out of Stock"
    else
      status = "In-Stock"
    end
    status
  end

  def average_rating(reviews)
    if reviews.blank?
      average_rating = 0
    else
      average_rating = reviews.average(:rating).round(2).to_i
    end
  end
end
