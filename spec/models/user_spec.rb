require 'rails_helper'

RSpec.describe User, type: :model do

 subject { User.new }


  before :each do
      @second_user = User.create(
        name: "User2",
        password: "1234ABCD",
        password_confirmation: "1234ABCD",
        email: "two@email.com")
  end

  # subject.save

  describe 'Validations' do

    it "is valid with all fields entered correctly" do
      subject.name = "user"
      subject.password = 'abcd1234'
      subject.password_confirmation = 'abcd1234'
      subject.email = 'user@email.com'
      expect(subject).to be_valid
    end

    it "is not valid when name is empty" do
      subject.name = nil
      subject.password = 'abcd1234'
      subject.password_confirmation = 'abcd1234'
      subject.email = 'user@email.com'
      expect(subject).to_not be_valid
    end

    it "is not valid when passwords do not match" do
      subject.name = "user"
      subject.password = 'abcd1234'
      subject.password_confirmation = 'abcdefgh'
      subject.email = 'user@email.com'
      expect(subject).to_not be_valid
    end

    it "is not valid when email is empty" do
      subject.name = "user"
      subject.password = 'abcd1234'
      subject.password_confirmation = 'abcd1234'
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid when email is not unique" do
      subject.name = "user"
      subject.password = 'abcd1234'
      subject.password_confirmation = 'abcd1234'
      subject.email = 'two@email.com'
      expect(subject).to_not be_valid
    end

    it "is not valid when email is not unique - test case sensitivity" do
      subject.name = "user"
      subject.password = 'abcd1234'
      subject.password_confirmation = 'abcd1234'
      subject.email = 'TWO@email.com'
      expect(subject).to_not be_valid
    end

    it "is not valid when password is less than 8 characters" do
      subject.name = "user"
      subject.password = 'abcd12'
      subject.password_confirmation = 'abcd12'
      subject.email = 'user@email.com'
      expect(subject).to_not be_valid
    end


  end

end
