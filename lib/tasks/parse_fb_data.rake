require 'file'
require 'json'

desc 'Parses raw facebook data for token'

task parse_fb_data: :environment do
  people = {}
  file = File.open('fb_dump.json').readlines.first.chomp
    .gsub(/\"_id\" \: ObjectId\( \".{24}\" \), /, '')
  json = JSON.parse(file)
  name = json['info']['name']
  token = json['credentials']['token']
  people[name] = token
end

class Parser
  attr_accessor :file, :people, :json

  def initialize(path)
    @file   = File.open(path)
    @people = {}
    @json   = {}
  end

  def remove_object_id(row)
    row.gsub(/\"_id\" \: ObjectId\( \".{24}\" \), /, '')
  end

  def row_to_json(row)
    JSON.parse(row)
  end

  def name
    json['info']['name']
  end

  def token
    json['credentials']['token']
  end

  def parse_file
  end
end



