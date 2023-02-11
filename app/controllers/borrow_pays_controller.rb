class BorrowPaysController < ApplicationController
  before_action :set_borrow_pay, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: %i[index show]
  before_action :signed_in?
  before_action :is_owner_borrow_pay?, only: %i[ show ]

  # GET /borrow_pays or /borrow_pays.json
  def index
    @borrow_pays = BorrowPay.where(library_card_id: -1)
    if admin_signed_in?
      if params[:search].blank?
        if params[:paid].blank?
          @borrow_pays = BorrowPay.all
        else
          @borrow_pays = BorrowPay.where(:paid => params[:paid]);
        end
      else 
        if params[:paid].blank?
          @borrow_pays = BorrowPay.where(library_card_id: params[:search]);
        else
          @borrow_pays = BorrowPay.where(paid: params[:paid], library_card_id: params[:search]);
        end
      end
    end

    if reader_signed_in?
      if params[:paid].blank?
        @borrow_pays = BorrowPay.where(library_card_id: current_reader.library_card_id);
      else
        @borrow_pays = BorrowPay.where(paid: params[:paid], library_card_id: current_reader.library_card_id);
      end
    end
  end

  # GET /borrow_pays/1 or /borrow_pays/1.json
  def show
  end

  # GET /borrow_pays/new
  def new
    @borrow_pay = BorrowPay.new
  end

  # GET /borrow_pays/1/edit
  def edit
  end

  # POST /borrow_pays or /borrow_pays.json
  def create
    @borrow_pay = BorrowPay.new(borrow_pay_params)

    respond_to do |format|
      if @borrow_pay.save
        format.html { redirect_to borrow_pay_url(@borrow_pay), notice: "借り貸しカードが作成されました。" }
        format.json { render :show, status: :created, location: @borrow_pay }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrow_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrow_pays/1 or /borrow_pays/1.json
  def update
    respond_to do |format|
      if @borrow_pay.update(borrow_pay_params_payal)
        format.html { redirect_to borrow_pay_url(@borrow_pay), notice: "借り貸しカードが更新されました。" }
        format.json { render :show, status: :ok, location: @borrow_pay }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrow_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrow_pays/1 or /borrow_pays/1.json
  def destroy
    @borrow_pay.destroy

    respond_to do |format|
      format.html { redirect_to borrow_pays_url, notice: "借り貸しカードが消しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow_pay
      @borrow_pay = BorrowPay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrow_pay_params
      params.require(:borrow_pay).permit(:library_card_id, :admin_id, :borrow_date, :book_id, :note, :paid, :pay_day)
      .with_defaults(borrow_date: Date.current, paid: false)
    end

    # Only update pay day and paid when payal.
    def borrow_pay_params_payal
      params.require(:borrow_pay).permit(:paid, :pay_day)
      .with_defaults(pay_day: Date.current)
    end

    def signed_in?
      unless admin_signed_in? || reader_signed_in? 
        redirect_to new_reader_session_path
      end 
    end

    def signed_in?
      unless admin_signed_in? || reader_signed_in? 
        redirect_to new_reader_session_path
      end 
    end

    def is_owner_borrow_pay?

      if admin_signed_in?
        return true
      elsif current_reader.id == @borrow_pay.library_card.reader.id
        return true
      else
        flash[:notice] = "あなたはこのカードの所有者ではありません"
        redirect_to borrow_pays_path
      end
    end
end
