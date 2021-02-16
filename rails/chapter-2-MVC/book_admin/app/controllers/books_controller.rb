class BooksController < ApplicationController
  protect_from_forgery except: :destroy
  before_action :set_book, only: %i[show destroy]
  before_action :detect_mobile_variant
  around_action :action_logger, only: [:show]

  after_action do
    logger.info 'after action'
  end

  def show
    # render :show, format: :html
    # render :show, layout: "example_layout"
    respond_to do |format|
      format.html
      # format.html do |html|
      #   html.mobile {redirect_to profile_path}
      # end
      # format.json { render json: @book }
      format.json
    end
    # redirect_to profile_path, status: 302
    # redirect_to profile_path, status: :found

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
    @book = Book.find(params[:id])
  end

  def action_logger
    logger.info 'around-before'
    yield
    logger.info 'around-after'
  end

  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end
end
