require 'data_mapper'
class Tagging

  include DataMapper::Resource

  belongs_to :tag, :key => true
  belongs_to :link, :key => true

end
