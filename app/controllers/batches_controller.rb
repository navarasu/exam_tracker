class BatchesController < ApplicationController
  before_action :set_batch_params, only: %i[edit update destroy]
  def index
    @batch = Batch.all
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.create(batch_params)
    if @batch.save
      redirect_to batches_url, notice: 'Batch was successfully created.'
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @batch.update(batch_params)
      redirect_to batches_url, notice: 'Batch was successfully updated.'
    else
      render :form_update, status: :unprocessable_entity
    end
  
  end

  def destroy
    @batch.delete

    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_batch_params
    @batch = Batch.find(params[:id])
  end

  def batch_params
    params.require(:batch).permit(:name)
  end
end
