require "spec_helper"
require_relative "../tree.rb"

Rspec.describe do
  describe "depth_first tree traversal" do 
    it "should return a payload of 1" do 
      expect(depth_first(ancestor)).to eq(1)  
    end
  end
end