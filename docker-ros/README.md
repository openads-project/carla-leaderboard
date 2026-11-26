# `carla-leaderboard` image

The image of the CARLA leaderboard evaluator, `ghcr.io/openads-project/carla-leaderboard`, built with [docker-ros](https://github.com/ika-rwth-aachen/docker-ros) on `rwthika/ros2:jazzy` with `rmw_zenoh_cpp`. The evaluator runs without ROS as in upstream, but other functions and agents can use ROS 2.

The leaderboard is in `/workspace/leaderboard`, own agents go to `/workspace/team_code` and results to `/workspace/results`. Commands run with `bash -ic`, which sets up the environment.

| File | Role |
| --- | --- |
| [`custom.sh`](custom.sh) | installs the CARLA Python API of the `carla-simulator` release and the requirements, and links the paths above |
| [`carla-leaderboard-ros.repos`](carla-leaderboard-ros.repos) | ROS packages built into the image: `perception_msgs` |
| [`../.github/workflows/docker-ros.yml`](../.github/workflows/docker-ros.yml) | publishes the image: `latest` from `main`, `latest_<branch>_ci` from other branches, the tag name from release tags |
