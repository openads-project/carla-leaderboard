# carla-leaderboard

<p align="center">
  <a href="https://github.com/openads-project"><img src="https://img.shields.io/badge/OpenADS-f5ff01"/></a>
  <a href="https://github.com/openads-project/carla-leaderboard/releases/latest"><img src="https://img.shields.io/github/v/release/openads-project/carla-leaderboard"/></a>
  <a href="https://github.com/openads-project/carla-leaderboard/blob/main/LICENSE"><img src="https://img.shields.io/github/license/openads-project/carla-leaderboard"/></a>
  <br>
  <img src="https://img.shields.io/badge/CARLA-1.0.0-blueviolet"/>
  <img src="https://img.shields.io/badge/Python-3.12-blueviolet"/>
  <a href="https://github.com/openads-project/carla-leaderboard/actions/workflows/docker.yml"><img src="https://github.com/openads-project/carla-leaderboard/actions/workflows/docker.yml/badge.svg"/></a>
</p>

**Closed-loop evaluation of driving agents on routes and scenarios in CARLA, based on the CARLA Leaderboard**

> [!IMPORTANT]
> This repository is a fork of the official [CARLA Leaderboard](https://github.com/carla-simulator/leaderboard), branch `ue58-dev` for CARLA 1.0 (Unreal Engine 5.8). All initial and following modifications to the original repository are documented in [CHANGELOG_OPENADS.md](./CHANGELOG_OPENADS.md).

> [!IMPORTANT]
> This repository is part of [***OpenADS***](https://github.com/openads-project), the *Open Automated Driving Systems* project. *OpenADS* and its modules have been initiated and are currently being maintained by the [**Institute for Automotive Engineering (ika) at RWTH Aachen University**](https://www.ika.rwth-aachen.de/de/).

> [!TIP]
> We recommend to use the *carla-leaderboard* with the simulation backend [*carla-simulator*](https://github.com/openads-project/carla-simulator) in our open, modular and scalable simulation framework [**OpenADSim**](https://github.com/openads-project/openadsim).

---
---

## Original README

The main goal of the CARLA Autonomous Driving Leaderboard is to evaluate the driving proficiency of autonomous agents in realistic traffic situations. The leaderboard serves as an open platform for the community to perform fair and reproducible evaluations, simplifying the comparison between different approaches.

Autonomous agents have to drive through a set of predefined routes. For each route, agents are initialized at a starting point and have to drive to a destination point. The agents will be provided with a description of the route. Routes will happen in a variety of areas, including freeways, urban scenes, and residential districts.

Agents will face multiple traffic situations based in the NHTSA typology, such as:

* Lane merging
* Lane changing
* Negotiations at traffic intersections
* Negotiations at roundabouts
* Handling traffic lights and traffic signs
* Coping with pedestrians, cyclists and other elements

The user can change the weather of the simulation, allowing the evaluation of the agent in a variety of weather conditions, including daylight scenes, sunset, rain, fog, and night, among others.

More information can be found [here](https://leaderboard.carla.org/)