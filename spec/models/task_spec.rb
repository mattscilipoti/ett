require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    subject(:task) { Task.new }

    it { should accept_values_for(:name, 'Timecard', 'View Space') }
    it { should_not accept_values_for(:name, nil, " ") }
  end

end
