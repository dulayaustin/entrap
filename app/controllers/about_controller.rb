class AboutController < ApplicationController
  before_action :set_about, only: :update

  def index
    @about = Page.find_by(area: "about_us")
  end

  def update
    respond_to do |format|
      if @about.update(about_params)
        format.html { redirect_to about_index_path(@about), notice: 'About Us page was successfully updated.' }
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_about
      @about = Page.find(params[:id])
    end

    def about_params
      params.require(:page).permit(:content)
    end
end
