class SearchesController < ApplicationController
  before_action :set_search, only: %i[ show edit update destroy ]

  # GET /searches or /searches.json
  def index
    @search = Search.new
    ip = request.remote_ip
    @trendings = Search.where(ip: ip).order("search_numbers DESC")
  end

  def save_search
    ip = request.remote_ip
    value = request.body.read
    @searchs = Search.where(ip: ip)
    index = nil
    @searchs.each do |search|
      index = value.index(search.search_text)
      if index != nil
        @search = search
        break
      end
    end
    unless index
      search = Search.new(ip: ip, search_text: value, search_numbers: 1)
      search.save
    else
      @search.update(search_text: value, search_numbers: @search.search_numbers + 1)
    end

    render json: {searchs: Search.where(ip: ip).order("search_numbers DESC")}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_params
      params.require(:search).permit(:search_text)
    end
end
