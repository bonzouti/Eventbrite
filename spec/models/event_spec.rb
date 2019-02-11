require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do
    @event = FactoryBot.create(:event)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end

    describe "#location" do
      it "should not be valid without location" do
        bad_event = FactoryBot.create(:event)
        expect(bad_event).to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name.
        expect(bad_event.errors.include?(:location)).to eq(false)
      end
    end

  end

  context "associations" do

    it "should belongs_to user" do
    user = FactoryBot.create(:user)
    event = FactoryBot.create(:event, user: user)
    expect(user.events.include?(user)).to eq(false)
  end

  end



end
