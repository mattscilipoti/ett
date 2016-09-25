require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'validation' do
    subject(:user) { Report.new }

    it { should accept_values_for(:started_at, '2016-01-13', '2016/02/14') }
    it { should_not accept_values_for(:started_at, nil, " ", '01/13/2016', 'john', 'john@example') }
  end
end
