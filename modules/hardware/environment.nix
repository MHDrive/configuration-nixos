{ ... }:

{
    # environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
    # Optional: If you're using Wayland
    environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "nvidia";  # or "iHD" for Intel
        GBM_BACKEND = "nvidia-drm";    # Required for Wayland
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        WLR_NO_HARDWARE_CURSORS = "1"; # Fix for cursor issues on Wayland
    };
}