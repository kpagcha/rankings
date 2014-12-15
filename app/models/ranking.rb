class Ranking < ActiveRecord::Base
	has_many :players

	validates :name, presence: true
	validates :sport, presence: true
	validates :year, presence: true

	def full_name
		return "#{name} #{year}"
	end
end
