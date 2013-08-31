apt_repository "emacs24-ppa" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "CEC45805"
end

if node['emacs24-ppa']['use_snapshot']
  packages = ["emacs-snapshot-el", "emacs-snapshot-gtk", "emacs-snapshot"]
else
  packages = ["emacs24", "emacs24-el", "emacs24-common-non-dfsg"]
end

packages.each do |pkgname|
  package(pkgname) { action :install }
end
