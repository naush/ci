require 'fileutils'

module Storage
  def self.create(song)
    file_name = "#{song.charts.count + 1}.svg"
    relative_path = "/charts/#{song.id}/"
    absolute_path = root_path + relative_path
    FileUtils.mkdir_p(absolute_path) unless File.exists?(absolute_path)

    return {
      :file_name => file_name,
      :relative_path => relative_path,
      :absolute_path => absolute_path
    }
  end

  def self.root_path
    case Rails.env
    when "production"  then "#{Rails.root}/public"
    when "development" then "#{Rails.root}/public"
    when "test"        then "#{Rails.root}/spec/fixtures"
    end
  end
end
