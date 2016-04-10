require 'rails_helper'

describe 'creating a video' do
 it 'can create an mp4 video' do
   visit '/'
   click_link 'New Video'
   fill_in 'video_title', with: 'dog'
   page.attach_file('video_file', Rails.root + 'spec/fixtures/mov_bbb.mp4')
   click_button 'Create Video'
   expect(page).to have_content 'dog'
 end

 it 'can not create a video that is not mp4' do
   visit '/'
   click_link 'New Video'
   fill_in 'video_title', with: 'cat'
   page.attach_file('video_file', Rails.root + 'spec/fixtures/sample_iTunes.mov')
   click_button 'Create Video'
   expect(page).to have_content 'You can only upload mp4 videos!'
 end
end
