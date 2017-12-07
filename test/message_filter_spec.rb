require 'spec_helper'
require 'message_filter'

RSpec.describe MessageFilter do
    before(:each) do
        @filter = MessageFilter.new('foo')
    end
    it 'should detect message with NG word' do
        # filter = MessageFilter.new('foo')
        expect(@filter.detect?('hello from foo')).to be true
    end
    it 'should not detect message without NG word' do
        # filter = MessageFilter.new('foo')
        expect(@filter.detect?('hello world!')).to be false
    end
end
