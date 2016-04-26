require 'rails_helper'

RSpec.describe "People", :type => :request do
  it "should be possible to create and retrieve people" do
      post "/v1/people", {person: {first_name: "Bruce", last_name: "Fowler"}}
      expect(response).to have_http_status(201)
      result = JSON.parse(response.body)
      id = result["id"]
      get "/v1/people/#{id}"
      expect(response).to have_http_status(200)
      result = JSON.parse(response.body)
      expect(result).to include("first_name" => "Bruce", "last_name" => "Fowler")
  end
end
