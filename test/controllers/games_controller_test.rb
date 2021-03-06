require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { TeamOne: @game.TeamOne, TeamOneVotes: @game.TeamOneVotes, TeamTwo: @game.TeamTwo, TeamTwoVotes: @game.TeamTwoVotes }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { TeamOne: @game.TeamOne, TeamOneVotes: @game.TeamOneVotes, TeamTwo: @game.TeamTwo, TeamTwoVotes: @game.TeamTwoVotes }
    assert_redirected_to game_path(assigns(:game))
  end


end
