# OpenADS specific changes

Based on the CARLA Leaderboard for CARLA 1.0.0 (Unreal Engine 5.8), upstream branch `ue58-dev` up to `8ee0dcb7`.

- Added a Docker image of the evaluator, built with docker-ros on ROS 2 Jazzy with the CARLA Python API of the `carla-simulator` release. The evaluator runs without ROS, but other functions and agents can use ROS 2.
- Added a Docker Compose service and a Helm chart for the evaluator under `deployment`, using the shared OpenADS `openadservice` chart.
- Added GitHub workflows that publish the image, the Compose file and the Helm chart. Releases are tagged `v<CARLA version>-<OpenADS version>`, starting with `v1.0.0-1.0.0` on CARLA 1.0.0.
- Removed the unused `opencv-python` requirement.
- Fixed the handling of actors that are already destroyed, such as stuck vehicles the Traffic Manager removes, which raised and could stop the route.
- Added the evaluation protocols `default` (upstream rules) and `b2d` (Bench2Drive's rules), selected with `--protocol`.
- Added a tick function (`SimulationData.set_tick_function`) through which every tick of the evaluator goes, for example to step another simulation in lockstep or to pace and gate the run. A script that sets it and then calls `leaderboard_evaluator.main()` can run the evaluator with it.
- Added stop signs from a file for maps without `traffic.stop` actors (CARLA 1.0's Town12 and Town13 have the sign meshes and OpenDRIVE signals, but no stop sign actors, so `RunningStopTest` checked no stop there): `RunningStopTest` reads `$OPENADS_STOP_SIGNS_DIR/<town>.json` if the map has none.