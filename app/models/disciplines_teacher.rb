class DisciplinesTeacher < ActiveRecord::Base
  belongs_to :teacher, :foreign_key => 'teacher_id'
  belongs_to :discipline, :foreign_key => 'discipline_id'
end
