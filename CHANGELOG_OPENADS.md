# OpenADS specific changes

Based on the CARLA Leaderboard for CARLA 1.0.0 (Unreal Engine 5.8), upstream branch `ue58-dev` up to `8ee0dcb7`.

- Added a Docker image of the evaluator, built on the CARLA client image of `carla-simulator`.
- Added a Docker Compose service and a Helm chart for the evaluator under `deployment`, using the shared OpenADS `openadservice` chart.
- Added GitHub workflows that publish the image, the Compose file and the Helm chart. Releases are tagged `v<CARLA version>-<OpenADS version>`, starting with `v1.0.0-1.0.0` on CARLA 1.0.0.
- Removed the unused `opencv-python` requirement.
- Fixed the handling of actors that are already destroyed, such as stuck vehicles the Traffic Manager removes, which raised and could stop the route.
