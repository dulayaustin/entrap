class AboutController < ApplicationController
  before_action :set_about, only: [:edit, :update]

  def index
    @about = Page.find_by(area: "about_us")
  end

  def edit

  end

  def update
    if @about.update(about_params)
      redirect_to about_index_path(@about), notice: 'About Us page was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_about
      @about = Page.find(params[:id])
    end

    def about_params
      params.require(:about).permit(:content)
    end
end
