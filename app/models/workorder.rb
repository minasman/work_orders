require_relative './concerns/slugifiable.rb'

class Workorder < ActiveRecord::Base 
    belongs_to :store
    belongs_to :user
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end
