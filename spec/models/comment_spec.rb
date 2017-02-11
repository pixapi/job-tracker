require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an author_name" do
        comment = Comment.new(body: "This is the first comment")
        expect(comment).to be_invalid
      end

      it "is invalid without a body" do
      comment = Comment.new(author_name: "Sarah Smith")
      expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        comment = Comment.new(author_name: "Meg Allen", body: "This job is interesting.")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = Comment.new(author_name: "Meg Allen", body: "This job is interesting.")
      expect(comment).to respond_to(:job)
    end
  end
end
