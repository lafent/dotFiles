#!/bin/bash -e
#
# Updates Vim plugins.
#
# Update everything (long):
#
#   ./update.sh
#
# Update just the things from Git:
#
#   ./update.sh repos
#
# Update just one plugin from the list of Git repos:
#
#   ./update.sh repos powerline
#

# cd ~/.dotfiles
cd ~

vimdir=$PWD/.vim
bundledir=$vimdir/bundle
tmp=/tmp/$LOGNAME-vim-update
me=.vim/update.sh

# I have an old server with outdated CA certs.
if [ -n "$INSECURE" ]; then
  curl='curl --insecure'
  export GIT_SSL_NO_VERIFY=true
else
  curl='curl'
fi

# URLS --------------------------------------------------------------------

# This is a list of all plugins which are available via Git repos. git:// URLs
# don't work.
# https://github.com/hced/bufkill-vim.git
# https://github.com/vim-scripts/Railscasts-Theme-GUIand256color.git
# https://github.com/vim-scripts/oceandeep.git
# https://github.com/vim-scripts/lighttpd-syntax.git
repos=(
  # https://github.com/Lokaltog/vim-easymotion.git
  # https://github.com/vim-airline/vim-airline.git
  # https://github.com/vim-airline/vim-airline-themes.git
  # https://github.com/altercation/vim-colors-solarized.git
  # https://github.com/ap/vim-css-color.git
  # https://github.com/docunext/closetag.vim.git
  # https://github.com/kchmck/vim-coffee-script.git
  # https://github.com/kien/ctrlp.vim.git
  # https://github.com/nono/vim-handlebars.git
  # https://github.com/pangloss/vim-javascript.git
  https://github.com/scrooloose/nerdtree.git
  https://github.com/scrooloose/syntastic.git
  https://github.com/tpope/vim-git.git
  https://github.com/tpope/vim-fireplace.git
  https://github.com/tpope/vim-fugitive.git
  https://github.com/tpope/vim-haml.git
  https://github.com/tpope/vim-markdown.git
  https://github.com/tpope/vim-pathogen.git
  https://github.com/tpope/vim-surround.git
  https://github.com/tpope/vim-unimpaired.git
  # https://github.com/vim-scripts/keepcase.vim.git
  # https://github.com/wavded/vim-stylus.git
  # https://github.com/nelstrom/vim-visual-star-search.git
  # https://github.com/nelstrom/vim-markdown-folding.git
  # https://github.com/digitaltoad/vim-jade.git
  https://github.com/majutsushi/tagbar.git
  https://github.com/kien/rainbow_parentheses.vim.git
  # https://github.com/guns/vim-clojure-static.git
  # https://github.com/andreshazard/vim-freemarker.git
  # https://github.com/derekwyatt/vim-scala.git
  # https://github.com/udalov/kotlin-vim.git
  https://github.com/chriskempson/base16-vim.git
  # https://github.com/PProvost/vim-ps1.git
  # https://github.com/will133/vim-dirdiff.git
  # https://github.com/leafgarland/typescript-vim.git
)

# Here's a list of everything else to download in the format
# <destination>;<url>[;<filename>]
other=(
  # 'zenburn/colors;http://slinky.imukuppi.org/zenburn/zenburn.vim'
  # 'wombat/colors;http://files.werx.dk/wombat.vim'
  # 'glsl/syntax;http://www.vim.org/scripts/download_script.php?src_id=3194;glsl.vim'
  )

case "$1" in

  # GIT -----------------------------------------------------------------
  repos)
    mkdir -p $bundledir
    for url in ${repos[@]}; do
      if [ -n "$2" ]; then
        if ! (echo "$url" | grep "$2" &>/dev/null) ; then
          continue
        fi
      fi
      dest="$bundledir/$(basename $url | sed -e 's/\.git$//')"
      rm -rf $dest
      echo "Cloning $url into $dest"
      git clone $url $dest
      rm -rf $dest/.git
    done
    ;;

  # TARBALLS AND SINGLE FILES -------------------------------------------
  other)
    set -x
    mkdir -p $bundledir
    rm -rf $tmp
    mkdir $tmp
    pushd $tmp

    for pair in ${other[@]}; do
      parts=($(echo $pair | tr ';' '\n'))
      name=${parts[0]}
      url=${parts[1]}
      filename=${parts[2]}
      dest=$bundledir/$name

      rm -rf $dest

      if echo $url | egrep '.zip$'; then
        # Zip archives from VCS tend to have an annoying outer wrapper
        # directory, so unpacking them into their own directory first makes it
        # easy to remove the wrapper.
        f=download.zip
        $curl -L $url >$f
        unzip $f -d $name
        mkdir -p $dest
        mv $name/*/* $dest
        rm -rf $name $f

      else
        # Assume single files. Create the destination directory and download
        # the file there.
        mkdir -p $dest
        pushd $dest
        if [ -n "$filename" ]; then
          $curl -L $url >$filename
        else
          $curl -OL $url
        fi
        popd

      fi

    done

    popd
    rm -rf $tmp
    ;;

  # HELP ----------------------------------------------------------------

  all)
    $me repos
    $me other
    echo
    echo "Update OK"
    ;;

  *)
    set +x
    echo
    echo "Usage: $0 <section> [<filter>]"
    echo "...where section is one of:"
    grep -E '\w\)$' $me | sed -e 's/)//'
    echo
    echo "<filter> can be used with the 'repos' section."
    exit 1

esac
