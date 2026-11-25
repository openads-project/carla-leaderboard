# CARLA Leaderboard evaluator for CARLA 1.0 (Unreal Engine 5.8), built on the CARLA Python API client
# image of openads-project/carla-simulator. Build from the repository root:
#
#   docker build -t carla-leaderboard .

ARG CARLA_CLIENT_IMAGE=ghcr.io/openads-project/carla-simulator:client_v1.0.0-1.0.0
FROM ${CARLA_CLIENT_IMAGE}

ENV LEADERBOARD_ROOT=/workspace/leaderboard \
    TEAM_CODE_ROOT=/workspace/team_code
# The entrypoint of the client image adds the CARLA PythonAPI to the path as well; it is set here too,
# so that the evaluator also imports when the entrypoint is replaced.
ENV PYTHONPATH=/opt/carla/PythonAPI/carla:${LEADERBOARD_ROOT}

COPY requirements.txt /tmp/leaderboard-requirements.txt
RUN pip install --no-cache-dir --break-system-packages -r /tmp/leaderboard-requirements.txt

COPY . ${LEADERBOARD_ROOT}
RUN mkdir -p ${TEAM_CODE_ROOT} /workspace/results

WORKDIR ${LEADERBOARD_ROOT}
CMD ["python3", "leaderboard/leaderboard_evaluator.py", "--help"]
