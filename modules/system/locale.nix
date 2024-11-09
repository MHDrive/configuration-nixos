{ ... }:

let
    idLocale = "id_ID.UTF-8";
in
{
    # Select internationalisation properties
    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "${idLocale}";
            LC_IDENTIFICATION = "${idLocale}";
            LC_MEASUREMENT = "${idLocale}";
            LC_MONETARY = "${idLocale}";
            LC_NAME = "${idLocale}";
            LC_NUMERIC = "${idLocale}";
            LC_PAPER = "${idLocale}";
            LC_TELEPHONE = "${idLocale}";
            LC_TIME = "${idLocale}";
        };
    };
}