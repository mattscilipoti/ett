require 'rails_helper'

RSpec.describe Occurrence, type: :model do
  describe 'validation' do
    subject(:occurrence) { Occurrence.new }

    it { should accept_values_for(:duration, 1, 100, 15 * 60) }
    it { should_not accept_values_for(:duration, nil, " ", 'not a number', '01/13/2016', 'john@example', 0.5, -1) }

    it { should accept_values_for(:started_at, '2016-01-13', '2016/02/14') }
    it { should_not accept_values_for(:started_at, nil, " ", '01/13/2016', 'john', 'john@example') }
  end
end
