git "#{ENV['HOME']}/.rbenv" do
  repository "git@github.com/rbenv/rbenv.git"
end

directory "#{ENV['HOME']}/.rbenv/plugins"
git "#{ENV['HOME']}/.rbenv/plugins/ruby-build" do
  repository "git@github.com/rbenv/ruby-build.git"
end
