darwin_app "visual-studio-code"
remote_file "/usr/local/bin/code"

%w(
  bungcip.better-toml
  coolbear.systemd-unit-file
  CraigMaslowski.erb
  felixfbecker.php-intellisense
  mauve.terraform
  mechatroner.rainbow-csv
  mrmlnc.vscode-apache
  MS-CEINTL.vscode-language-pack-ja
  ms-python.python
  ms-vscode.cpptools
  ms-vscode.csharp
  ms-vscode.Go
  ms-vsliveshare.vsliveshare
  octref.vetur
  rebornix.ruby
  redhat.java
  streetsidesoftware.code-spell-checker
  timonwong.shellcheck
  VisualStudioExptTeam.vscodeintellicode
  vscjava.vscode-java-debug
  vscjava.vscode-java-dependency
  vscjava.vscode-java-pack
  vscjava.vscode-java-test
  vscjava.vscode-maven
).each do |ext|
  execute "visual-studio-code extension #{ext}" do
    command ["code", "--install-extension", ext]
    not_if "code --list-extensions | grep -F #{ext}"
  end
end

remote_file "#{ENV['HOME']}/Library/Application Support/Code/User/locale.json" do
  source "files/config/locale.json"
end

remote_file "#{ENV['HOME']}/Library/Application Support/Code/User/settings.json" do
  source "files/config/settings.json"
end
