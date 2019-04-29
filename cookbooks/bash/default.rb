package "bash"

remote_file "#{ENV['HOME']}/.bash_logout" do
  source "files/bash_logout.sh"
end

remote_file "#{ENV['HOME']}/.bash_profile" do
  source "files/bash_profile.sh"
end

remote_file "#{ENV['HOME']}/.bashrc" do
  source "files/bashrc.sh"
end
