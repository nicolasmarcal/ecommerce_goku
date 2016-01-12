class Address < ActiveRecord::Base
  validates_presence_of :zip_code, :street, :state, :city, :neighborhood
  validates_uniqueness_of :zip_code
  validates :zip_code, length: { minimum: 8, maximum: 8 }

  scope :by_zip_code, ->(zip_code) { where(zip_code: zip_code) }
end
