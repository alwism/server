#!/usr/bin/env zsh
# Make relative paths work
# Get FQP of script
VAR_SCRIPT=$(readlink -f "${0}")
# GET FQP of parent of script
VAR_BASEDIR=$(dirname "${VAR_SCRIPT}")
# Change dir to parent
cd "${VAR_BASEDIR}" || (echo "${VAR_BASEDIR}" >&2 && exit 1)

echo "Starting Build"
# Start build with env vars
if [[ -f .env.local ]]; then
  (source '.env' && source '.env.local' && sh -c "./build.sh ${1}" >&2)
else
  (source '.env' && sh -c "./build.sh ${1}" >&2)
fi

echo "Starting Run"
# Start server with env vars
if [[ -f .env.local ]]; then
  (source '.env' && source '.env.local' && sh -c "./run.sh ${1}" >&2)
else
  (source '.env' && sh -c "./run.sh ${1}" >&2)
fi