class CasesController < ApplicationController
  respond_to :json

  def index
    render json: API::Client.new.cases
  end

  def update
    API::Client.new.add_label_to_case params[:label]
  end
end
