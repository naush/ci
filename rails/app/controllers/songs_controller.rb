require 'flow_chart'
require 'storage'
require 'svg'

class SongsController < ApplicationController
  def write
    song = Song.create(params[:song])
    chart = FlowChart.create(song.words)

    svg = SVG.new(chart)
    storage = Storage.create(song)
    svg.save(storage[:absolute_path] + storage[:file_name])
    url = storage[:relative_path] + storage[:file_name]
    song.charts.create!(:url => url)

    respond_to do |format|
      format.json {
        render :json => { :status => 'ok', :url => url }.to_json
      }
    end
  end
end
