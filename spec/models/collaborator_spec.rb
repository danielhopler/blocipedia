require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  let(:user) { User.create!(username: "Blocipedia User", email: "user@blocipedia.com", password: "password", role: "standard" ) }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: user) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:wiki) }

end
