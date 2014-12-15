require 'test_helper'

class UserFlowIntegrationTest < ActionDispatch::IntegrationTest
	test 'user creates valid ranking' do
		get '/rankings'
		assert_response :success
		assert_template 'rankings/index'
		assert_equal assigns(:rankings).count, 0

		get '/rankings/new'
		assert_response :success
		assert_template 'rankings/new'

		post_via_redirect '/rankings', ranking: { name: 'ATP Ranking', year: 2014, sport: 'Tennis' }
		ranking = assigns(:ranking)
		assert ranking.valid?
		assert_response :success
		assert_response '/rankings/show'

		get '/rankings'
		assert_response :success
		assert_template 'rankings/index'
		assert_equal assigns(:rankings).count, 1
	end

	test 'user creates invalid player' do
		get '/players'
		assert_response :success
		assert_template 'players/index'
		assert_equal assigns(:rankings).count, 0

		get '/players/new'
		assert_response :success
		assert_template 'players/new'

		post_via_redirect '/players', player: { first_name: 'Andrew' }
		player = assigns(:player)
		assert_not ranking.valid?
		assert_response :error

		get '/players'
		assert_response :success
		assert_template 'players/index'
		assert_equal assigns(:rankings).count, 0
	end
end