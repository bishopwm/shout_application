require 'rubygems'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

set :port, 3124
enable :sessions




ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base
  validates_presence_of :name, :handle# presence, name+handle
  validates :name, presence: true, uniqueness: true # presence+uniqueness, name
  validates :handle, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true # add validation for the password. It should be 8 characters long and unique
  has_many :shouts


end



class Shout < ActiveRecord::Base
  validates :likes, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  # add validations for the message and the user id
  belongs_to :user
end

#------------------- Sinatra Stuff ------------------------------
last_id ||= 0
users ||= {}

get '/' do
  @users = users
  if session[:id]
    @current_user = users[session[:id]]
  end

  erb :shouter1
end

post '/make_a_shout' do
  name = params[:name]
  handle = params["handle"]
  last_id += 1
  users[last_id] = name, handle
  session[:id] = last_id
  redirect '/'
end
#------------------- ^Sinatra Stuff^ ------------------------------





random_password = (0...8).map { (65 + rand(26)).chr }.join

User.all.each { |user| user.destroy }
@will = User.new
@will.name = "Will"
@will.handle = "willywonka"
@will.password = random_password
@will.valid?
@will.save



p all = User.all


shouts = Shout.new
shouts.save
p @will.shouts.create(message: "Whoa its Will!", likes: 1)






# -------------- TESTS ------------------#
# private

# describe User do
  
#   before do
#   	User.all.each { |user| user.destroy }
#     @will = User.new
#     @will.name = "Will"
#     @will.handle = "willywonka"
#     @will.password = "americancoffee"

#   end

#   it "should be valid with correct data" do
#     expect(@will.valid?).to be_truthy
#   end

#   describe :name do
#     it "should be invalid with no name" do
#       @will.name = nil
#       expect(@will.valid?).to be_falsy
#     end
#   end

#   describe :handle do
#     it "should be invalid if not unique" do
#       @will.save
#       @karen = User.new
#       @karen.name = "karen"
#       @karen.handle = "willywonka"
#       @karen.password = "92746392729303827281" 
#       expect(@karen.valid?).to be_falsy
#     end
#   end

#   describe :handle do
#     it "should be invalid with no handle" do
#       @will.handle = nil
#       expect(@will.valid?).to be_falsy
#     end
#   end

#   describe :password do
#     it "should be invalid when not unique" do
#     	@will.save
#       @karen = User.new
#       @karen.name = "karen"
#       @karen.handle = "willywonka"
#       @karen.password = "americancoffee" 
#       expect(@karen.valid?).to be_falsy
#     end
#   end

#   describe :password do
#     it "should be invalid when not present" do
#       @will.password = nil
#       expect(@will.valid?).to be_falsy
#     end
#   end

# end

