class ImportPostalCodes < ApplicationService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    File.foreach(@file_path) do |line|
      city = City.find_by(name: line[4..43].strip)
      next unless city

      PostalCode.find_or_create_by!(code: line[0..3].strip, city: city)
    end
  end
end
