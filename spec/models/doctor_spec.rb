require 'rails_helper'

RSpec.describe Doctor, type: :model do
  context "validation the phone number for uniqueness" do
    it { should validate_uniqueness_of(:phone_number).case_insensitive }
  end
end
