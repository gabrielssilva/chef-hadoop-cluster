package 'vim'
package 'links'
package 'default-jdk'

tar_extract 'http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz' do
  target_dir '/usr/share/'
end

cookbook_file '/usr/share/hadoop-2.7.3/etc/hadoop/hadoop-env.sh' do
  owner 'vagrant'
  mode '0755'
end
