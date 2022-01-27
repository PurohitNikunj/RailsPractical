class BooksController < ApplicationController

# ========== create Book ============
  def new
    @new_book = Book.new
    author = Author.find(params[:id])
    @new_book.author_id = author.id
  end

  def create
    @new_book = Book.new(book_params)

      if @new_book.save
        redirect_to author_path(@new_book.author_id)
      else
        render :new, status: :unprocessable_entity
      end
  end

# =========== Update Book ===========
  def edit
    @edit_book = Book.find(params[:id])
  end

  def update
    @edit_book = Book.find(params[:id])

    if @edit_book.update(book_params)
      redirect_to author_path(@edit_book.author_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

# =============== Delete Book ============
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to author_path(@book.author_id), status: :see_other
  end


  private
  def book_params
    params.require(:book).permit(:name, :price, :author_id)
  end

end
