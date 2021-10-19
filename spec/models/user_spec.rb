require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without a username' do
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid with a taken username' do
    user = build(:user, username: create(:user).username)
    user.valid?
    expect(user.errors[:username]).to include('has already been taken')
  end

  it 'is invalid without a password' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid with a too short password' do
    user = build(:user, password: 'pass')
    user.valid?
    expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
  end

  it 'is invalid without a first name' do
    user = build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'is invalid without a last name' do
    user = build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'is invalid without an email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a taken email' do
    user = build(:user, email: create(:user).email)
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'is invalid without a phone' do
    user = build(:user, phone: nil)
    user.valid?
    expect(user.errors[:phone]).to include("can't be blank")
  end

  it 'is invalid with a invalid phone' do
    user = build(:user, phone: 'lorem ipsum')
    user.valid?
    expect(user.errors[:phone]).to include('is invalid')
  end
end
