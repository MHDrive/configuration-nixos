{ ... }:

{
    # swapDevices =
    #     [ { device = "/dev/disk/by-uuid/0cb971fb-5e31-430c-ad4f-21e814c14c57"; }
    #     ];
    zramSwap = {
        enable = true;
        memoryPercent = 50;
        priority = 100;
        algorithm = "zstd";
    };
}