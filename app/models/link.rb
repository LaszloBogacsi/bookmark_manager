require 'data_mapper'

class Link

include DataMapper::Resource

property :id, Serial
property :title, String
property :url, String

has n, :taggings
has n, :tags, :through => :taggings


end
