require "rails_helper"

RSpec.describe Task, type: :model do
  describe "Relations" do
    it "has many plans" do
      expect(subject).to have_many(:plans)
    end
  end
end
