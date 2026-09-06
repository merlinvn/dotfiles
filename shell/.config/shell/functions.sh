# ~/.config/shell/functions.sh

has() {
  command -v "$1" >/dev/null 2>&1
}

mkcd() {
  mkdir -p "$1" && cd "$1" || exit
}

take() {
  mkdir -p "$1" && cd "$1" || exit
}

croot() {
  root="$(git rev-parse --show-toplevel 2>/dev/null)" || return
  cd "$root" || return
}

dipa() {
  has docker || return 1

  docker ps -a -q -f status=exited |
    xargs docker rm -v 2>/dev/null

  docker volume ls -qf dangling=true |
    xargs docker volume rm 2>/dev/null

  docker images -qf dangling=true |
    xargs docker rmi 2>/dev/null
}
