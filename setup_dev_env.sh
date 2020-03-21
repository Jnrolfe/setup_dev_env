### install xcode cli tools
xcode-select --install

### install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### install iterm2
brew cask install iterm2

### install zsh
brew install zsh

### install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

### configure vim
# copy pre-existing vim config
mv vimrc ~/.vimrc
# colorschemes
mkdir ~/.vim
mv colors ~/.vim/
# vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install plugins
vim +PluginInstall +qall

### install Golang
# prep pathing for .zshrc
echo '
# golang path
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"' >> ~/.zshrc
# install go
brew install go
# install go dev tools
go get golang.org/x/tools/cmd/godoc
go get github.com/golang/lint/golint

### install Python3
# install python3 and pip with homebrew
brew install pyenv
# prep pathing for .zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
source ~/.zshrc
pyenv install $(pyenv install -l | grep -v - | tail -1)
pyenv global $(pyenv install -l | grep -v - | tail -1)
# install pyenv virtualenv with homebrew
brew install pyenv-virtualenv
# automatically load pyenv venv when cd-ing
echo '$(pyenv virtual-init -)' >> ~/.zshrc
echo '
# python venv wrapper function for pyenv virtualenv
venv() {
  if [[ $# -ne 3 ]]; then
    echo "Usage: venv <python_version> <venv_name>"
    exit 2
  else
    pyenv virtualenv $1 $2
  fi
}' >> ~/.zshrc
source ~/.zshrc

### install ruby
# install rbenv for ruby versioning
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo '
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"' >> ~/.zprofile
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zprofile
# install latest ruby version
rbenv install $(rbenv install -l | grep -v - | tail -1)
rbenv global $(rbenv install -l | grep -v - | tail -1)
echo "gem: --no-document" >> ~/.gemrc
# install ruby package manager
gem install bundler

### install js runtime
brew install node

### install postgresql
# install postgresql
brew install postgresql
# init database
initdb /usr/local/var/postgres
# create postgres user
/usr/local/opt/postgres/bin/createuser -s postgres
echo '
# manage postgres
alias start_pg="pg_ctl -D /usr/local/var/postgres start"
alias stop_pg="pg_ctl -D /usr/local/var/postgres stop"
alias pg_status="pg_ctl -D /usr/local/var/postgres status"' >> ~/.zshrc
# finishing message
echo "
TODO: set password for postgres user:
psql postgres
\password postgres"


