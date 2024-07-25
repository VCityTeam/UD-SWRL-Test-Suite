# SWRL Rule Test Suite
A proof of concept test suite for reasoning over RDF/OWL knowledge graphs with SWRL rules

## Links

- Sources available on [Github](https://github.com/VCityTeam/UD-SWRL-Test-Suite-docker)
- Images published on [Docker hub](https://hub.docker.com/r/vcity/ud-swrl-test-suite).

## Usage
To run the container:
```bash
docker run [--rm] [-v mountpoint] vcity/ud-swrl-test-suite [-h] rule_file test_file
```

For example, to display the full usage:
```bash
docker run vcity/ud-swrl-test-suite -h
```

It is required to mount a folder to be able to use the test suite to read/write files.
Remember to use fully qualified paths from within the container.
For example to mount your current directory which contains a *rule_file* named `./rules.json` and a *test_file* named `./tests.json`:
```bash
docker run --rm -v ${PWD}:/io vcity/ud-swrl-test-suite /io/rules.json /io/tests.json
```

> [!TIP]
> Remember to use fully qualified paths in your `test_file` **from the perspective of the container** 
