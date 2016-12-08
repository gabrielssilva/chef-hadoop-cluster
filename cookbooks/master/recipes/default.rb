execute 'ssh:keygen' do
  command "ssh-keygen -f id_rsa -t rsa -N '' && cat id_rsa.pub >> authorized_keys && chmod 600 authorized_keys"
  cwd '/home/vagrant/.ssh'
  user 'vagrant'
end

template '/opt/hadoop-2.7.3/etc/hadoop/mapred-site.xml' do
  owner 'vagrant'
  mode 0644
end

template '/opt/hadoop-2.7.3/etc/hadoop/slaves' do
  owner 'vagrant'
  mode 0644
end

#execute 'hdfs:format' do
#  command './hdfs namenode -format'
#  cwd '/opt/hadoop-2.7.3/bin'
#  user 'vagrant'
#end
