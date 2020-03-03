# DockerizedOpenSpiel
A dockerfile template containing the OpenSpiel RL environment.

<img src="https://images.unsplash.com/photo-1501003878151-d3cb87799705?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80" height="300" />

## Installation 

```bash
git clone https://github.com/yarncraft/DockerizedOpenSpiel.git
cd DockerizedOpenSpiel

docker build -t openspiel .
docker run openspiel examples/example --game=tic_tac_toe
```

## Acknowledgements
Special thanks to Edward Lockhart https://github.com/elkhrt for helping out!
