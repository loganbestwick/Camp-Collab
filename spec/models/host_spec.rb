require 'spec_helper'

describe Host do
  context "testing host validations" do
    context "#validations" do
      it { should validate_presence_of :email }
      it { should validate_presence_of :password }
      it { should validate_uniqueness_of(:email).with_message(" has already been registered.") }
      it { should allow_value('/.+@.+\..*{4}/').for(:email) }
      it { should ensure_length_of :password }
    end
  end
end