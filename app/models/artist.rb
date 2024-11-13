class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :songs

  after_create_commit :create_stripe_account

  def create_stripe_account
    stripe_account = Stripe::Account.create()
    update(stripe_account_id: stripe_account.id)
  end
end
