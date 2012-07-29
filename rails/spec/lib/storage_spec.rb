require 'spec_helper'
require 'fileutils'

describe Storage do
  describe "new" do
    it "has a relative path" do
      song = Song.create!
      storage = Storage.create(song)
      storage[:file_name].should == "1.svg"
    end

    it "has a relative path for song already has one chart" do
      song = Song.create!
      song.charts.create!
      storage = Storage.create(song)
      storage[:file_name].should == "2.svg"
    end

    it "has a relative path" do
      song = Song.create!
      storage = Storage.create(song)
      storage[:relative_path].should == "/charts/#{song.id}/"
    end

    it "has an absolute path for test environment" do
      song = Song.create!
      storage = Storage.create(song)
      storage[:absolute_path].should == "#{Rails.root}/spec/fixtures/charts/#{song.id}/"
    end

    it "has an absolute path for development environment" do
      Rails.stub(:env).and_return('development')
      song = Song.create!
      storage = Storage.create(song)
      storage[:absolute_path].should == "#{Rails.root}/public/charts/#{song.id}/"
    end

    it "has an absolute path for production environment" do
      Rails.stub(:env).and_return('production')
      song = Song.create!
      storage = Storage.create(song)
      storage[:absolute_path].should == "#{Rails.root}/public/charts/#{song.id}/"
    end

    it "creates directory if not exist" do
      song = Song.create!
      new_directory = "#{Rails.root}/spec/fixtures/charts/#{song.id}/"

      storage = Storage.create(song)

      File.exists?(new_directory).should be_true
      FileUtils.rm_rf(new_directory)
    end
  end
end
