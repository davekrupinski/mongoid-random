require 'test_helper'

describe Mongoid::Random do

  context "Generating the key" do
    setup { @test = Randomized.new }

    should "initially start with a nil key" do
      assert_nil @test._randomization_key
    end

    should "generate a key between 0 and 1 on create" do
      assert @test.save
      assert (0..1).include?(@test._randomization_key)
    end
  end

  context "Querying" do
    setup { @test = Randomized.create }

    should "always pull @test in random query" do
      4.times do
        assert_equal @test, Randomized.random.one
      end
    end

    context "when there are 2 possible records" do
      setup { @test2 = Randomized.create }

      should "have 2 records to choose from" do
        assert_equal 2, Randomized.count
      end

      should "only pull 1 record for :random" do
        3.times do
          assert_equal 1, Randomized.random.to_a.size
        end
      end

      should "pull both for :random of 2" do
        assert_equal 2, Randomized.random(2).to_a.size
      end

      should "have both outcomes from random 2 queries" do
        outcomes = 100.times.inject(Array.new) { |a, i| a << Randomized.random(2).to_a; a }
        assert_equal [ [ @test, @test2 ], [ @test2, @test ] ].sort, outcomes.uniq.sort
      end
    end
  end

end
