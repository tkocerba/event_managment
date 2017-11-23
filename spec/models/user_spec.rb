require 'rails_helper'

RSpec.describe User do
  subject { create(:user) }

  context 'validations' do  
    it 'should be valid with name and email' do 
      expect(subject).to be_valid 
    end      

    it 'should be not valid without name' do 
      subject.name = nil
      expect(subject).not_to be_valid 
    end  

    it 'should be not valid without email' do 
      subject.email = nil
      expect(subject).not_to be_valid 
    end  

    it 'should be not vaild with a duplicated email' do
      user2 = build(:user, email: subject.email)
      expect(user2).not_to be_valid
    end
  end

  context 'events' do
    let(:event) { create(:event) }

    it 'should return an array with proper values' do 
      subject.events << event
      expect(subject.events).to include(event)
      expect(subject.events.length).to eq(1)
    end
  end
end
