using assembly System.Windows.Forms;
[void][System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic");

$ORG = "tmpBF552ixwzG"

$script = @"
cd '\\wsl.localhost\Ubuntu\tmp'
PowerSession rec -f pages.cast
# PREREQUISITES
# 1.Follow https://tinyurl.com/github-docs-create-orgs
#   Name your org the name you would like your site to have
#   For 'coolsite.github.io' name your org 'coolsite'
#
# 2.Follow https://tinyurl.com/github-docs-CreateOrgPageRepo
#   Name your org page repo under your org profile
#   and match your org name followed by 'github.io' for example
#   if your org is 'coolsite' your repo is 'coolsite.github.io'
#   Ensure you check 'Add a README file' when creating repo.
#   Ensure you set '.gitignore' to 'Ruby'
#   Ensure you set 'visibility' to 'Public'
#
# Pause playback until prereqs are done
Start-Sleep 5
#
# MOVING ON
#
# Show that we are running Windows
Get-ComputerInfo -Property WindowsProductName
# Launch an Ubuntu version of 'Microsoft Linux'
wsl --distribution Ubuntu
# Show that we are running 'Microsoft Linux'
uname -srmo && cat /etc/os-release
# Prepare to install Ruby
sudo apt-get update -y && sudo apt-get upgrade -y
# Install ruby see: https://jekyllrb.com/docs/installation/windows/
sudo apt-get install ruby ruby-dev build-essential dh-autoreconf git
# Set gem installer to use `$HOME/.local
echo 'gem: --user-install' >> {~}/.gemrc
# Manually update path
export PATH=`"`$HOME/.local/share/gem/ruby/3.0.0/bin:`$PATH`"
# Update user .profile with new path
echo '# set PATH so it includes users RUBY bin if it exists'    >> {~}/.profile
echo 'if [ -d `"`$HOME/.local/share/gem/ruby/3.0.0/bin`" ] ; then'  >> {~}/.profile
echo '    PATH=`"`$HOME/.local/share/gem/ruby/3.0.0/bin:`$PATH`"'    >> {~}/.profile
echo 'fi'                                                        >> {~}/.profile
# Install Gems
gem update
# Install Jekyll and bundler
gem install jekyll bundler
# Follow https://tinyurl.com/github-docs-create-jekyll-site
#   I'm using the site https://${ORG}.github.io
#   Skipping first 5 and using 'clone' instead
#
# STEPS 1-5
# Checking out repo
git clone https://github.com/${ORG}/${ORG}.github.io.git
# Changing to our new repo directory
cd ${ORG}.github.io
echo '_site' >> .gitignore
# STEP 6
# Creates a new branch, with no history or contents, called gh-pages, and switches to the gh-pages branch
git checkout --orphan gh-pages
# STEP 7
# Removes the contents from your default branch from the working directory
git rm -rf .
# Creates a Jekyll site in the current directory
jekyll new --skip-bundle .
#
echo '.bundle' >> .gitignore
# STEP 8-11
sed -i 's/{^}gem `"jekyll/# gem `"jekyll/' Gemfile
sed -i 's/{^}# gem `"github-pages.*/gem `"github-pages`", `"{~}> 228`", group: :jekyll_plugins/' Gemfile
# STEP 12
bundle install
# STEP 13
echo 'domain: ${ORG}.github.io'      >> _config.yml
echo 'url: https://${ORG}.github.io' >> _config.yml
# STEP 15
git add .
git commit -m 'Initial GitHub pages site with Jekyll'
# 
git push -u origin gh-pages
# Goto https://github.com/<orgname>/<orgname>.github.io/settings/pages
#   Set 'Source' to 'Deploy from branch'
#   Set 'Branch' to 'gh-pages' and '/ (root)'
#
"@
$cmds = @"
COMMANDS
  PS: Get-ComputerInfo
  PS: wsl
  WSL: uname
  WSL: cat
  WSL: sudo apt-get
  WSL: echo
  WSL: export
  WSL: gem
  WSL: git
  WSL: cd
  WSL: sed
  WSL: jekyll
  WSL: bundle
"@

$short_delay = 1
$long_delay = 500
$eol_delay = 3000

function Send-Line {
  param ($line)
  $delay = $eol_delay
  if ($line[0] -eq '#') {
    $delay = $short_delay
  }
  Start-Sleep -Milliseconds $short_delay
  [System.Windows.Forms.SendKeys]::SendWait($line);
  Start-Sleep -Milliseconds $delay
  [System.Windows.Forms.SendKeys]::SendWait('~');  
}

$app = Get-Process -Id 24536;
[Microsoft.VisualBasic.Interaction]::AppActivate($app.id);
Start-Sleep -Milliseconds $long_delay

foreach ($line in $script.Split("`n")) {
  $line = $line.Trim()
  Send-Line $line
  $bLastWasCmd = $true
  if ($line[0] -ne '#') {
    [void](Read-Host "Enter when Ready")
    [Microsoft.VisualBasic.Interaction]::AppActivate($app.id);
  }
}
# Write-Host $x
 
