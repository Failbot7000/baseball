class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    if logged_in? && !current_user.admin?
      redirect_to games_path
    end
  end

  # GET /games/new
  def new
    if logged_in? && !current_user.admin?
      redirect_to games_path
    end
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
    if logged_in? && !current_user.admin?
      redirect_to games_path
    end
  end
  
  def up_team_one
    @game = Game.find(params[:id])

      @game.TeamOneVotes += 1
      @game.save
      redirect_to games_path

  end
  
  def up_team_two
    @game = Game.find(params[:id])

      @game.TeamTwoVotes += 1
      @game.save
      redirect_to games_path
 
  end
  
  # POST /games
  # POST /games.json
  def create
    if logged_in? && !current_user.admin?
      redirect_to games_path
    end
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    if logged_in? && !current_user.admin?
      redirect_to games_path
    end
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    if logged_in? && !current_user.admin?
      redirect_to games_path
    end
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:TeamOne, :TeamTwo, :TeamOneVotes, :TeamTwoVotes)
    end
end