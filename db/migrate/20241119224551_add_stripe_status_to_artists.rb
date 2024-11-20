class AddStripeStatusToArtists < ActiveRecord::Migration[7.2]
  def change
    add_column :artists, :stripe_status, :integer, default: 0
  end
end
