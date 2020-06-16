# preinstallのzshを使います
# package "zsh"

remote_file "#{ENV['HOME']}/.zprofile" do
  source "files/zprofile.sh"
end

remote_file "#{ENV['HOME']}/.zshrc" do
  source "files/zshrc.sh"
end
