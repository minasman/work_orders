require_relative './concerns/slugifiable.rb'

class Workorder < ActiveRecord::Base 
    belongs_to :store
    belongs_to :user
    has_many :current_updates
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end
