require 'rails_helper'

describe 'creating a video' do
 it 'can create an mp4 video' do
   visit '/'
   within 'nav' do
     click_link 'Add Video'
   end
   fill_in 'video_title', with: 'dog'
   page.attach_file('video_file', Rails.root + 'spec/fixtures/mov_bbb.mp4')
   click_button 'Create Video'
   expect(page).to have_content 'dog'
   expect(page).to have_css 'video'
 end

 it 'can not create a video that is not mp4' do
   visit '/'
   within 'center' do
     click_link 'Add Video'
   end
   fill_in 'video_title', with: 'cat'
   page.attach_file('video_file', Rails.root + 'spec/fixtures/sample_iTunes.mov')
   click_button 'Create Video'
   expect(page).to have_content 'You can only upload mp4 videos!'
   expect(page).not_to have_css 'video'
 end
end
