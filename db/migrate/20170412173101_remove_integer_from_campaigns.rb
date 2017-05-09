class RemoveIntegerFromCampaigns < ActiveRecord::Migration[5.0]
  def change
    remove_column :campaigns, :integer, :string
  end
end
