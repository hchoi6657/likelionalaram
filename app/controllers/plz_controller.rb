class PlzController < ApplicationController
   def index
     @b = Test1.new
     @b.name = 'aa'
     @b.save
   end

end
