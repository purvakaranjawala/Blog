 # RSpec.describe Comment, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
require 'rails_helper'
require 'shoulda-matchers'
RSpec.describe Comment, type: :model do
	it { should belong_to(:article)}
end
