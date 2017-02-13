require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first_name" do
        contact = Contact.new(last_name: "Smith", position: "HR manager", e_mail: "samantha@ck.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a last_name" do
        contact = Contact.new(last_name: "Samantha", position: "HR manager", e_mail: "samantha@ck.com")
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(first_name: "Samantha", last_name: "Smith", e_mail: "samantha@ck.com")
        expect(contact).to be_invalid
      end

      it "is invalid without an e-mail" do
        contact = Contact.new(first_name: "Samantha", last_name: "Smith", position: "HR manager")
        expect(contact).to be_invalid
      end

      it "has a unique e-mail" do
        Contact.create(first_name: "Samantha", last_name: "Smith", position: "HR manager", e_mail: "samantha@ck.com")
        contact = Contact.new(first_name: "Samantha", last_name: "Roberts",position: "HR manager assistant", e_mail: "samantha@ck.com")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
      contact = Contact.new(first_name: "Samantha", last_name: "Roberts", position: "HR manager assistant", e_mail: "samantha@ck.com")
      expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(first_name: "Carmen", last_name: "Sevilla", position: "General Manager", e_mail: "csevilla@ge.com")
      expect(contact).to respond_to(:company)
    end
  end

end
