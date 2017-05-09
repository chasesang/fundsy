class ChangeColumnGoalToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :campaigns, :goal, 'integer USING CAST(goal AS integer)'
  end
end
