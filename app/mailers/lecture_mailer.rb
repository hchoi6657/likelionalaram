class LectureMailer < ApplicationMailer
	default from: "likeLionMachine@likelion.org"
	def lecture_email(user,lecture)
		@user = user
		@lecture = lecture
		mail(to: @user.email, subject: 'New Lecture!')
	end
end
