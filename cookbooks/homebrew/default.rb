execute 'Install Homebrew' do
  user node[:user]
  command 'yes "" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
  case node[:arch]
  when 'x86_64'
    not_if 'test $(which /usr/local/bin/brew)'
  when 'arm64'
    not_if 'test $(which /opt/homebrew/bin/brew)'
    ENV['PATH'] = "/opt/homebrew/bin:#{ENV['PATH']}"
  else
    raise ArgumentError, "unknown arch: #{node[:arch]}"
  end
end
