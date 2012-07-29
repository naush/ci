require 'spec_helper'

describe "Songs Management" do
  it "creates a svg chart" do
    params = {
      :title => 'song',
      :author => 'me',
      :words => 'word word word',
    }

    post 'songs/write', :song => params, :format => :json

    parsed_body = JSON.parse(response.body)
    parsed_body['status'].should == 'ok'
    Chart.find_by_url(parsed_body['url']).should_not be_nil
  end
end
