class AddStageNameToArtists < ActiveRecord::Migration[7.2]
  def change
    add_column :artists, :stage_name, :string
  end
end
