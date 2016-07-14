require 'rails_helper'

RSpec.feature "Tasks", type: :feature, js: true do
  describe "#index" do
    let!(:task) { create :task }
    it "should list all the tasks" do
      visit root_path
      expect(page).to have_content(task.title)
    end
  end
  describe '#new_task' do
    it "should click in the forms and return the success message" do
      visit new_task_path
      fill_in 'title', with: 'Clean stuff'
      click_button 'Create Task'
      expect(page).to have_content("Success")
    end
  end
end
