class ContactController < ApplicationController
  before_action :set_contact, only: :update
  
  def index
    @contact = Page.find_by(area: "contact_us")
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_index_path(@contact), notice: 'Contact page was successfully updated.' }
        format.js
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_contact
      @contact = Page.find(params[:id])
    end

    def contact_params
      params.require(:page).permit(:content)
    end
end
