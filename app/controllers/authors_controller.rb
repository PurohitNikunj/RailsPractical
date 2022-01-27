class AuthorsController < ApplicationController

# ============ Author Home =================
  def index
    @authors = Author.all
    @books = Book.all
  end

# ============ Create Author =================
  def new
    @new_author = Author.new
  end

  def create
    @new_author = Author.new(author_params)
  
    if @new_author.save
      redirect_to @new_author
    else
      render :new, status: :unprocessable_entity
    end
  end

# =============== Show Individual author ============
  def show
    @author = Author.find(params[:id])
  end

# ============ Update Author ===============
  def edit
    @edit_author = Author.find(params[:id])
  end

  def update
    @edit_author = Author.find(params[:id])

    if @edit_author.update(author_params)
      redirect_to 
    else
      render :edit, status: :unprocessable_entity
    end
  end

# ============ Delete Author ================
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path, status: :see_other
  end


  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :dob, :email)
  end

end
