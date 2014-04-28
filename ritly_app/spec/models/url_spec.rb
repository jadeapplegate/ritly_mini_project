require 'spec_helper'

describe Url do
  
  it "should allow a valid url to be created" do
		url = Url.create({link: 'www.google.com'})
		url.id.should_not eq(nil)
		Url.count.should eq(1)
  end

  it "should not allow a url under 3 characters to be created" do
		url = Url.create({link: 'ww'})
		url.id.should eq(nil)
		Url.count.should eq(0)
  end
  
  it "should allow a valid url with nil link to be created" do
		url = Url.create({link: nil})
		url.id.should eq(nil)
		Url.count.should eq(0)
  end

end