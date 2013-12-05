require 'spec_helper'

describe Item do
  context "testing item validations" do
    context "#validations" do
      it { should validate_presence_of :name }
    end

    context "associations" do
      it { should belong_to :guest }
      it { should belong_to :event }
    end
  end
end