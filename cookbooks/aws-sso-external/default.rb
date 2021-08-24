# install aws-sso-external
# https://github.com/kabesan/aws-sso-external

VERSION='0.0.2'

github_binary 'aws-sso-external' do
    arch = node[:arch] == 'x86_64' ? 'amd64' : 'arm64'
    repository 'kabesan/aws-sso-external'
    version "v#{VERSION}"
    archive "aws-sso-external_#{VERSION}_darwin_#{arch}.tar.gz"
end
