require 'rails_helper'

describe 'Managing projects' do
  specify 'I can accept a project' do
    test1 = FactoryBot.create :project, name: 'Test 1'
    visit '/'
    click_button 'Accept'
    expect(page).to have_content 'accept successfully'
  end

  specify 'I can delete a project' do
    test1 = FactoryBot.create :project, name: 'Test 2'
    visit '/'
    click_button 'Delete'
    expect(page).to have_content 'decline successfully'
  end
  specify 'I can see the detail of project' do
    test1 = FactoryBot.create :project, name: 'Test 3', Description: 'Description'
    visit '/'
    click_button 'details'
    expect(page).to have_content 'Description'
  end

  describe 'Managing module'
  specify 'I can add a new module' do
    module 1 = FactoryBot.create :module, name: 'module 1'
    visit '/'
    click_button 'new module'
    expect(page).to have_content 'New'
  end

  describe 'Login'
  specify 'I can login' do
    user = FactoryBot.create (:, name: 'module 1'
    visit '/'
    click_button 'new module'
    expect(page).to have_content 'New'
  end
