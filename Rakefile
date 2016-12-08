require 'yaml'
require "chake"

hosts = YAML.load_file('config/hosts.yaml')
$nodes.each do |node|
  node.data['hosts'] = hosts
end
