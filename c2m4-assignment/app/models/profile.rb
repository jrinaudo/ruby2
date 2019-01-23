class Profile < ActiveRecord::Base
  belongs_to :user
  
  validate :not_both_null
  validates :gender, inclusion: { in: ['male', 'female'] }
  validate :not_sue
  
  def not_both_null
    if first_name.blank? && last_name.blank?
      errors.add(:first_name, "cannot be both null.")
    end
  end
  
  def not_sue
    if gender == 'male' && first_name == 'Sue'
      errors.add(:gender, "person cannot be called Sue.")
    end
  end
  
  def self.get_all_profiles(min, max)
    self.all.where('birth_year BETWEEN ? AND ?', min, max).order(:birth_year)
  end
end