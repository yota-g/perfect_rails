class ApplicationController < ActionController::Base
  # フックにメソッド名を指定する以外に、ブロックを用いてフックを定義することもできる。
  before_action do 
    redirect_to access_denied_path if params[:token].blank?
  end
end
