class FightTeamsController < ApplicationController
  before_action :set_fight_team, only: [:edit, :update, :destroy]

  def index
    @fight_teams = FightTeam.order("created_at DESC")
  end

  def edit
  end

  def update
    if @fight_team.update(fight_team_params)
      redirect_to fight_teams_path, notice: "Fighter #{@fight_team.name.titleize} was successfully updated."
    else
      render :edit
    end
  end

  def new
    @fight_team = FightTeam.new
  end

  def create
    @fight_team = FightTeam.new(fight_team_params)

    if @fight_team.save
      redirect_to fight_teams_path, notice: "New fighter was successfully added."
    else
      render :new
    end
  end

  def destroy
    @fight_team.destroy
    redirect_to fight_teams_path, notice: "Fighter named #{@fight_team.name.titleize} was being removed."
  end

  private
    def set_fight_team
      @fight_team = FightTeam.find(params[:id])
    end

    def fight_team_params
      params.require(:fight_team).permit(:name, :description, :picture)
    end
end
