#!/bin/sh

git_dir="${HOME}/dev/github/git_study/.git"
refname="myref"
oldrev="a3d75d0"
newrev="894b83b"

GIT_DIR=${git_dir} ${git_dir}/hooks/update ${refname} ${oldrev} ${newrev}
