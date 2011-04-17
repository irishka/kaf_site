class Person < ActiveRecord::Base
  has_one :student, :foreign_key => 'person_id', :dependent => :destroy
  has_one :teacher, :foreign_key => 'person_id', :dependent => :destroy
end
