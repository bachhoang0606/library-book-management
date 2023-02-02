class LibraryCardsController < ApplicationController
  before_action :set_library_card, only: %i[ show edit update destroy ]

  # GET /library_cards or /library_cards.json
  def index
    @library_cards = LibraryCard.all
  end

  # GET /library_cards/1 or /library_cards/1.json
  def show
  end

  # GET /library_cards/new
  def new
    @library_card = LibraryCard.new
  end

  # GET /library_cards/1/edit
  def edit
  end

  # POST /library_cards or /library_cards.json
  def create
    @library_card = LibraryCard.new(library_card_params)

    respond_to do |format|
      if @library_card.save
        format.html { redirect_to library_card_url(@library_card), notice: "Library card was successfully created." }
        format.json { render :show, status: :created, location: @library_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_cards/1 or /library_cards/1.json
  def update
    respond_to do |format|
      if @library_card.update(library_card_params)
        format.html { redirect_to library_card_url(@library_card), notice: "Library card was successfully updated." }
        format.json { render :show, status: :ok, location: @library_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_cards/1 or /library_cards/1.json
  def destroy
    @library_card.destroy

    respond_to do |format|
      format.html { redirect_to library_cards_url, notice: "Library card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_card
      @library_card = LibraryCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_card_params
      params.require(:library_card).permit(:start_date, :expiration_date, :note)
    end
end
