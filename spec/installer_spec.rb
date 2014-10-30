# encoding: UTF-8
describe 'wix::installer' do

  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should include the dotnetframework' do
    expect(chef_run).to include_recipe 'dotnetframework'
  end
end
