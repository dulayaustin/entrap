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
end
