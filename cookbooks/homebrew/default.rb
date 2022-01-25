execute 'Install Homebrew' do
  user node[:user]
  command 'yes "" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
  not_if 'test $(which /opt/homebrew/bin/brew)'
end
