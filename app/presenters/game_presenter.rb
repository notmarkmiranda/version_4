class GamePresenter < BasePresenter
  def formatted_date
    date.strftime("%B %e, %Y")
  end

  def formatted_money
    h.number_to_currency(buy_in)
  end
end
