# Flakes

This Repo contains flakes for other Git repositories.


## Use

Just add this repo to the `inputs` of your system flake.
```nix
{
  inputs = {
    steav-flakes.url = "github:steav005/flakes";
  };
}
```
Then, (if `inputs` were propagated), the packages can be used like this:
```nix
inputs.steav-flakes.packages.<system>.<package>
```
With `<system>` being your system architecure i.e. `x86_64-linux`  
And `<package>` being the desired package i.e. `libusb`

## Packages
- `libusb` version 1.0.25-pre
- `fcitx5-nord` version ?
- `Bibata` version 1.1.2
