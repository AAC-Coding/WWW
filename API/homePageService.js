export default {
    async get_initial_chat() {
        return await useAsyncData(() => $fetch('http://localhost:8001/api/chat/initial', {
            method: 'GET',
            headers: {
                'X-API-KEY': '64540a2224c7cf38dc0c696bd40da2ff'
            }
        }))
    },
    async post_message(data) {
        return await useAsyncData(() => $fetch('chat', {
            method: 'POST',
            params: {
                user_id: data.user_id,
                content: data.message
            }
        }))
    }
}