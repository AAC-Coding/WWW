export default {
    async get_initial_chat(token) {
        const config = useRuntimeConfig()
        return await $fetch(`${config.public.apiBase}/api/chat/initial`, {
            method: 'GET',
            headers: {
                'X-API-KEY': config.public.key,
                'Authorization': `Beare ${token}`
            }
        })
    },
    async post_message(data) {
        const config = useRuntimeConfig()
        return await $fetch(`${config.public.apiBase}/api/chat`, {
            method: 'POST',
            headers: {
                'X-API-KEY': config.public.key
            },
            body: {
                token: data.user_id,
                content: data.content
            }
        })
    },
    async final_message(data) {
        return await $fetch(`${config.public.apiBase}api/final-message`, {
            method: 'POST',
            headers: {
                'X-API-KEY': config.public.key
            },
            body: {
                user_id: data.user_id,
            }
        })
    }
}