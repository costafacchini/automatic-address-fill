class ImportCities < ApplicationService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    File.foreach(@file_path) { |line| City.find_or_create_by!(code: line[0..4].strip, name: line[45..80].strip) }
  end
end
