apt_repository "emacs24-ppa" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node['lsb']['codename']
  components ['main']
  keyserver "keyserver.ubuntu.com"
  key "CEC45805"
end

if node['emacs24-ppa']['use_snapshot']
  to_install = ["emacs-snapshot-el", "emacs-snapshot-gtk", "emacs-snapshot"]
  to_remove  = ["emacs24", "emacs24-el", "emacs24-common-non-dfsg"]
else
  to_install = ["emacs24", "emacs24-el", "emacs24-common-non-dfsg"]
  to_remove  = ["emacs-snapshot-el", "emacs-snapshot-gtk", "emacs-snapshot"]
end

to_remove.each do |pkgname|
  package(pkgname) { action :remove }
end

to_install.each do |pkgname|
  package(pkgname) { action :install }
end
