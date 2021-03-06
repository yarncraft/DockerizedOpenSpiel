# DockerizedOpenSpiel
_A dockerfile template containing the OpenSpiel RL environment._

<img src="https://images.unsplash.com/photo-1501003878151-d3cb87799705?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80" height="200" align="right"/>

❗My Dockerfile was merged in the Open_Spiel master branch, and will be kept up to date on that repository from now onwards, more information: https://github.com/deepmind/open_spiel/blob/master/docs/install.md

## Installation 

```bash
git clone https://github.com/yarncraft/DockerizedOpenSpiel.git
cd DockerizedOpenSpiel

docker build -t openspiel .
docker run openspiel build/examples/example --game=tic_tac_toe
```

## Running Python scripts

```bash
docker run openspiel python3 python/examples/matrix_game_example.py
```

## Acknowledgements
_Special thanks to Edward Lockhart https://github.com/elkhrt for helping out!_
