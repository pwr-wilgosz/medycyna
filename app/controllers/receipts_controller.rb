class ReceiptsController < ApplicationController
  load_resource :user, only: [:index, :new, :create]
  load_and_authorize_resource :receipt, through: :user, only: [:index, :new, :create]
  load_and_authorize_resource :receipt, only: [:destroy, :edit, :update, :show]

  def index
    @receipts = if current_user.doctor?
      current_user.added_receipts
    elsif current_user.patient?
      current_user.receipts
    end
  end

  def show
  end

  def new
    @receipt = current_user.added_receipts.new(user: @user)
    @receipt.line_items.build
  end

  def edit
  end

  def create
    @receipt = current_user.added_receipts.new(receipt_params.merge(user: @user))

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @user, notice: 'Receipt was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    user = receipt.user
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to user, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:closed, line_items_attributes: [:id, :name, :usage, :refunded, :amount, :_destroy])
    end
end

