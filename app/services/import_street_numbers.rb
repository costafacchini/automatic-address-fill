class ImportStreetNumbers < ApplicationService
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    File.foreach(@file_path) do |line|
      street = Street.find_by(code: line[49..54].strip)
      next unless street

      StreetNumber.find_or_create_by!(number: line[8..16].strip, street: street)
    end
  end
end
