export default {
    async get_initial_chat() {
        const config = useRuntimeConfig()
        return await $fetch('http://localhost:8001/api/chat/initial', {
            method: 'GET',
            headers: {
                'X-API-KEY': config.key
            }
        })
    },
    async post_message(data) {
        return await $fetch('http://localhost:8001/api/chat', {
            method: 'POST',
            headers: {
                'X-API-KEY': config.key
            },
            body: {
                user_id: data.user_id,
                content: data.content
            }
        })
    },
    async final_message(data) {
        return await $fetch('http://localhost:8001/api/final-message', {
            method: 'POST',
            headers: {
                'X-API-KEY': config.key
            },
            body: {
                user_id: data.user_id,
            }
        })
    }
}