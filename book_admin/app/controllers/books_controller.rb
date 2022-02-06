class BooksController < ApplicationController
  protect_from_forgery except:[:destroy] 
  before_action :set_book, only:[ :show, :destroy]
  around_action :action_logger, only: [:destroy]
  # セキュリティトークンの検証を行わない設定。↓（特別な理由がないと除外しない方がいい）
  # protect_from_forgery except: :update

  def show 
    respond_to do |format|
      format.html
      format.json
    end
  end

  #destroyメソッドを追加
  def destroy 
    @book.destroy
    respond_to do |format|
      format.html {redirect_to "/"}
      format.json {head :no_content}
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def action_logger
        logger.info "around-before"
        yield
        logger.info "around-after"
  end

end