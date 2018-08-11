require_relative './concerns/slugifiable.rb'

class CurrentUpdate < ActiveRecord::Base 
    belongs_to :workorder
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end
