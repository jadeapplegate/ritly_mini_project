require 'spec_helper'

describe UrlsController do

	describe "GET index" do
		it 'should be a 200 response' do
			get :index
			expect(response.status).to eq(200)
		end
	end

	describe "GET new" do
		it 'should be a 200 response' do
			get :new
			expect(response.status).to eq(200)
		end
	end

	describe "GET edit" do
		it 'should be a 200 response' do
			url = Url.create({link: 'www.google.com'})
			get :edit, {id: url.id}
			expect(response.status).to eq(200)
		end
	end

	describe "GET show" do
		it 'should be a 200 response' do
			url = Url.create({link: 'www.google.com'})
			get :show, {id: url.id}
			expect(response.status).to eq(200)
		end
	end

	describe "GET preview" do
		it 'should be a 200 response' do
			url = Url.create({link: 'www.google.com'})
			get :preview, {id: url.id}
			expect(response.status).to eq(200)
		end
	end

	describe "POST create" do
		it 'should redirect' do
			post :create, "url"=>{"link"=>"google.com"}
			expect(response.status).to eq(302)
		end
	end

	describe "PUT update" do
		it 'should redirect' do
			url = Url.create({link: 'www.google.com'})
			put :update, "url"=>{"link"=>"google.com"}, "id"=>url.id
			expect(response.status).to eq(302)
		end
	end

end


#      Prefix Verb   URI Pattern                  Controller#Action
#        root GET    /                            urls#new
#        urls GET    /urls(.:format)              urls#index
#             POST   /urls(.:format)              urls#create
#    edit_url GET    /urls/:id/edit(.:format)     urls#edit
#         url GET    /urls/:id(.:format)          urls#show
#             PATCH  /urls/:id(.:format)          urls#update
#             PUT    /urls/:id(.:format)          urls#update
#             GET    /go/:random_string(.:format) urls#go
# preview_url GET    /urls/:id/preview(.:format)  urls#preview