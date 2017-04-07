class GamePresenter < BasePresenter
  def formatted_date
    date.strftime("%B %e, %Y")
  end

  def players_or_attendees
    completed ? player_count : attendees
  end

  def game_status
    completed ? "Completed" : "Unscored"
  end

  def formatted_money(number)
    h.number_to_currency(number)
  end
end
