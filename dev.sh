#!/bin/bash

# kill any existing processes (more reliable on macos)
pkill -f "uvicorn" || true
pkill -f "vite" || true

# create and setup python environment if needed
if [ ! -d ".venv" ]; then
    echo "creating python virtual environment..."
    uv venv
fi

# activate virtual environment and install dependencies
source .venv/bin/activate
uv pip install -e .

# start backend (fastapi)
cd backend
uvicorn app.main:app --reload &
backend_pid=$!
cd ..

# start frontend (svelte)
cd frontend
npm install
npm run dev &
frontend_pid=$!
cd ..

# wait for both processes
wait $backend_pid $frontend_pid

# cleanup on exit
trap 'kill $backend_pid $frontend_pid 2>/dev/null' EXIT INT TERM

# the backend will be available at http://localhost:8000
# the frontend will be available at http://localhost:5173
