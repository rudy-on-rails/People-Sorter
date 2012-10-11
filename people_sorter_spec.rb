#encoding: utf-8
require 'rspec'
require_relative 'people_sorter'

describe PeopleSorter, 'Sorts people array into new arrays with desired size' do
  let(:people){["Satriani","Hendrix","Steve Vai","Malmsteen", "Petrucci", "Dimebag Darrell"]}

  context "#sort_in_groups_of" do
    it "should return one array with all people case number passed is equal to the number of people" do
      instance = described_class.new(people)
      result = instance.sort_in_groups_of(6)
      result.count.should eq(1)
      people.each do |p|
        result.first.should include(p)
      end
    end

    it "should return two arrays with 3 people each case number passed 3" do
      instance = described_class.new(people)
      result = instance.sort_in_groups_of(3)
      result.count.should eq(2)
      people.each do |p|
        result.flatten.should include(p)
      end
    end

    it "should return three arrays with 2 people each case number passed 2" do
      instance = described_class.new(people)
      result = instance.sort_in_groups_of(2)
      result.count.should eq(3)
      people.each do |p|
        result.flatten.should include(p)
      end
    end

    it "should return an smaller array at last case number is indivisible" do
      instance = described_class.new(people)
      result = instance.sort_in_groups_of(4)
      result.count.should eq(2)
      result.last.count.should eq(2)
      people.each do |p|
        result.flatten.should include(p)
      end
    end

    it "if number is greater than the array size, it should raise an error" do
      instance = described_class.new(people)
      lambda{
        instance.sort_in_groups_of(10)
        }.should raise_error ArgumentError
    end
  end
end