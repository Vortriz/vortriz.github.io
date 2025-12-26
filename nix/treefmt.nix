{ inputs, ... }:
{
    imports = [
        inputs.treefmt-nix.flakeModule
    ];

    perSystem = {
        treefmt.config = {
            programs = {
                nixfmt.enable = true;
                prettier.enable = true;
            };

            settings = {
                formatter = {
                    # nix
                    nixfmt = {
                        options = [ "--indent=4" ];
                    };

                    prettier = {
                        includes = [ "*.astro" ];
                        options = [
                            "--tab-width"
                            "4"
                            "--print-width"
                            "100"
                            "--plugin"
                            "prettier-plugin-astro"
                        ];
                    };
                };
            };
        };
    };
}
