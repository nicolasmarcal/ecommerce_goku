class ExternalZipCodeSearcher
  require 'correios-cep'

  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::Conversion

  validates_presence_of :zip_code
  validates_length_of :zip_code, length: 8, allow_blank: false

  attr_accessor :zip_code

  def initialize(zip_code)
    @zip_code = zip_code.gsub(/[^\d]/, '')
  end

  def get_address
    Correios::CEP::AddressFinder.get(@zip_code)
  end

end