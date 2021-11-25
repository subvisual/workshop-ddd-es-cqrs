/** @type {import('@sveltejs/kit').Config} */
import adapter from "@sveltejs/adapter-node";

const config = {
  kit: {
    adapter: adapter({
      out: "build",
      precompress: false,
      env: {
        host: process.env["HOST"],
        port: process.env["PORT"],
      },
    }),
  },
};

export default config;
