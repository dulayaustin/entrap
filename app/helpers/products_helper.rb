module ProductsHelper
  def price_with_unit(amount)
    number_to_currency(amount, unit: "₱")
  end

end
