class TemplatesController < ApplicationController
  before_filter do
    response.headers["Content-Type"] = 'text/html'
  end

  def show
    render "templates/#{params[:template]}", layout: false
  end
end