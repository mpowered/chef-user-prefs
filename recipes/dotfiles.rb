# Searches data bag "users" for attribute "dotfiles_repo".
# Installs dotfiles repo for each user with attribute.

user_prefs_manage "dotfiles" do
  action [:create]
end
