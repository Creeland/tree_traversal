require "spec_helper"
require_relative "../tree.rb"

RSpec.describe do
  let(:desired_payload) { 'desired' }
  let(:undesired_payload) { 'undesired' }

  let(:root) { Tree.new(root_payload, [left_side, right_side]) }
  let(:root_payload) { undesired_payload }
  let(:left_side) { nil }
  let(:right_side) { nil }

  # Children
  first_child = Tree.new(4, [])
  second_child = Tree.new(5, [])
  third_child = Tree.new(6, [])
  fourth_child = Tree.new(7, [])

  # Parents
  first_parent = Tree.new(2, [first_child, second_child])
  second_parent = Tree.new(3, [third_child, fourth_child])

  # Grandparent
  ancestor = Tree.new(1, [first_parent, second_parent])  

  describe "depth_first tree traversal" do 
    it "returns a payload of 1" do 
      expect(depth_first(ancestor, 1)).to eq(1)  
    end

    it "returns the first parent's payload" do 
      expect(depth_first(ancestor, 2)).to eq(2)
    end

    it "returns the first child's payload" do
      expect(depth_first(ancestor, 4)).to eq(4)
    end 

    it "returns the second child's payload" do 
      expect(depth_first(ancestor, 5)).to eq(5)
    end

    it "returns the third child's payload" do
      expect(depth_first(ancestor, 6)).to eq(6)
    end 
  end

  describe "#breadth_first" do
    context "when node's payload is the target" do
      let(:root_payload) { desired_payload }

      it "returns its payload" do 
        expect(root.breadth_first(desired_payload)).to eq desired_payload
      end
    end 

    context 'when node DOES NOT have children' do
      let(:left_side) { nil }
      let(:right_side) { nil }

      context "when node's payload is NOT the target" do
        let(:root_payload) { undesired_payload }

        it "returns nil" do
          expect(root.breadth_first(desired_payload)).to be_nil
        end
      end
    end

    context 'when node has children' do 
      context 'when left child contains desired payload' do
        let(:left_side) { Tree.new(desired_payload, [nil, nil]) }

        
      end
    end

    # it "returns the first parent's payload" do 
    #   expect(breadth_first(ancestor, 2)).to eq(2)
    # end

    # it "returns the first child's payload" do
    #   expect(breadth_first(ancestor, 4)).to eq(4)
    # end 

    # it "returns the second child's payload" do 
    #   expect(breadth_first(ancestor, 5)).to eq(5)
    # end

    # it "returns the third child's payload" do
    #   expect(breadth_first(ancestor, 6)).to eq(6)
    # end 
  end
end