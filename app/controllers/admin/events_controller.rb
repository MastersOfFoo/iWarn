module Admin
  class EventsController < ApplicationController
    http_basic_authenticate_with :name => "admin", :password => "default"

    def index
      @events = Event.all
    end
    
    def show
      @event = Event.find(params[:id])
      @photos = @event.photos
      @vehicle = @event.vehicles
      @people = @event.people
      @event_logs = @event.event_logs 
    end
    
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to admin_events_path, :notice => "Event was successfully destroyed!"
    end

  end
end
