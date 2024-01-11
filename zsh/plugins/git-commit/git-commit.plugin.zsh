local -A git_commit_aliases=(
  'build' '🔨'
  'chore' '🔧'
  'ci' '👷'
  'docs' '📝'
  'feat' '✨'
  'fix' '🐛'
  'perf' '⚡️'
  'refactor' '♻️'
  'revert' '⏪️'
  'style' '💄'
  'test' '✅'
)

local alias k
for k v ("${(@kv)git_commit_aliases}"); do
  # an alias can't be named "revert" because the git command takes precedence
  # https://stackoverflow.com/a/3538791
  case "$k" in
  revert) alias=rev ;;
  *) alias=$k ;;
  esac

  local func='!a() { if [ "$1" = "-s" ] || [ "$1" = "--scope" ]; then local scope="$2"; shift 2; git commit -m "'$v' (${scope}): ${@}"; else git commit -m "'$v' ${@}"; fi }; a'
  if ! git config --global --get-all alias.${alias} >/dev/null 2>&1; then
    git config --global alias.${alias} "$func"
  fi
done

unset git_commit_aliases alias k func
