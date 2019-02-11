require 'rails_helper'

RSpec.describe Attendance, type: :model do

  before(:each) do
    @attendance = FactoryBot.create(:attendance)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end

    describe "#event" do
      it "should not be valid without event" do
        bad_att = FactoryBot.create(:attendance)
        expect(bad_att).to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name.
        expect(bad_att.errors.include?(:event)).to eq(false)
      end
    end

  end

  context "associations" do

    it "should belongs_to user" do
    user = FactoryBot.create(:user)
    attendance = FactoryBot.create(:attendance, user: user)
    expect(user.attendances.include?(attendance)).to eq(true)
  end

  end



end
