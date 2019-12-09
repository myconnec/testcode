class Session < ActiveRecord::Base
    acts_as_voter

    validates_presence_of :id
    validates_presence_of :ip
    validates_presence_of :session
    validates_presence_of :created_at
end