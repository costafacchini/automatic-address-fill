class ImportStreets < ApplicationService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    File.foreach(@file_path) do |line|
      city = City.find_by(code: line[131..136].strip)
      next unless city

      Street.find_or_create_by!(code: line[0..4].strip, name: line[45..84].strip, city: city)
    end
  end
end
