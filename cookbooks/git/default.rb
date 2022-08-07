package "git"

# configure dotfiles
directory "#{ENV['HOME']}/.config"
directory "#{ENV['HOME']}/.config/git"

remote_file "#{ENV['HOME']}/.config/git/config" do
  source "files/config"
end

remote_file "#{ENV['HOME']}/.config/git/ignore" do
  source "files/ignore"
end

remote_directory "#{ENV['HOME']}/.config/git/template" do
  source "files/template"
end
