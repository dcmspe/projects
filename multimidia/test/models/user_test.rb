require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User must be not null" do
  	user = User.new
    assert !user.nil?
  end

  test "User must hava an valid e-mail" do
  	user = User.create(email: "dcms.pe@gmail.com", password:"bankaiic", name:"Danilo")
    assert user.valid?
  end

  test "User must detect an invalid e-mail" do 
  	user = User.create(email: "applepie", password:"bankaiic", name:"Danilo")
  	assert !user.valid?
  end


  test "User cannot have a blank email" do
    user = User.create(email: "", password:"bankaiic", name:"Danilo")
    assert !user.valid?
  end

  test "User must have at least 8 letters inside his password" do
    user = User.create(email: "dcms.pe@gmail.com", password: "bankaiic", name:"Danilo")
    assert user.valid?
  end

  test "User must have at maximum 16 letters inside his password" do
    user = User.create(email: "dcms.pe@gmail.com", password: "bankaibankaibank", name:"Danilo")
    assert user.valid?
  end

  test "Name can not be blank" do
    user = User.create(email: "dcms.pe@gmail.com", password: "bankaiic", name:"")
    assert !user.valid?
  end

  test "Name can just have 20 letters" do
    user = User.create(email: "dcms.pe@gmail.com", password: "bankaiic", name:"Danilo Caetano Matia")
    assert user.valid?
  end

  test "User needs to have a unique email." do
    user = User.create(email: "dcms.pe@gmail.com", password: "bankaiic", name:"Danilo Caetano")
    assert user.valid?
    user2 = User.create(email: "dcms.pe@gmail.com", password: "bankaiic", name:"Darth Vader")
    assert user2.errors[:email].any? 
  end

end