namespace :goals do
  desc "TODO"
  task bulk: :environment do
    token = ApiModule.retrieve_user_token["data"]["attributes"]["token"]

    goals = ApiModule.get_goals token

    goals["data"].each do |goal|
      p goal
      Goal.create(name: goal["attributes"]["name"])
    end
  end

  desc "Sets variation on each goal profit record"
  task calculate_variation: :environment do
    old_element = nil
    GoalProfit.where(goal_id: 6).order(:created_at).each_with_index do |gp, i|

      if i > 0
        gp.variation = gp.profit-old_element.profit
        p gp.variation
        gp.save
        old_element = gp
      else
        old_element = gp
      end
      
    end
  end


end
