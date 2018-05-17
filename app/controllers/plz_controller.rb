class PlzController < ApplicationController
  def index
    @b = Test1.new
    @b.name = 'aa'
    @b.save
  end
   
  def create
	if params[:sign]=="true"
		
		if User.find_by(email: params[:email])
			redirect_to :root, notice: "이미 등록된 사용자입니다."
		else
			@user = User.new
			@user.name = params[:name]
			@user.email = params[:email]
			@user.save
			redirect_to :root, notice: "성공적으로 가입되었습니다."
		end
		
	else
		@user = User.find_by(email: params[:email])
		if @user
			if(@user.name==params[:name])
				redirect_to "/plz/login/#{@user.email}"
			else
				redirect_to :root, notice: "이름이 올바르지 않습니다."
			end
		else
		   redirect_to :root, notice: "등록되지 않은 사용자입니다."
		end
	end
	 
  end
   
    def login
      @user = User.find_by(email: params[:email]+"."+params[:format])
    end
   

end
