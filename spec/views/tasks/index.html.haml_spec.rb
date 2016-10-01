require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(name: 'TEST INDEX 1'),
      Task.create!(name: 'TEST INDEX 2')
    ])
  end

  it "renders a list of tasks" do
    render
  end
end
