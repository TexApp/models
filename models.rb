require 'data_mapper'

class Case
  include DataMapper::Resource
  property :id, Serial
  property :style, Text
  property :court, Integer
  property :filed, Date
  property :number, String, :index => true
  property :type, String

  has n, :opinions
end

class Opinion
  include DataMapper::Resource
  property :id, Serial
  property :number, String, :index => true
  property :type, String
  property :date, Date
  property :url, Text
  property :filename, String, :length => 75
  property :foreign_id, Integer
  
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
