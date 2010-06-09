# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def already_recommended?(user,recommended)
    if user.recommendations_made.find_by_recommended_id(recommended.id)
      true
    else
      false
    end
  end
end
