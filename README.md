# RustyDustyTravels.github.io
Website to describe the good (and bad) travel experiences we've had.

[![asciicast](https://asciinema.org/a/594410.svg)](https://asciinema.org/a/594410)

1. Jump through Lesson \#8 on [security-id](https://github.com/brianddk/security-id#readme) repo
2. [Create a new organization](
https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/creating-a-new-organization-from-scratch
) that will be the page name
3. [Install Ruby](https://jekyllrb.com/docs/installation/windows/) (used WSL install method) [note]
3. Follow [Creating Github Pages](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll)
4. [Test site](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)
5. Refine page by [using jekyll](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll)

NOTE: Before the `gem update` and `bundle install` commands, perform the following:

Edit `~/.profile` and add the following lines for Ruby 3.0

```
# set PATH so it includes user's RUBY bin if it exists
if [ -d "$HOME/.local/share/gem/ruby/3.0.0/bin" ] ; then
    PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
fi
```

Default `gem` command to `gem --user-install` to install to `~/.local/share/gem`

```
echo "gem: --user-install" >> ~/.gemrc
```

Default `bundle` command to `bundle --deployment` so installs land in `./vendor/bundle` instead of global system directorys

```
bundle config set --local deployment 'true'
```

`gem update` did failed on some gems like `readline-ext`.  See `$HOME/.local/share/gem/ruby/3.0.0/extensions/x86_64-linux/3.0.0/readline-ext-0.1.5/mkmf.log` 

## Videos

For video files, I suppose the [following discussion](https://github.com/mmistakes/minimal-mistakes/discussions/101) would apply
