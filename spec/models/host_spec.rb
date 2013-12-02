require 'spec_helper'

describe Host do

  let (:host) do
    Host.new name: "john", password: "pass", email: "goob@foob.com", phone: "5555555555"
  end

  context "testing host validations" do

    it "validates presence of email when creating a host" do
      expect{Host.create name: "logan", password: "bootcamp", email: "logan@gmail.com"}
      .to change{Host.all.count}.by(1)
      expect{Host.create name: "logan", password: "bootcamp", email: nil}
      .to_not change{Host.all.count}
    end

    it "validates presence of password when creating a host" do
      expect{Host.create name: "logan", password: "testing", email: "logan@gmail.com"}
      .to change{Host.all.count}.by(1)
      expect{Host.create name: "logan", password: nil, email: "logan@gmail.com"}
      .to_not change{Host.all.count}
    end

    it "validates uniqueness of email" do
      expect{Host.create name: "logan", password: "testing", email: "logan@gmail.com"}
      .to change{Host.all.count}.by(1)
      expect{Host.create name: "Chris", password: "newtest", email: "logan@gmail.com"}
      .to_not change{Host.all.count}
    end

    it "validates the format of email" do
      expect{Host.create name: "Chris", password: "newtest", email: "chris@gmail.com"}
      .to change{Host.all.count}.by(1)
      expect{Host.create name: "Chris", password: "newtest", email: "@gmail.com"}
      .to_not change{Host.all.count}
      expect{Host.create name: "Chris", password: "newtest", email: "test@.com"}
      .to_not change{Host.all.count}
    end

    it "validates length of password" do
      expect{Host.create name: "logan", password: "testing", email: "logan@gmail.com"}
      .to change{Host.all.count}.by(1)
      expect{Host.create name: "Chris", password: "short", email: "chris@gmail.com"}
      .to_not change{Host.all.count}
    end


  end
end