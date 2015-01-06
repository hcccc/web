sudo apt-get update
sudo apt-get install -y build-essential curl git
sudo apt-get install -y zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev libffi-dev
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y docker.io
sudo apt-get clean

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins && git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo -e 'export PATH=~/.rbenv/bin:$PATH' >> ~/.bashrc
echo -e 'eval "$(rbenv init -)"' >> ~/.bashrc
eval "$(rbenv init -)"
export PATH=~/.rbenv/bin:$PATH
export PATH=~/.rbenv/shims:$PATH

rbenv install -v 2.2.0
rbenv rehash
rbenv global 2.2.0
gem install bundle
rbenv rehash

cd ~/app/
bundle config build.nokogiri --use-system-libraries
bundle install --without production

cd ~/
curl -s https://get.docker.io/ubuntu/ | sudo sh
wget -O fig https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m`
sudo mv fig /usr/bin/fig
sudo chmod +x /usr/bin/fig
