require 'spec_helper'
describe 'rhevagent' do

  context 'with defaults for all parameters' do
    it { should contain_class('rhevagent') }
  end
end
