class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:run, :index]

  
  def run
    @host = Host.all

    @data=[]
    
    @host.each do |host|
      name = host.name
      address = host.address
      avatar = host.avatar.thumb.url
      rtts = [10,15,35,13,46]
      
      # for i in 1..5
       # result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
        #rtts.push(result)
      #end

      latence = rtts.sum/rtts.length

      if latence < 30
        indicator = ["success", "Ótima"]
      elsif latence > 30 and latence2 < 100
          indicator = ["primary", "Boa"]
      else
        indicator = ["danger","Ruim"]
      end

      @data.push([name, address, avatar, latence, indicator, {1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}])

    end

  end

  def list
    @hosts = Host.all
    authorize @hosts
  end
  
  
  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
    @hosts = Host.all
    authorize @hosts
  end

  # GET /hosts/new
  def new
    @host = Host.new
    @hosts = Host.all
    authorize @hosts
  end

  # GET /hosts/1/edit
  def edit
    @hosts = Host.all
    authorize @hosts
  end

  # POST /hosts
  # POST /hosts.json
  def create
    @host = Host.new(host_params)

    respond_to do |format|
      if @host.save
        format.html { redirect_to @host, notice: 'Host was successfully created.' }
        format.json { render :show, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def host_params
      params.require(:host).permit(:avatar, :name, :address)
    end
end
