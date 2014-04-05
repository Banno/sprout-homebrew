include_recipe "homebrew"

bash "tap phinze/homebrew-cask" do
  action :run
  not_if do `brew cask list`.include? 'google-chrome' end
end

bash "brew install brew-cask" do
  action :run
  not_if do system("brew cask list") end
end

directory '/opt/homebrew-cask/Caskroom' do
  action :create
  recursive true
  mode '0755'
  owner node['current_user']
  group 'staff'
  not_if do File.exists?('/opt/homebrew-cask/Caskroom') end
end

directory '/opt/homebrew-cask' do
  owner node['current_user']
  not_if do File.exists?('/opt/homebrew-cask') end
end

execute 'update cask' do
  user node['current_user']
  command '/usr/local/bin/brew upgrade brew-cask || true'
end
