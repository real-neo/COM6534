require 'rails_helper'
describe 'Manage projects' do
  specify 'I can upload projects' do
  visit '/'
  click_button 'Upload your new project'
  fill_in 'Project name', with: 'new test'
  fill_in 'Project budget', with: '100'
  fill_in 'Project details', with: 'It is a upload test'
  fill_in 'Company name', with: 'shef'
  fill_in 'Your email', with: '2286593908@qq.com'
  click_button 'Upload'
  expect(page).to have_content 'Upload project successfully!'
  end
end

describe 'Track the project' do
  specify 'I can track the projects' do
    visit '/'
    fill_in 'Project track ID', with: '1'
    click_button 'Track'
    expect(page).to have_content 'Sorry, we cannot found this project.
Please check track ID.'
  end
end
