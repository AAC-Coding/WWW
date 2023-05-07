// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    alias() {
        return {
            "~": "/<rootDir>",
            "@": "/<rootDir>",
            "bootstrap": "/<rootDir>/node_modules/bootstrap",
        }
    },
    target: 'static',
    ssr: true,
    app: {
        head: {
          title: "ALCA AI",
          script: [
            {
              src: "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js",
              type: "text/javascript",
            },
          ],
        },
    },
    runtimeConfig: {
      // The private keys which are only available within server-side
      // Keys within public, will be also exposed to the client-side
      public: {
        apiBase: process.env["API_URL"],
        key: process.env["API_KEY"]
      }
    },
    plugins: [
      { src: '~/plugins/bootstrap-icons.js', mode: 'client' }
    ],
    css: ["~/assets/main.css"],
    layouts: {
      path: 'layouts'
    },
    server: {
      host: process.env.NUXT_HOST,
      port: process.env.NUXT_PORT,
    },
    pages: true
    
})
