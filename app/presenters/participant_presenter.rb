class ParticipantPresenter < BasePresenter
  def full_name
    "#{@model.first_name} #{@model.last_name}"
  end
end
