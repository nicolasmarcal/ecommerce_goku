class Address < ActiveRecord::Base
  validates_presence_of :zip_code, :street, :state, :city, :neighborhood
  validates_uniqueness_of :zip_code
end
