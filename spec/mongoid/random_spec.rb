require 'spec_helper'

describe Mongoid::Random do

  describe "#generate_mongoid_random_key" do

    subject { Randomized.new }

    it "initially start with a nil key" do
      subject._randomization_key.should be_nil
    end

    it "should generate a key between 0 and 1 on create" do
      subject.save!
      subject._randomization_key.should be_between(0, 1)
    end

  end


  describe ".random" do

    let!(:doc1) { Randomized.create }

    it "always pull @doc1 in random query" do
      4.times do
        Randomized.random.one.should eq doc1
      end
    end

    context "when there are 2 possible records" do

      let!(:doc2) { Randomized.create }

      it "has 2 records to choose from" do
        Randomized.count.should be 2
      end

      it "only retrieves 1 record for :random" do
        3.times do
          Randomized.random.to_a.size.should be 1
        end
      end

      it "retrieves for :random of 2" do
        Randomized.random(2).to_a.size.should be 2
      end

      it "have both outcomes from random 2 queries" do
        outcomes = 100.times.inject(Array.new) { |a, i| a << Randomized.random(2).to_a; a }
        outcomes.uniq.sort.should eq [ [ doc1, doc2 ], [ doc2, doc1 ] ].sort
      end

    end

  end

end
