class EventsController < ApplicationController

  def show

  end

  def index

  end

  def destroy

  end

  def edit

  end

  def update

  end

  def new

  end

  def create

  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :description, :)

  end

end
