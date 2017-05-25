class SeasonPresenter < BasePresenter
  def average_pot_size_formatter
    h.number_to_currency(@model.average_pot_size, precision: 0)
  end

  def games_count_formatter
    h.pluralize(@model.game_count, "game")
  end

  def players_per_game_formatter
    h.number_with_precision(@model.players_per_game, precision: 1)
  end

  def total_pot_size_formatter
    h.number_to_currency(@model.total_pot_size, precision: 0)
  end
end
