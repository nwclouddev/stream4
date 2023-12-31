class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:destroy]
  def index
    @events = Ahoy::Event.all.order(time: :desc)
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = Ahoy::Event.find(params[:id])
    end

    def event_params
      params.require(:ahoy_event).permit(:id)
    end
end
