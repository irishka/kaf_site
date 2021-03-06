class Speciality < ActiveRecord::Base

  has_many :students
  
  validates_presence_of :code, :name, :count_years
  validates_length_of :code, :maximum => 63
  validates_length_of :name, :maximum => 127
  validates_length_of :in_diploma, :maximum => 127
  validates_length_of :short_name, :maximum => 63

  def self.search(search,page)
    if search
      Speciality.all(:conditions => ['code LIKE :q OR name LIKE :q OR short_name LIKE :q OR in_diploma LIKE :q OR count_years=:t',{:q => "%#{search}%",:t => "#{search}"}],:order => 'name').paginate(:per_page => 20, :page => page)
    else
      Speciality.all(:order => 'name').paginate(:per_page => 20, :page => page)
    end
  end
end
