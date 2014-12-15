require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
	test 'should have required fields' do
		player = Player.new
		assert_not player.valid? 'first_name, last_name, country and points are required fields'
		player = Player.new(last_name: 'Federer', country: 'Switzerland', points: 9775)
		assert_not player.valid?  'first_name is a required field'
		player = Player.new(first_name: 'Roger', country: 'Switzerland', points: 9775)
		assert_not player.valid?  'last_name is a required field'
		player = Player.new(first_name: 'Roger', last_name: 'Federer', points: 9775)
		assert_not player.valid?  'country is a required field'
		player = Player.new(first_name: 'Roger', last_name: 'Federer', country: 'Switzerland')
		assert_not player.valid?  'points is a required field'
		player = Player.new(first_name: 'Roger', last_name: 'Federer', country: 'Switzerland', points: 9775)
		assert player.valid? 'All required fields were provided'
	end

	test 'points should be greater than or equal to zero' do
		player = Player.new(first_name: 'Roger', last_name: 'Federer', country: 'Switzerland', points: -503)
		assert_not player.valid? 'Points cannot be less than zero'
		player = Player.new(first_name: 'Roger', last_name: 'Federer', country: 'Switzerland', points: 9775)
		assert player.valid? 'Points are greater or equal to zero'
	end

	test 'should belong to ranking' do
		player = Player.new(first_name: 'Roger', last_name: 'Federer', country: 'Switzerland', points: 9775)
		ranking = Ranking.new(name: 'ATP Ranking', year: 2014, sport: 'Tennis')
		ranking.players << player
		assert_equal player.ranking.full_name, 'ATP Ranking 2014'
	end
end
