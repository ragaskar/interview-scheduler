require 'rails_helper'

RSpec.describe "People", :type => :request do
  it "should be possible to create and retrieve people" do
      post "/people", {person: {first_name: "Bruce", last_name: "Fowler"}}
      expect(response).to have_http_status(201)
      result = JSON.parse(response.body)
      id = result["id"]
      get "/people/#{id}"
      expect(response).to have_http_status(200)
      result = JSON.parse(response.body)
      expect(result).to include("first_name" => "Bruce", "last_name" => "Fowler")
  end
end
