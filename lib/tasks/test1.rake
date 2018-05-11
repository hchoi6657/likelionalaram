
require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'rake'
# 1
mechanize = Mechanize.new
login_page = mechanize.get "http://uni.likelion.org"
# 2
form = login_page.form_with(:id => "new_user")
# noinspection RubyResolve
form.field_with(:name => 'user[email]').value = 'hchoi6657@likelion.org'
form.field_with(:name => 'user[password]').value = 'chlgudrb1!'
# 3
logined_page = form.submit
alist = logined_page.xpath('//ol[@class="list"]/li/a/div/h4//text()').map {|n| n}
incomlist = logined_page.xpath('//ol[@class="list"]/li[@class="list__item incomplete"]').text

# $wholelist = alist
$wholelist = ["Test 강의"]

def test22()
  lecture_arr = []
  $wholelist.each {|x|
    if Test1.exists?(name: x.to_s)
      print x
      print "ya"
    else
      post = Test1.new
      post.name = x
      post.save
      lecture_arr << x
      print "it doesnt exsit"
    end
	send_mail(lecture_arr)
  }
end

namespace :test1 do
  desc "Todo"
  task :fetch => :environment do
    test22()
  end
end

def send_mail(lecture_arr)
users = User.all
users.each do |user|
  if lecture_arr.kind_of?(Array)
    lecture = lecture_arr.join(",")
      LectureMailer.lecture_email(user,lecture).deliver
      puts "성공적으로 메일 보냄: "+lecture
  else
    lecture = lecture_arr
      LectureMailer.lecture_email(user,lecture).deliver
      puts "성공적으로 메일 보냄: "+lecture
  end

end
end