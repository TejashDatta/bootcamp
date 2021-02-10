class BooksController < ApplicationController
  protect_from_forgery except: :destroy
  before_action :set_book, only: %i[show destroy]
  around_action :action_logger, only: [:show]

  after_action do
    logger.info 'after action'
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(paramas[:id])
  end

  def action_logger
    logger.info 'around-before'
    yeild
    logger.info 'around-after'
  end
end
