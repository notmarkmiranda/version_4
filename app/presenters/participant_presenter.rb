  class ParticipantPresenter < BasePresenter
  def full_name
    "#{@model.first_name} #{@model.last_name}"
  end

  def global_attendance_percentage(league)
    h.number_to_percentage(@model.global_attendance(league), precision: 0)
  end

  def global_weighted_score(league)
    @model.global_score(league)
  end

  def global_win_or_placed_percentage(league)
    h.number_to_percentage(@model.global_win_or_placed(league), precision: 0)
  end

  def short_name
    "#{@model.first_name[0]}. #{@model.last_name}"
  end
end
