require 'data_mapper'

class Case
  include DataMapper::Resource
  property :id, Serial
  property :court, Integer
  property :docket_number, String, :index => true
  property :filed, Date
  property :style, Text

  has n, :opinions
end

class Opinion
  include DataMapper::Resource
  property :id, Serial
  property :date, Date
  property :type, String
  property :url, Text
  property :cloudfile, String, :length => 75
  
  belongs_to :case
end

class Log
  include DataMapper::Resource
  property :id, Serial
  property :court, Integer
  property :date, Date
end

DataMapper::Model.raise_on_save_failure = true
DataMapper.finalize
