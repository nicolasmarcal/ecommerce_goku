require "spec_helper"

RSpec.describe User, :type => :model do
  subject { FactoryGirl.build(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end

