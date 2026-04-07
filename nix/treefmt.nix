{ inputs, ... }:
{
    imports = [
        inputs.treefmt-nix.flakeModule
    ];

    perSystem =
        { pkgs, ... }:
        {
            treefmt.config = {
                programs = {
                    nixfmt = {
                        enable = true;
                        indent = 4;
                    };

                    biome = {
                        enable = true;

                        includes = [
                            "*.astro"
                            "*.svg"
                            "*.md"
                        ];

                        validate = {
                            enable = true;

                            schema = pkgs.fetchurl {
                                url = "https://biomejs.dev/schemas/${pkgs.biome.version}/schema.json";
                                sha256 = "sha256-8XUDeq8Y4JEBJ+A2gnCI+KUXJJ8Pe3QkKNOReDrCpKg=";
                            };
                        };

                        settings = {
                            formatter = {
                                enabled = true;
                                indentStyle = "space";
                                indentWidth = 4;
                            };
                            javascript.formatter.quoteStyle = "double";
                            # html.experimentalFullSupportEnabled = true;
                            linter = {
                                enabled = true;
                                rules.recommended = true;
                            };
                            assist = {
                                enabled = true;
                                actions.source.organizeImports = "on";
                            };
                            overrides = [
                                {
                                    includes = [ "**/*.astro" ];
                                    linter = {
                                        rules = {
                                            style = {
                                                useConst = "off";
                                                useImportType = "off";
                                            };
                                            correctness = {
                                                noUnusedVariables = "off";
                                                noUnusedImports = "off";
                                            };
                                        };
                                    };
                                }
                            ];
                        };
                    };
                };
            };
        };
}
