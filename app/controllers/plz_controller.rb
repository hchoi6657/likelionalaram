class PlzController < ApplicationController
   def index
     @b = Test1.new
     @b.name = 'aa'
     @b.save
   end
   
   def create
	 @user = User.new
	 @user.name = params[:name]
	 @user.email = params[:email]
	 @user.save
	 redirect_to :root
   end
   

end
