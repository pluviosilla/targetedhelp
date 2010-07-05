# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def already_recommended?(user,recommended,type)
      recommendation = user.recommendations_made.find_by_recommended_id_and_recommended_type(recommended.id,type)
      if recommendation
        true
      else
        false
      end
  end
end
