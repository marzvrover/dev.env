# dev.env

Codespaces dotfiles repo

Private environment configurations can be added in `script/private_environments`:

- This assumes that you have a private repo named `ENVIRONMENT_NAME.env`.
- These will only be pulled in on codespaces with the enviornment's `ENV_{ENVIRONMENT_NAME}_ACCESS_TOKEN` environment variable.
- The `ENV_{ENVIRONMENT_NAME}_ACCESS_TOKEN` environment variable must be a GitHub Personal Access Token with read access to the private environment repo.
- This will execute the environment's `script/bootstrap` file.

You must have coreutils installed to test:

macOS: `brew install coreutils`

ubuntu: `sudo apt-get install coreutils`
