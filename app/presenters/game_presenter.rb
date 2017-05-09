class GamePresenter < BasePresenter
  def formatted_date
    date.strftime("%B %e, %Y")
  end

  def game_status
    completed ? "Completed" : "Incomplete"
  end

  def placed_player(place)
    player = players.where(finishing_place: place).first
    player ? h.present(player.participant) { |p| p.full_name } : "Unfinished"
  end

  def formatted_money(number)
    h.number_to_currency(number)
  end

  def players_or_attendees
    completed ? player_count : attendees
  end

  def players_formatted
    h.pluralize(players_or_attendees, "player")
  end

end
