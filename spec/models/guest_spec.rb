require 'spec_helper'

describe Guest do
  context "guest model" do
    context "#validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :email }
      it { should allow_value('/.+@.+\..*{4}/').for(:email) }
      it { should validate_uniqueness_of(:email).with_message(" is already a guest of this event.") }
    end
    context "associations" do
      it { should have_many :items }
    end
  end
end