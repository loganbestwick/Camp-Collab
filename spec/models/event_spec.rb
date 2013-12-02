require 'spec_helper'

describe Event do
  context "testing event validations" do

    it "validates presence of name" do
      expect{Event.create name: "logan"}.to change{Event.all.count}.by(1)
      expect{Event.create name: nil}.to_not change{Event.all.count}
    end

  end
end