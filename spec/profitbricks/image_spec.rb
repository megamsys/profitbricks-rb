require 'spec_helper'

describe Profitbricks::Image do
  include Savon::SpecHelper

  before(:all) { savon.mock!   }
  after(:all)  { savon.unmock! }

  it "should find all images" do
    savon.expects(:get_all_images).with(message: {}).returns(f :get_all_images, :success)
    Image.all.count.should == 7
  end

  it "should find an image by name" do 
  	savon.expects(:get_all_images).with(message: {}).returns(f :get_all_images, :success)
  	image = Image.find(:name => "Windows8-ConsumerPreview-64bit-English.iso")
    image.os_type.should == "UNKNOWN"
  end

  it "should update the os_type" do
    savon.expects(:get_all_images).with(message: {}).returns(f :get_all_images, :success)
    savon.expects(:set_image_os_type).with(message: {image_id: '5f58656e-66c3-11e1-8c6f-0025901dfe2a', os_type: 'WINDOWS'}).returns(f :set_image_os_type, :success)
    image = Image.find(:name => "Windows8-ConsumerPreview-64bit-English.iso")
    image.set_os_type("WINDOWS").os_type.should == "WINDOWS"
  end
end