// @ts-check

import mdx from "@astrojs/mdx";
import { defineConfig } from "astro/config";

// https://astro.build/config
export default defineConfig({
    site: "https://vortriz.github.io",
    integrations: [mdx()],
    experimental: {
        svgo: true,
    },
});
