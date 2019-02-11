require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(first_name: "John", last_name: "Doe", description: "jambon de parme car on a besoin de plus de text")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#first_name" do
      it "should not be valid without first_name" do
        bad_user = User.create(last_name: "Doe")
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name.
        expect(bad_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        bad_user = User.create(first_name: "John")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:last_name)).to eq(true)
      end
    end

    describe "#description" do
      it "should not be empty" do
        invalid_user = User.create(first_name: "John", last_name: "Doe")
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:description)).to eq(true)
      end
    end

  end

  context "associations" do

    describe "event" do
      it "should have_many events" do
        event = Event.create(user: @user, start_date: "21-11-2020", duration: 2200, title: "cats can fly woohoo", description: "Mathieu dit que les chats ne peuvent pas voler et ne voleraient jamais!!!", price: 100, location:"New York")
        expect(@user.events.include?(event)).to eq(false)
      end
    end

  end



end
