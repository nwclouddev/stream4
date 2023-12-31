class VisitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @visits = Ahoy::Visit.all.order(started_at: :desc)
  end
end
