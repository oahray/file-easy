require "rails_helper"

RSpec.describe User, type: :model do
  context "Association" do
    it { should have_many(:uploads) }
  end

  context "Validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end
end
