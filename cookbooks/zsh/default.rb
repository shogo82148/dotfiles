# preinstallのzshを使います
# package "zsh"

homebrew_bin = ''
case node[:arch]
when 'x86_64'
  homebrew_bin = '/usr/local/bin'
when 'arm64'
  homebrew_bin = '/opt/homebrew/bin'
else
  raise ArgumentError, "unknown arch: #{node[:arch]}"
end

template "#{ENV['HOME']}/.zprofile" do
  source "templates/zprofile.sh"
  variables(homebrew_bin: homebrew_bin)
end

template "#{ENV['HOME']}/.zshrc" do
  source "templates/zshrc.sh"
  variables(homebrew_bin: homebrew_bin)
end
