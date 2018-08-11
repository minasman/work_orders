require_relative './concerns/slugifiable.rb'

class User < ActiveRecord::Base 
    has_secure_password
    has_many :workorders
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end
