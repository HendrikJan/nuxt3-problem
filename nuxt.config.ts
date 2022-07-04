import { defineNuxtConfig } from 'nuxt'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
    ssr: false,

    vite: {
        server: {
            hmr: {
                // clientPort: 4444, // Nginx
                // clientPort: 443, // default,
                // clientPort: 7777, // Apache
                port: 24678,
                clientPort: 4444,
                path: "hmr/",
                protocol: "wss",
            },
        },
    }
})
