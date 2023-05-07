<script setup>
    import chatIcon from "~/assets/images/chatIcon.png"
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
            let data = {}
            let responseFromChatbot = {}
            conversation.value.push({user: question.value})
            isWaiting.value = true
            data = {
                token: localStorage.getItem('token'),
                content: question.value
            }
            question.value = ""
            scrollBottom()
            responseFromChatbot = await homePageService.post_message(data)
            conversation.value.push({chatbot: responseFromChatbot.text}) 
            isWaiting.value = false
            scrollBottom()
        }
    }
    onMounted(async () => {
        const getTokenFromLocalStorage = localStorage.getItem('token')
        const data = await homePageService.get_initial_chat(getTokenFromLocalStorage)
        const {text, token} = data
        conversation.value.push({chatbot: text})
        localStorage.setItem('token', token)
        isWaiting.value = false
    })
</script>

<template>
    <div class="chat">
        <div class="chat-name p-2 pe-4 ps-4">
            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center">
                    <img 
                        alt="chat-icon"
                        class="chat-icon me-3" 
                        :src = "chatIcon" 
                    />
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
        <div class="p-3 wrapper-scroll" @mouseover="$emit('onHover',true)" @mouseleave="$emit('onHover',false)">
            <div class="scroll pe-2 ps-2">
                <div class="chat-conversation">
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
    width: 23.06rem;
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
    justify-content: space-between;
}
.chat .scroll {
    overflow-y: scroll;
    overflow-x: hidden;
    max-height: 20rem;
}
.chat .chat-conversation {
    height: inherit;
}
.chat .chat-icon {
    background-color: white;
    border-radius: 20px;
    width: 2.5rem;
    height: 2.5rem;
    padding: 0.5rem;
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
    position: relative;
}
.chat .chat-conversation .chatbot::before {
    content: "";
    width: 0px;
    height: 0px;
    position: absolute;
    border-left: 15px solid transparent;
    border-right: 15px solid var(--dark-green);
    border-top: 15px solid var(--dark-green);
    left: -0.7rem;
    top: 0rem;
}
.chat .chat-conversation .user {
    background: var(--dirty-green);
    width: 18rem;
    position: relative;
    word-break: break-word;
}
.chat .chat-conversation .user::before {
    content: "";
    width: 0px;
    height: 0px;
    position: absolute;
    border-left: 15px solid var(--dirty-green);
    border-right: 15px solid transparent;
    border-top: 15px solid var(--dirty-green);
    right: -0.7rem;
    top: 0rem;
}

.chat .wrapper-input img {
    cursor: pointer;
}
.chat .wrapper-input input:focus {
    outline: none;
    border-color: var(--dark-green);
    box-shadow: unset;
}
@media(max-width: 1077px) {
    .chat {
        width: 19.06rem;
        right: 1rem;
        bottom: 3rem;
    }
    .chat .chat-name {
        padding-left: 1rem!important;
    }
    .chat .chat-name-text {
        font-size: 1rem;
    }
    .chat .wrapper-input .form-control, .chat .chat-conversation h1 {
        font-size: 0.8rem!important;
    }
    .chat .chat-icon {
        width: 2rem;
        height: 2rem;
    }
    .chat .wrapper-input img {
        width: 2rem;
    }
}
</style>