{pkgs, ...}: {
  environment.systemPackages = [pkgs.protobuf];
}
