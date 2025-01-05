{vars, ...}: {
  terraform.required_providers.libvirt.source = "dmacvicar/libvirt";

  provider.libvirt.uri = "qemu+ssh://deploy@${vars.networking.hostsAddr.MGC-DRW-HVS01.ipv4}/system";

  module = {
    restic-server = {
      source = "${vars.moduleSource}";
      vm_hostname_prefix = "MGC-DRW-RST";
      autostart = true;
      vm_count = 1;
      memory = "4096";
      vcpu = 2;
      system_volume = 300;
      bridge = "br0";
      dhcp = true;
    };
  };
}
