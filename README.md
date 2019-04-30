# Goody

## What is this?

This is a starter project for a web application using [Elixir], [Phoenix], [Elm], and [Parcel], deployable to [Heroku].

It comes preconfigured for ease of project setup, testing, integration, and deployment.

[elixir]: https://elixir-lang.org
[phoenix]: https://phoenixframework.org
[elm]: https://elm-lang.org
[parcel]: https://parceljs.org
[heroku]: https://www.heroku.com

## How do I use it?

There are two paths:

1. You could clone this repository, replace all occurrences of "`Goody`" both within files and in filenames in a case-sensitive fashion, delete the `.git` directory, run `git init`, and be ready to go.

2. However, as the software upon which this project depends is constantly being updated, you might want to use Goody as a reference as you initialize your project from the latest dependencies.

In either case, this project's [commit messages] contain information about the steps that were run as part of the initialization process.

[commit messages]: https://github.com/jeffcole/goody/commits/master

## Dependency Management

This project recommends using the [asdf] version manager to manage programming language dependencies. The [`bin/setup`] script uses asdf to install Elixir, Phoenix, Node.js, and Elm onto your machine in an isolated fashion, so there is no need to install these particular tools yourself.

Please follow the [asdf installation instructions] for your platform, including the [Add to Your Shell] and [Plugin Dependencies] sections.

[asdf]: https://asdf-vm.com
[`bin/setup`]: bin/setup
[asdf installation instructions]: https://asdf-vm.com/#/core-manage-asdf-vm
[add to your shell]: https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell
[plugin dependencies]: https://asdf-vm.com/#/core-manage-asdf-vm?id=plugin-dependencies

### Node.js Requirements

Installing Node.js via asdf validates the downloaded package against the Node.js release team's OpenPGP signatures. This requires the presence of the `gpg` command.

On macOS, run the following to obtain this dependency:

```sh
brew install gpg
```

For other platforms, please see the [asdf-nodejs requirements instructions].

[asdf-nodejs requirements instructions]: https://github.com/asdf-vm/asdf-nodejs#requirements

### PostgreSQL

This project uses [PostgreSQL] as its database. Please see the [PostgreSQL wiki] for installation instructions.

[postgresql]: https://www.postgresql.org
[postgresql wiki]: https://wiki.postgresql.org/wiki/Detailed_installation_guides

### Linux Users

On Linux, you will need [inotify-tools]. Please see the [inotify-tools wiki] for installation instructions.

[inotify-tools]: https://github.com/rvoicilas/inotify-tools
[inotify-tools wiki]: https://github.com/rvoicilas/inotify-tools/wiki

## Environment Configuration

This project recommends using [direnv] to automatically source environment variables into shell sessions.

On macOS, it can be installed with:

```sh
brew install direnv
```

Please see the [direnv installation instructions] for other platforms.

All users will need to follow the [direnv setup instructions] to add it to their shell.

[direnv]: https://github.com/direnv/direnv
[direnv installation instructions]: https://github.com/direnv/direnv#install
[direnv setup instructions]: https://github.com/direnv/direnv#setup

## Setup

Once asdf and direnv are both installed and set up according to the above, execute the following to set up this project:

```sh
bin/setup
```

This script will:

1. Create a `.tool-versions` file for use by asdf from the dependency versions specified in the Heroku buildpack configuration files
1. Install or update asdf plugins for Erlang, Elixir, and Node.js
1. Install Erlang, Elixir, Node.js, and npm
1. Create and allow a [sample `.envrc`] file
1. Install server-side and client-side dependencies
1. Set up the database
1. Install [pre-commit] and configure commit message linting (on macOS)
1. Set up Heroku staging and production remotes (you will need Heroku project access for this step to succeed)

The [`bin/setup`] script can be safely re-run. It should be run every time a dependency version is updated in [`elixir_buildpack.config`] or [`phoenix_static_buildpack.config`].

[sample `.envrc`]: .sample.envrc
[script]: bin/setup
[`elixir_buildpack.config`]: elixir_buildpack.config
[`phoenix_static_buildpack.config`]: phoenix_static_buildpack.config
[pre-commit]: https://pre-commit.com

## Testing

Run all of the checks performed by [Heroku CI] with:

```sh
bin/test-all
```

Note that a run of [Dialyxir] is included in the [`bin/test-all`] script, which will take a long time to run for the first invocation on each version of Erlang and Elixir.

Run the test suite a single time with:

```sh
mix test
```

Run the test suite on each file change with:

```sh
mix test.watch
```

[heroku ci]: https://devcenter.heroku.com/articles/heroku-ci
[dialyxir]: https://github.com/jeremyjh/dialyxir
[`bin/test-all`]: bin/test-all

## Development

Run the Phoenix server with:

```sh
mix phx.server
```

Visit [`localhost:4000`](http://localhost:4000) in your browser.

## Code Formatting

The project uses code formatters wherever possible. It eschews custom formatter configuration, deferring to established community defaults. Formatting is checked by CI and the [`bin/test-all`] script. Please see the following links and your editor documentation to configure automatic formatting on file save.

- [Elixir Formatter]
- [elm-format]
- [Prettier] (CSS, JavaScript, JSON, Markdown, YAML, etc.)

[elixir formatter]: https://hexdocs.pm/mix/master/Mix.Tasks.Format.html
[elm-format]: https://github.com/avh4/elm-format
[prettier]: https://prettier.io/

## Conventional Commits

This project follows the [Conventional Commits] style of structuring Git commit messages.

On macOS, the [`bin/setup`] script installs and configures [pre-commit] to enable linting of commit messages on each commit.

Please see the pre-commit [installation instructions][pre-commit] for other platforms. Once installed, run the following to configure commit message linting:

```sh
pre-commit install --hook-type commit-msg
```

[conventional commits]: https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional

## Deployment

This project uses a [Heroku Pipeline], so there should never be a need to deploy directly to staging or production. The workflow goes as follows:

1. [Review apps] are automatically created for each GitHub pull request.
1. Staging is automatically deployed upon each merge to `master`, following a successful Heroku CI test.
1. Staging can be promoted to production with:
   ```sh
   heroku pipelines:promote -r staging
   ```

Staging can be viewed by visiting https://staging-goody.herokuapp.com.

[heroku pipeline]: https://devcenter.heroku.com/articles/pipelines
[review apps]: https://devcenter.heroku.com/articles/github-integration-review-apps
