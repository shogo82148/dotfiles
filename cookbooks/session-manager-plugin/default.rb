# session-manager-plugin
# https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-macos

execute "install session-manager-plugin" do
  command <<-EOC
  curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac/sessionmanager-bundle.zip" -o "/tmp/sessionmanager-bundle.zip"
  unzip /tmp/sessionmanager-bundle.zip -d /tmp/
  sudo /tmp/sessionmanager-bundle/install -i /usr/local/sessionmanagerplugin -b /usr/local/bin/session-manager-plugin
  rm -rf /tmp/sessionmanager-bundle/
  rm -f /tmp/sessionmanager-bundle.zip
  EOC
  not_if "test -f /usr/local/bin/session-manager-plugin"
end
