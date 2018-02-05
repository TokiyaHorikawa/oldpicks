class GetUrlsController < ApplicationController
  def index
    @page = MetaInspector.new(params[:url])
    respond_to do |format|
      format.json
    end
  end
end
