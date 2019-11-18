class EquipmentController < ApplicationController
  before_action :authenticate_user!
  before_action :get_group, only: [:show]
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  # GET /equipment
  # GET /equipment.json
  def index
    @equipment = Equipment.all
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    @group     = Group.new
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @group     = Group.find(equipment_params[:group_id])
    @equipment = Equipment.new(equipment_params)
    
    respond_to do |format|
      if @group
        @equipment.group = @group
        if @equipment.save
          format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
          format.json { render :show, status: :created, location: @equipment }
        else
          format.html { render :new }
          format.json { render json: @equipment.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:id, :equipment_id, :name, :brand, :model, :description, :price, :group_id)
    end

    def get_group
      @equipment_group = Group.find(params[:id])
    end
end
