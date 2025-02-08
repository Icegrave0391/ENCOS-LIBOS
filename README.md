# ENCOS-LIBOS

A modified prototype of Gramine LibOS for our research prototype EuroSys'25 paper "Erebor: A Drop-In Sandbox Solution for Private Data Processing in Untrusted Confidential Virtual Machines".

> [!CAUTION]
> This LibOS current is only designed to work inside [Erebor](https://github.com/ASTERISC-Release/Erebor)'s guest VM.
> Please clone this repo, and follow the remaining instructions to build it within a guest VM. The guest VM can be created by following Erebor's [setup](https://github.com/ASTERISC-Release/Erebor).
> As a prototype, it may contains bugs.

## Pre-req

Execute the following commands within your guest VM environment:

* Clone this repo and run `git submodule update --init --recursive`.

* Execute `./pre-req.sh`.

> To quickly understand gramine's usage and their manifest syntax, you may want to refer to their document: https://gramine.readthedocs.io/en/stable/.

## Build LibOS and run with programs

```bash
./build-gramine.sh
```

After build, `gramine-encos` should be added to the `$PATH` of your guest VM. Refer to `gramine/CI-Examples/helloworld` to see the workflow:

* Editing the template `.manifest.template` and `Makefile` files.
* Build the program by `make`.
* Execute the program by `gramine-encos helloworld`.
