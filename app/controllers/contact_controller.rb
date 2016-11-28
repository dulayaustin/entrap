class ContactController < ApplicationController
  before_action :set_contact, only: :update
  
  def index
    @contact = Page.find_by(area: "contact_us")
  end

  def update
    if @contact.update(contact_params)
      redirect_to contact_index_path(@contact), notice: 'Contact page was successfully updated.'
    else
      render :edit
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
