# Dotfiles

## Steps to sync `init.vim` to vagrant
1. Find a synced folder for vagrant, for example `~/vagrant/py3`
2. **Hard link** `vimrc` file to the folder
```bash
ln ~/dotfiles/init.vim ~/vagrant/py3/init.vim
```
3. In vagrant, **soft link** the file to vim config folder
```bash
ln -s /vagrant/init.vim ~/.config/nvim/init.vim
```

## Cronjob to sync the repo every ten minites
0,10,20,30,40,50 8-20 * * * ~/dotfiles/cron.sh >>/tmp/cron-stdout.log 2>>/tmp/cron-stderr.log
