require "spec_helper"

RSpec.describe InternalZipCodeSearcher, :type => :service do
  subject { InternalZipCodeSearcher.new("00000-000") }

  describe ".get_address" do
    it "calls Address Model" do
      expect(Address).to receive(:by_zip_code).with("00000000")

      subject.get_address
    end
  end
end