class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.all
    
    puts @books
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    Array @arr = [['Select category', 0]]
    categories = Category.all
    categories.each do |category|
        @arr.push([category.name, category.id])
    end
    Array @arr1 = [['Select publisher', 0]]
    publishers = Publisher.all
    publishers.each do |publisher|
        @arr1.push([publisher.name, publisher.id])
    end
    @position1 = 0
    @position2 = 0
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    Array @arr = [['Select category', 0]]
    categories = Category.all
    categories.each do |category|
        @arr.push([category.name, category.id])
    end
    Array @arr1 = [['Select publisher', 0]]
    publishers = Publisher.all
    publishers.each do |publisher|
        @arr1.push([publisher.name, publisher.id])
    end
    # puts set_book.category_id
    @position1 = set_book.category_id
    @position2 = set_book.publisher_id
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :year, :category_id, :publisher_id)
    end
end