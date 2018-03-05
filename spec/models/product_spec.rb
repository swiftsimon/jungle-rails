require 'rails_helper'

RSpec.describe Product, type: :model do
  subject { Product.new }

  before :each do
    @category = Category.new(name: "Socks")
  end

  describe 'Validations' do

    it "is valid with all fields entered" do
      subject.name = "name"
      subject.price = 5
      subject.category = @category
      subject.quantity = 100
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      subject.price = 5
      subject.category = @category
      subject.quantity = 100
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.name = "test"
      subject.price = nil
      subject.category = @category
      subject.quantity = 100
      expect(subject).to_not be_valid
    end

    it "is not valid without a quantity" do
      subject.name = "test"
      subject.price = 5
      subject.category = @category
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a category" do
      subject.name = "test"
      subject.price = 5
      subject.category = nil
      subject.quantity = 100
      expect(subject).to_not be_valid
    end

    it "is not valid when all fields are empty" do
      expect(subject).to_not be_valid
    end
  end
end

# Product Model
# belongs_to :category

#   validates :name, presence: true
#   validates :price, presence: true
#   validates :quantity, presence: true
#   validates :category, presence: true