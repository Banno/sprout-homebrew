if defined?(ChefSpec)
  def install_sprout_homebrew_cask(homebrew_cask)
    ChefSpec::Matchers::ResourceMatcher.new('sprout-homebrew_cask', :install, homebrew_cask)
  end
end