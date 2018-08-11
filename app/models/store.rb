require_relative './concerns/slugifiable.rb'

class Store < ActiveRecord::Base 
    has_many :workorders
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end
