class ApplicationController < ActionController::Base

  #サインイン後の遷移先を指定
  def after_sign_in_path_for(resource)
    public_items_path #遷移先のパス
  end
  
  
end