# Installs the leaderboard into the docker-ros image. docker-ros appends this script to its install
# script (run with `set -e` after the ROS dependencies are installed).

LEADERBOARD_ROOT=/docker-ros/additional-files
CARLA_ARTIFACTS_URL="https://github.com/openads-project/carla-simulator/releases/download/v1.0.0-1.0.0/PythonAPI.tar.gz"

# docker-ros copies the repository with `ADD ./*`, which puts the contents of each top-level directory
# directly into additional-files. Link the paths that the evaluator and the route files use.
ln -s . "$LEADERBOARD_ROOT/leaderboard"
ln -s . "$LEADERBOARD_ROOT/data"

# The paths of the Compose file and the Helm values under deployment.
mkdir -p /workspace/team_code /workspace/results
ln -s "$LEADERBOARD_ROOT" /workspace/leaderboard

# CARLA Python API of the carla-simulator release: the carla wheel for this Python and the agents package.
mkdir -p /opt/carla
curl --fail --location --output /tmp/PythonAPI.tar.gz "$CARLA_ARTIFACTS_URL"
tar -xzf /tmp/PythonAPI.tar.gz -C /opt/carla
rm /tmp/PythonAPI.tar.gz
pip install --no-cache-dir /opt/carla/PythonAPI/carla/dist/carla-*-cp$(python3 -c 'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")')-*.whl
pip install --no-cache-dir -r /opt/carla/PythonAPI/carla/requirements.txt -r "$LEADERBOARD_ROOT/requirements.txt"

# Environment of the evaluator, sourced by every interactive shell (docker-ros commands run `bash -ic`).
cat > /opt/carla/setup.bash << EOF
export LEADERBOARD_ROOT=/workspace/leaderboard
export TEAM_CODE_ROOT=/workspace/team_code
export PYTHONPATH=\$PYTHONPATH:/opt/carla/PythonAPI/carla:/workspace/leaderboard
EOF
echo "source /opt/carla/setup.bash" >> /root/.bashrc
