# -*- coding: utf-8 -*-

describe 'User Login' do
  NAME = 'sample'

  before(:all) do
    @wd = DRIVER
    @shots = SHOTS
  end

  after(:all) do
  end

  before(:each) do
    @sub_no = 0
  end

  example 'User can sign in OK' do

    @wd.get 'http://localhost:3000/'
    @shots.action_and_screenshot @wd, NAME, @sub_no += 1
  end

  example 'User failed to sign in due to invalid password' do
    @wd.get 'http://localhost:3000/'
    @shots.action_and_screenshot @wd, NAME, @sub_no += 1
  end
end
