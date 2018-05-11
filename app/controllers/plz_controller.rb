class PlzController < ApplicationController
   def index
     @b = Test1.new
     @b.name = 'aa'
     @b.save
   end
   
   def create
	 if params[:sign]=="true"
		 @user = User.new
		 @user.name = params[:name]
		 @user.email = params[:email]
		 @user.save
		 redirect_to :root
	 else
		 @user = User.find_by(email: params[:email])
		 if @user
		   redirect_to "/plz/login/#{@user.email}"
		 else
		   redirect_to :root
		 end
	 end
	 
   end
   
   def login
     @user = User.find_by(email: params[:email]+".com")
   end
   

end
