# _CONJURE_

### A code generation experiment.

# Rationale

A lot of the software development grind can be automated away, but the cost of implementing it during the development
process usually requires incurring a cost. What if a project was started with the mindset that all of it needed to be
generated from a script? With that sort of frame of reference, it heavily follows that it'd make the most sense to use
generators and other sources to minimize the amount of logic needed to be added into the script itself. With this
direction established, I did some research into how one might go about generating a large fraction of a web application
code base, and after about an hour worth of googling, I settled on PHP, symfony with the makerBundle's make commands
for backend code generation and angular's ng CLI for frontend code generation. The idea is to generate as much of the
skeleton code as I can and then use chatGPT3.5 to fill in the gaps and implement the needed business logic.

# Rules

Below are the guidelines for this project.

| #  | Rule description                                                     |
|----|----------------------------------------------------------------------|
| 1. | All code must be generated via script or ChatGPT3.5.                 |
| 2. | All usages of ChatGPT3.5 must be completed in a single prompt.       |
| 3. | All code modifications must be performed via execution of a command. |

## Rule number 1

You're not allowed to directly program anything. You have to use generators and an AI assistant to generate the code for
you. You're allowed to create wild invocations of generator commands and selectively pull code from AI assistant
generated code, but you simply cannot write invocations like `sed -i '5i    logic();\n    moreLogic();\n' filename.php`.

## Rule number 2

Multi prompt conversations are not allowed; only a single prompt response is allowed. A script for pulling the response
text from a given share URL has been provided. Additionally, once a URL is used, it may not be used again.

## Rule number 3

All additions, removals, modifications, updates, whatever, must be performed via the execution of a command. Need to add
a new line? Make a CLI invocation for it. Need to pull in some code from ChatGPT3.5? Make a curl request, regex the
response, and insert it where it's supposed to go.

# Plan of Attack

1. Create an API backend using the `bin/console make` commands.
2. Create a frontend using `ng generate` commands.
3. Use ChatGPT3.5 to fill in the gaps

> Note: The resulting code needs to be extracted via share URL and inserted via script.

# Quickstart

`scripts/angular.bash` - Contains all commands to create angular project modifications.
`scripts/symfony.bash` - Contains all commands to create symfony project modifications.
`src/angular` - Directory containing the generated angular project.
`src/symfony` - Directory containing the generated symfony project.

# Boilerplate

This repo contains a branch: `boilerplate` that can be considered a starting template.



