class CasesController < ApplicationController
  respond_to :json

  def index
    render json: API::Client.new.cases
  end

  def update

  end
end
