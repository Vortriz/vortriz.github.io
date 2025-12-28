{ inputs, ... }:
{
    imports = [
        inputs.git-hooks.flakeModule
    ];

    perSystem =
        {
            self',
            pkgs,
            ...
        }:
        {
            pre-commit.settings.hooks = {
                flake-checker = {
                    enable = true;
                    after = [ "treefmt-nix" ];
                };
                treefmt = {
                    enable = true;
                    package = self'.formatter;
                };
                last-updated = {
                    enable = true;
                    name = "Last Updated updater";
                    entry = toString (pkgs.writeShellScript "last-updated" "date '+%d %B, %Y' > last-updated");
                    pass_filenames = false;
                };
            };
        };
}
