remote_file "#{ENV['HOME']}/Library/Application Support/Code/User/locale.json" do
  source "files/config/locale.json"
end

remote_file "#{ENV['HOME']}/Library/Application Support/Code/User/settings.json" do
  source "files/config/settings.json"
end
