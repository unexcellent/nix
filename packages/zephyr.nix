{
  pkgs,
  username,
  ...
}: let
  # Zephyr SDK uses the arm-zephyr-eabi- prefix but the tools are identical to
  # arm-none-eabi- for our uses (ELF→binary conversion, etc.). Symlink the
  # gcc-arm-embedded tools under the Zephyr prefix so they're available in any
  # context via the nix system PATH, without relying on shell env var setup.
  arm-zephyr-eabi-tools = pkgs.runCommand "arm-zephyr-eabi-tools" {} ''
    mkdir -p $out/bin
    for f in ${pkgs.gcc-arm-embedded}/bin/arm-none-eabi-*; do
      name="$(basename "$f")"
      ln -s "$f" "$out/bin/arm-zephyr-eabi-''${name#arm-none-eabi-}"
    done
  '';
in {
  environment.systemPackages = [
    pkgs.just
    pkgs.cmake
    pkgs.ninja
    pkgs.python3Packages.west
    pkgs.gcc-arm-embedded
    arm-zephyr-eabi-tools
    pkgs.cargo-binutils
  ];

  home-manager.users."${username}".programs.zsh.envExtra = ''
    export ZEPHYR_SDK_INSTALL_DIR="$HOME/.zephyr-sdk"
    export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
    export PATH="$HOME/.zephyr-sdk/gnu/arm-zephyr-eabi/bin:$PATH"
  '';
}
