// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    alias() {
        return {
            "~": "/<rootDir>",
            "@": "/<rootDir>",
            "bootstrap": "/<rootDir>/node_modules/bootstrap",
            "test": "~/assets/images",
        }
    },
    app: {
        head: {
          script: [
            {
              src: "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js",
              type: "text/javascript",
            },
          ],
        },
    },
    privateRuntimeConfig: {
        API_URL: process.env.API_URL
    },
    css: ["~/assets/main.css"]
    
})
