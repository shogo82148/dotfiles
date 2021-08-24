# from https://github.com/toritori0318/itamae-sample-project/blob/master/entrypoint.rb

include_recipe "lib/function.rb"

node["arch"] = run_command('uname -m').stdout.chomp

node["recipes"] = node["recipes"] || []

node["recipes"].each do |recipe|
  include_recipe recipe
end
