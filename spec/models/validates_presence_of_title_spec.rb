require 'rails_helper'
require 'shoulda-matchers'
require 'shoulda-context'
describe Article, type: :model do
  it { should validate_presence_of(:title) }
end
