class Admin::AddressesController < Admin::AdminController

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params_address)

    if @address.save
      flash[:notice] = "Criado com sucesso"
      redirect_to admin_addresses_path
    else
      flash[:error] = @addresses.errors.full_messages
      render action: :new
    end
  end

  def destroy
    
  end

  def find_external_address
    zip_code_searcher = ExternalZipCodeSearcher.new(params_zip_code)

    if zip_code_searcher.valid?
      render json: zip_code_searcher.get_address
    else
      render json: {}
    end
  end

  private

  def params_address
    params.require(:address).permit(:zip_code, :state, :city, :neighborhood, :street)
  end

  def params_zip_code
    params.permit(:zip_code)[:zip_code]
  end

end