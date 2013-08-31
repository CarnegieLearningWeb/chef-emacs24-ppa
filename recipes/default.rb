apt_repository "emacs24-ppa" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "CEC45805"
end

if node['emacs24-ppa']['use_snapshot']
  package "emacs-snapshot-el"
  package "emacs-snapshot-gtk"
  package "emacs-snapshot"
else
  package "emacs24"
  package "emacs24-el"
  package "emacs24-common-non-dfsg"
end
