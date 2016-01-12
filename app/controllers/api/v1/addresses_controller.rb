class Api::V1::AddressesController < Api::ApiController

  def index
    address = InternalZipCodeSearcher.new(params_zip_code).get_address

    if address.present?
      render json: address.to_json
    else
      render json: { text: "not found" }, status: 404
    end
  end

  private

  def params_zip_code
    params.require(:address).permit(:zip_code)[:zip_code]
  end

end