class Historie < ActiveRecord::Base

  validates_presence_of :body
  #validates_length_of :image, :maximum => 255
  #validates_format_of :image, :allow_blank => true, :with =>%r{\.(gif|jpg|png)$}i


  before_save :prepare_picture_fields
  after_save :save_picture


  attr_accessor :picture,:del

public
  def picture_path
    File.join('/', self.class.name.pluralize.mb_chars.downcase, "#{self.id}.#{self.picture_ext}")
  end

  def picture_exists?
    !self.picture_ext.blank?
  end

private
  def prepare_picture_fields
    if @picture
      self.picture_ext = @picture.original_filename.split('.').last.mb_chars.downcase
      self.picture_name = @picture.original_filename.mb_chars.downcase
    else
      if @del!="0"
        self.picture_ext = nil
        self.picture_name = nil
      end
    end
  end

  def save_picture
    if @picture
      path = File.join(RAILS_ROOT, 'public', self.class.name.pluralize.mb_chars.downcase, "#{self.id}.#{self.picture_ext}")
      File.open(path, "wb") do  |f|
        f.write(@picture.read)
      end
    end
  end


end
