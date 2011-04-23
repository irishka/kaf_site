class Person < ActiveRecord::Base
  has_one :student, :foreign_key => 'person_id', :dependent => :destroy
  has_one :teacher, :foreign_key => 'person_id', :dependent => :destroy
  #validates_format_of :email, :presence => true, :length => {:minimum => 3, :maximum => 254}, :uniqueness => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  #validates_presence_of :last_name, :first_name, :patronymic_name, :birthday, :nature
  #validates :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end
