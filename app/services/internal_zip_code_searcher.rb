class InternalZipCodeSearcher
  attr_accessor :zip_code

  def initialize(zip_code)
    @zip_code = zip_code.gsub(/[^\d]/, '') if zip_code
  end

  def get_address
    if @zip_code
      Address.by_zip_code(@zip_code)
    else
      Address.all
    end
  end

end