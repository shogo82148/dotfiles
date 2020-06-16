git "#{ENV['HOME']}/.plenv" do
  repository "git@github.com:tokuhirom/plenv.git"
end

git "#{ENV['HOME']}/.plenv/plugins/perl-build" do
  repository "git@github.com:tokuhirom/Perl-Build.git"
end
