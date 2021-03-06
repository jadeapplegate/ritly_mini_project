class UrlsController < ApplicationController

	def new
		@url = Url.new

	end

	def create
		@url = Url.create url_params
		@url['random_string']=SecureRandom.urlsafe_base64(8)
		if @url.save
			redirect_to url_path(@url)
		else
			error_messages = @url.errors.messages.values.flatten
			flash.now[:errors] = error_messages
			render action: "new"
		end
	end

	def show
		@url = Url.find(params[:id])
	end

	def go
		url = Url.find_by_random_string(params[:random_string])
		redirect_to "http://#{url.link}"
	end

	def preview
		@url = Url.find(params[:id])
	end

	def edit
		@url = Url.find(params[:id])
	end

	def update
		@url = Url.find(params[:id])
		@url.update url_params
		redirect_to url_path(@url)
	end

	def index
		@urls = Url.all
	end

	private
    def url_params
      params.require(:url).permit(:link)
    end

end


