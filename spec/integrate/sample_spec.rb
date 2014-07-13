# -*- coding: utf-8 -*-

describe 'User Login' do

  before(:all) do
    @wd = DRIVER
    @shots = SHOTS
    @name = 'sample'
  end

  after(:all) do
  end

  before(:each) do
    @sub_no = 0
  end

  example 'User can sign in OK' do
    @wd.get 'http://localhost:3000/'
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
  end

  example 'User failed to sign in due to invalid password' do
    @wd.get 'http://localhost:3000/'
    @shots.action_and_screenshot @wd, @name, @sub_no += 1
  end
end
