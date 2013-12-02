require 'spec_helper'

describe Item do
  context "testing item validations" do

    it "validates presence of name" do
      expect{Item.create name: "logan"}.to change{Item.all.count}.by(1)
      expect{Item.create name: nil}.to_not change{Item.all.count}
    end

  end
end