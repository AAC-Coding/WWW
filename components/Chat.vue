<script setup>
    import sendIcon from "~/assets/images/sendIcon.svg"

    import {ref, onMounted, nextTick} from 'vue'

    import homePageService from "@/API/homePageService"

    let isWaiting = ref(true)
    let conversation = ref([])
    let question = ref("")

    const scrollBottom = () => {
        nextTick(() => {
            let element = document.getElementsByClassName('scroll')[0];
            const maxHeight = element.scrollHeight - element.clientHeight;
            element.scrollTop = maxHeight;
        });
    }
    const submit = async() => {
        if(question.value && !isWaiting.value) {
            if(conversation.length == 8) {}
            conversation.value.push({user: question.value})
            isWaiting.value = true
            const data = {
                user_id: localStorage.getItem('user_id'),
                content: question.value
            }
            question.value = ""
            scrollBottom()
            const responseFromChatbot = await homePageService.post_message(data)
            conversation.value.push({chatbot: responseFromChatbot.text}) 
            isWaiting.value = false
            scrollBottom()
        }
    }
    onMounted(async () => {
        const data = await homePageService.get_initial_chat()
        const {text, token} = data
        conversation.value.push({chatbot: text})
        localStorage.setItem('user_id', token)
        isWaiting.value = false
    })
</script>

<template>
    <div class="chat">
        <div class="chat-name p-2">
            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center">
                    <img />
                    <h4 class="chat-name-text text-white m-0">
                        ALCA'S AI CUSTOMER SERVICE
                    </h4>
                </div>
                <i 
                    class="close-chat bi bi-x"
                    @click="$emit('isShowChat')"
                ></i>
            </div>
        </div>
        <div class="p-3 wrapper-scroll">
            <div class="scroll">
                <div class="chat-conversation d-flex flex-column justify-content-end">
                    <div 
                        v-for = "(message, index) in conversation" 
                        :key="index"
                    >
                        <h1 :tabIndex = "index" v-if = "message.chatbot" class="chatbot text-white d-flex justify-content-start">
                        {{message.chatbot}}
                        </h1>
                        <div  v-else class="wrapper-user d-flex justify-content-end">
                            <h1  class="user text-white d-flex justify-content-end text-end">
                                {{message.user}}
                            </h1>
                        </div>
                        

                    </div>    
                    <jumping-dots v-if = "isWaiting"/>
                </div>
            </div>
            <div class="d-flex wrapper-input">
                <input 
                    v-model="question"
                    placeholder="Type here your question"
                    type="text"
                    class="form-control me-2"
                    @keyup.enter="submit"
                />
                <img
                    :src = "sendIcon"
                    @click="submit"
                />
            </div>
        </div>
       
    </div>
</template>

<style>
.chat {
    width: 22.06rem;
    right: 10rem;
    bottom: 8rem;
    background-color: var(--light-green);
}
.chat .chat-name {
    background-color: var(--dark-green);
}
.chat .wrapper-scroll {
    height: 25rem;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}
.chat .scroll {
    overflow-y: scroll;
   
    max-height: 20rem;
}
.chat .chat-conversation {
    height: inherit;
}
.chat .chat-name-text {
    font-size: 1.2rem;
    width: 13rem;
}
.chat .close-chat {
    font-size: 1.7rem;
    cursor: pointer;
}
.chat .jumping-dots-loader.mb-3 span {
    background: var(--dark-green);
}
.chat .chat-conversation h1 {
    padding: 1rem;
    border-radius: 1rem;
    font-size: 1.10rem;
}
.chat .chat-conversation .chatbot {
    background: var(--dark-green);
}
.chat .chat-conversation .user {
    background: var(--dirty-green);
    width: 18rem;
}
.chat .wrapper-input img {
    cursor: pointer;
}
</style>