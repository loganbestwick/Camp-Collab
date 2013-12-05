require 'spec_helper'

describe Event do
  context "testing event validations" do
    context "#validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :address }
    end
    context "associations" do
      it { should have_many :guests }
      it { should have_many :items }
      it { should belong_to :host }
    end
  end
end