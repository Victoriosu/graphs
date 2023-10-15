class Goal < ApplicationRecord

    has_many :goal_profits

    after_create :calculate_variation

    def self.get_goals_profits_from_api token
        @goals = ApiModule.get_goals token

        @goals['data'].each_with_index do |goal,index|
            db_goal = Goal.find_by(name: goal['attributes']['name'])
            
            if db_goal
                current_day_profit = db_goal.goal_profits.pluck(:registered_date, :profit).detect{|rd| rd[0] == Date.today && rd[1] == goal["attributes"]["profit"] }
                
                unless current_day_profit.present? 
                    db_goal.goal_profits << GoalProfit.create(registered_date: Date.today, profit: goal['attributes']['profit'])
                end
            else
                return { todo: "Malo", id_malo: goal }
            end
        end

        return { todo: "Bem" }
    end

    def calculate_variation
        old_element = nil
        GoalProfit.where(goal_id: id).order(:created_at).each_with_index do |gp, i|

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
