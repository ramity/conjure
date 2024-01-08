# _CONJURE_

### A code generation experiment.

# Rules

Below are the guidelines for this project.

| #  | Rule description                                                     |
|----|----------------------------------------------------------------------|
| 1. | All code must be generated via a generator script or ChatGPT3.5.     |
| 2. | All usages of ChatGPT3.5 must be completed in a single prompt.       |
| 3. | All code modifications must be performed via execution of a command. |

## Rule number 1

You're not allowed to directly program anything. You have to use generators and an AI assistant to generate the code for
you. You're allowed to create wild invocations of generator commands and selectively pull code from AI assistant
generated code, but you simply cannot write code via bash invocations like:

```
sed -i '5i    logic();\n    moreLogic();\n' filename.php
```

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

# Technology Selection:

| Software | Description | Docs |
| -------- | ----------- | ---- |
| Docker | Docker is an open platform for developing, shipping, and running applications. | https://docs.docker.com/ |
| Symfony | Symfony is a set of PHP Components, a Web Application framework, a Philosophy, and a Community. |  https://symfony.com/doc/current/index.html |
| Angular | The web development framework for building the future. | https://angular.io/docs |
| ChatGPT3.5 | ChatGPT is a free-to-use AI system developed by OpenAI. | https://chat.openai.com/ |

> # Docker
> - A container virtualization software.
> - Easily share and spin up environments for code to be executed within.
>
> # Symfony
> - A PHP backend framework.
> - MakerBundle generators.
>
> # Angular
> - A javascript frontend framework.
> - Schematic generators.
>
> # ChatGPT3.5
> - A language model. 
> - Picked due to its ability to share URLs to conversations.

# Package: "conjure-commands"

I made a sibling project, "conjure-commands" for this challenge which can be installed into the generated symfony project. It will add additional commands for generating or adding AI generated code.

# Quickstart

`scripts/angular.bash` - Contains all commands to create angular project modifications.
`scripts/symfony.bash` - Contains all commands to create symfony project modifications.
`src/angular` - Directory containing the generated angular project.
`src/symfony` - Directory containing the generated symfony project.

# Boilerplate

This repo contains a branch: `boilerplate` that can be considered a starting template.



