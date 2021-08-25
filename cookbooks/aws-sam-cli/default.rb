execute "brew tap aws/tap" do
  not_if "brew tap | grep -q '^aws/tap$'"
end

package 'aws-sam-cli'
