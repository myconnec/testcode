class Condition < ActiveRecord::Base
    validates_presence_of :id
    validates_presence_of :value
end
