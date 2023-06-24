module CalendarHelper
  def render_day(day, trainings, calories)
    render_trainings(day, trainings) + render_calories(day, calories)
  end

  private

  def render_trainings(day, trainings)
    trainings_on_day = trainings.select { |training| training.start_time.to_date == day }
    trainings_on_day.map { |training| content_tag(:div, link_to(training.training_name, training)) }.join.html_safe
  end

  def render_calories(day, calories)
    calories_on_day = calories.select { |calory| calory.start_time.to_date == day }
    calories_on_day.map { |calory| content_tag(:div, link_to(calory.calories_intake, calory)) }.join.html_safe
  end
end