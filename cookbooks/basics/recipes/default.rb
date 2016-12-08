package 'vim'
package 'links'
package 'default-jdk'

template '/etc/hosts' do
  owner 'root'
  group 'root'
  mode 0644
end

tar_extract 'http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz' do
  target_dir '/opt/'
end

execute 'chmod:haddop:dir' do
  command 'chown -R vagrant: hadoop-2.7.3 && chmod -R 744 hadoop-2.7.3'
  cwd '/opt'
end

cookbook_file '/opt/hadoop-2.7.3/etc/hadoop/hadoop-env.sh' do
  owner 'vagrant'
  mode '0755'
end

template '/opt/hadoop-2.7.3/etc/hadoop/core-site.xml' do
  owner 'vagrant'
  mode 0644
end

template '/opt/hadoop-2.7.3/etc/hadoop/hdfs-site.xml' do
  owner 'vagrant'
  mode 0644
end

template '/opt/hadoop-2.7.3/etc/hadoop/yarn-site.xml' do
  owner 'vagrant'
  mode 0644
end
