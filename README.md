Description
===========

Sets up user preferences. Currently this consists of cloning the users dotfile repo, if provided in the users data bag.

Requirements
============

  git

Attributes
==========

    knife data bag users bofh
    {
      "id": "bofh",
      "dotfiles_repo": {
        "url" : "https://github.com/username/dotfiles.git",
        "install" : "command_to_install_dotfiles"
      }
    }

Usage
=====

Note that the `install` option given above is executed as given, so should only be run for trusted users.

