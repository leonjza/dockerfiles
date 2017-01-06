# metasploit
Dockerfile for the [metasploit framework](https://github.com/rapid7/metasploit-framework).

## build me with:

```
docker build -t leonjza/metasploit .
```

## run me with

```
docker run --rm --name metasploit -p4444:4444 -it leonjza/metasploit:latest
```
