#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

if ! branch=$(git symbolic-ref --quiet --short HEAD); then
    echo "This workspace is viewing an older version. Ask your mentor to switch back to your working branch."
    exit 1
fi
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "GitHub backup is not connected. Ask your mentor to configure the origin remote."
    exit 1
fi
if [[ -n "$(git ls-files --unmerged)" ]]; then
    echo "Some changes need to be reconciled. Ask your mentor for help before saving."
    exit 1
fi
if ! git var GIT_AUTHOR_IDENT >/dev/null 2>&1 || ! git var GIT_COMMITTER_IDENT >/dev/null 2>&1; then
    echo "Your name and email need to be configured. Ask your mentor to finish the Git identity setup."
    exit 1
fi

git add --all
if ! git diff --cached --quiet; then
    git commit -m "Save coursework ($(date -u '+%Y-%m-%d %H:%M:%S UTC'))"
fi

if ! git push --set-upstream origin "$branch"; then
    echo "Your work is saved in this Codespace, but the GitHub backup did not finish."
    echo "Check your connection and try Save my work again. If it still fails, ask your mentor."
    exit 1
fi

echo "Saved and backed up to GitHub."
