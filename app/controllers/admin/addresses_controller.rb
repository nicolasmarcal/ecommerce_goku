class Admin::AddressesController < Admin::AdminController

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(params[:address])

    if @address.save
      flash[:message] = "Criado com sucesso"
      redirect_to admin_addresses_path
    else
      render action: :new
    end
  end

  def destroy
    
  end

  def find_external_address
    
  end

  private

  def params_address
    params.require(:address).permit(:zip_code, :state, :city, :neighborhood, :street)
  end

end