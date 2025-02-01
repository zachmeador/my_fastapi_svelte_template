# mySvelteFastApp

a template for building an application with a fastapi backend and a svelte frontend.

includes:
- fastapi backend with cors enabled
- svelte frontend with vite
- python-uv for dependencies
- dev script

## prerequisites

- python 3.12+
- python-uv
- node.js & npm

## usage

run everything with:

    ./dev.sh

this starts:
- backend at http://localhost:8000
- frontend at http://localhost:5173

the dev script will:
- set up python environment
- install dependencies
- start both servers
- handle cleanup on exit

## license

mit