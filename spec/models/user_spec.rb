require 'rails_helper'

RSpec.describe User, type: :model do

  context 'password match' do
    user = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hogehoge')
    user.valid?
    it 'password match' do
      expect(user.errors[:password_confirmation]).not_to be_present
    end
  end

  context "password don't match" do
    user = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hoge')
    user.valid?
    it "password don't match" do
      expect(user.errors[:password_confirmation]).to be_present
    end
  end

  it 'email must be unique' do
    user = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hogehoge')
    user.save

    u = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hogehoge')
    u.save

    expect(u.errors[:email].first).to eq('has already been taken')
  end

  it 'password length less than 5 characters is invalid' do
    user = User.new(email: 'bugs', password: '1234')

    result = user.save

    expect(result).to be(false)
  end

  it 'password length must be at-least 5 characters' do
    user = User.new(email: 'bugs', password: '12345')

    result = user.save

    expect(result).to be(true)
  end
end