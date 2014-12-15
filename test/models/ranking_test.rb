require 'test_helper'

class RankingTest < ActiveSupport::TestCase
	test 'should have required fields' do
		ranking = Ranking.new
		assert_not ranking.valid? 'name, sport and year are required fields'
		ranking = Ranking.new(name: 'National League', year: 1999)
		assert_not ranking.valid? 'sport is a required field'
		ranking = Ranking.new(name: 'National League', sport: 'Hockey')
		assert_not ranking.valid? 'year is a required field'
		ranking = Ranking.new(sport: 'Rugby', year: 2003)
		assert_not ranking.valid? 'name is a required field'
		ranking = Ranking.new(name: 'ATP Ranking', year: 2014, sport: 'Tennis')
		assert ranking.valid? 'All required fields were provided'
	end

	test 'full_name method should return name and year' do
		ranking = Ranking.new(name: 'ATP Ranking', year: 2014, sport: 'Tennis')
		assert_equal 'ATP Ranking 2014', ranking.full_name
	end

	test 'should have players' do
		ranking = Ranking.new(name: 'ATP Ranking', year: 2014, sport: 'Tennis')
		player = Player.new(first_name: 'Rafael', last_name: 'Nadal', country: 'Spain', points: 6835)
		ranking.players << player
		assert_equal 'Rafael Nadal', ranking.players[0].full_name
	end
end