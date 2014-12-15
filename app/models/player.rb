class Player < ActiveRecord::Base
	belongs_to :ranking

	validates :last_name, presence: true
	validates :first_name, presence: true
	validates :country, presence: true
	validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }

	def full_name
		return "#{first_name} #{last_name}"
	end
end
