define :darwin_app, source: nil do
  source = params[:source] || params[:name]
  execute "brew install #{source} --appdir=\"/Applications\" --cask" do
    not_if "brew list --cask | grep -q #{source}"
  end
end

define :go_package, source: nil do
	source = params[:source] || params[:name]
	if !FileTest.exists?(ENV['GOPATH'] || "~/go/src/#{source}"); then
		execute "go get -u #{source}" do
		end
	end
end
