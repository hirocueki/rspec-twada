require 'spec_helper'

# [Built in matchers - RSpec Expectations - RSpec - Relish](https://relishapp.com/rspec/rspec-expectations/v/3-7/docs/built-in-matchers)

RSpec.describe do
    it "Equality expectation" do
        expect(true).to be true
        expect(false).to be false
        expect(false).to be_falsey
        expect(1).to be_truthy
        expect(nil).to be_falsey
        expect(nil).to be_nil
    end

    it "Predicate matchers" do
        expect([]).to be_empty
        expect(:a => 1).to have_key(:a)
    end

    it "Collection membership" do
        expect([1,2,3]).to include(1)
        expect([1,2,3]).to include(1,2)
        expect(:a => 'b').to include(:a => 'b')
        expect("this string").to include("is str")
        expect([1,2,3]).to contain_exactly(2,1,3)
        expect([1,2,3]).to match_array([3,2,1])
    end

    it "Ranges (1.9+ only" do
        expect(1..10).to cover(3)
    end

    it "Change observation" do
        a = 1
        expect { a+=1 }.to change { a }.by(1)
        expect { a+=3 }.to change { a }.from(2)
        expect { a+=3 }.to change { a }.by_at_least(2)
    end

    # skip する場合、 it -> xit
    xit "Output capture" do
        expect { 1 }.to output("one").to_stdout
    end

    it "Block expectation" do
        # expect { |b| User.transaction(&b) }.to yield_control
        expect { |b| 5.tap(&b) }.to yield_with_args(5)
        expect { |b| [1,2,3].each(&b) }.to yield_successive_args(1,2,3)
    end
end