# How to set up

1. Install xcode via `xcode-select --install`
2. Install Lix via `curl -sSf -L https://install.lix.systems/lix | sh -s -- install`
3. Create an set up an ssh key on Github like described [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
4. Reboot
5. Download nix-darwin config
6. `cd` into `~/Downloads/nix-darwin-main`
7. Execute commands described in `/packages/nixup.nix`
8. Reboot