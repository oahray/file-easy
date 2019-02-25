require "rails_helper"

RSpec.describe Upload, type: :model do
  context "Association" do
    it { should belong_to(:user) }
  end

  context "Regarding Validations" do
    it { should validate_presence_of(:name) }
  end
end
