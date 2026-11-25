#!/usr/bin/env python

# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

"""
Evaluation protocols (OpenADS), selected with --protocol on the evaluator.

- default: the upstream leaderboard rules, unchanged.
- b2d: the rules Bench2Drive adds to leaderboard 2.0, so that routes run on CARLA 1.0 can be compared
  with the same routes run by Bench2Drive's evaluator on CARLA 0.9.15: a limit of 4000 ticks per route,
  a blocked timeout of 60 s, 20 minimum-speed checkpoints with an event at every checkpoint (the input
  of Bench2Drive's efficiency metric), the agent's global plan downsampled by 50 instead of 200, and
  Bench2Drive's scoring: the one of leaderboard 2.0 without its minimum-speed penalty
  (statistics_manager.py).
"""

PROTOCOLS = {
    'default': {
        'tick_limit': None,
        'blocked_time': 180.0,
        'min_speed_checkpoints': 4,
        'min_speed_event_every_checkpoint': False,
        'scoring': 'upstream',
        'plan_downsample': 200,
    },
    'b2d': {
        'tick_limit': 4000,
        'blocked_time': 60.0,
        'min_speed_checkpoints': 20,
        'min_speed_event_every_checkpoint': True,
        'scoring': 'bench2drive',
        'plan_downsample': 50,
    },
}

_name = 'default'


def set_protocol(name):
    """Selects the protocol that get() reads from"""
    global _name
    if name not in PROTOCOLS:
        raise ValueError("Unknown protocol '{}', choose from {}".format(name, sorted(PROTOCOLS)))
    _name = name


def get(key):
    """Returns a value of the selected protocol"""
    return PROTOCOLS[_name][key]


class TickLimitReached(Exception):
    """Raised when a route exceeds the tick limit of the selected protocol"""
