<script setup>
    import {ref, onMounted, onUpdated} from 'vue'
    import sendIcon from '@/assets/images/sendIcon.svg'
    import homePageService from "@/API/homePageService"
    definePageMeta({ layout:  'custom-layout'})
    let question = ref("")
    let conversation = ref([])
    let isWaiting = ref(false)
    let isLoading = ref(true)
    let firstInitialChatRequest = ref([])
    let oldValue = 0;
    onMounted(async () => {
        const getTokenFromLocalStorage = localStorage.getItem('token')
        const data = await homePageService.get_initial_chat(getTokenFromLocalStorage)
        const {text, token} = data
        conversation.value.push({chatbot: text})
        localStorage.setItem('token', token)
        isLoading.value = false
        
        firstInitialChatRequest.value.push(text.slice(0, 23))
        firstInitialChatRequest.value.push(text.slice(23, text.length-1))
        nextTick(() => {
            typing()
        });
    })
    const sleep = () => {
        return new Promise((resolve) => setTimeout(resolve, 30))
    }
    const typing = async() => {
        const text = conversation.value[0].chatbot
        for(let i=0; i<text.length; i++) {
            const container = document.getElementsByClassName('typewriter')[0];
            if(container) {
                container.innerHTML += text[i]
                await sleep()
            }
        }
    }
    const submit = async() => {
        if(question.value && !isWaiting.value) {
            if(conversation.length == 8) {}
            conversation.value.push({user: question.value})
            isWaiting.value = true
            const data = {
                token: localStorage.getItem('token'),
                content: question.value
            }
            question.value = ""
            const responseFromChatbot = await homePageService.post_message(data)
            conversation.value.push({chatbot: responseFromChatbot.text}) 
            isWaiting.value = false
        }
    }
</script>
<template>
    <div  class="wrapper-index d-flex justify-content-center align-items-center flex-column">
        <div v-if="isLoading" class="overlay">
            <div class="d-flex justify-content-center">  
                <jumping-dots/>
            </div>
        </div>
            <div 
                v-if="conversation.length == 1 && !isLoading"
                class="wrapper-title d-flex flex-column align-items-center"
            >
            <h1 class=" text-light-green text-center">
                <span class="title typewriter"></span>
                <span class="blinking ">|</span>
            </h1>
            <hr class="underline"/>
            
            <div 
                class="wrapper-question-input first-mounted d-flex justify-content-center w-100"
                v-if="conversation.length == 1"
            >
                <textarea 
                    v-model="question"
                    class="form-control p-0" 
                    placeholder="Type here your question" 
                    @keypress.enter="submit"
                >
                </textarea>
                <div 
                    class="wrapper-send-icon d-flex align-items-start mt-3 ps-2" 
                    @click="submit"
                >
                    <img 
                        alt="send-icon-principal"
                        class="pt-2"
                        :src="sendIcon" 
                    >
                </div>
            </div>
        </div>
        <div 
            v-else-if = "conversation.length > 1 && !isLoading"
            class="wrapper-historical-conversation pe-4 ps-4 pt-3 pb-3 d-flex flex-column justify-content-end overflow-scroll">
            <div :class="{'wrapper-content': true}">
                <div 
                    v-for = "(message, index) in conversation" 
                    :key="index"
                >
                    <h1 v-if = "message.chatbot" class="text-light-green d-flex justify-content-start">
                    {{message.chatbot}}
                    </h1>
                    <h1 v-else class="text-dark-green d-flex justify-content-end text-end">
                        {{message.user}}
                    </h1>

                </div>    
                <jumping-dots v-if = "isWaiting" />
            </div>
             <div 
                class="wrapper-question-input d-flex justify-content-center w-100">
                <textarea 
                    v-model="question"
                    class="form-control p-0" 
                    placeholder="Type here your question" 
                    @keypress.enter="submit"
                >
                </textarea>
                <div 
                    class="wrapper-send-icon d-flex align-items-start mt-3 ps-2" 
                    @click="submit"
                >
                    <img  
                        alt="send-icon-principal-chat"
                        class="pt-2"
                        :src="sendIcon" 
                    >
                </div>
            </div>
        </div>
        <custom-footer class="footer" id="footerTest"/>
    </div>

</template>

<style scoped>
.wrapper-index {
    /* height: 90%; */
    height: 90vh;
    padding-top: 12rem;
}
.wrapper-index .wrapper-title {
    width: 45.6rem;
}
.wrapper-index .underline {
    border: 0.13rem solid var(--light-green);
    width: 100%;
}
.wrapper-content {
    max-height: 36rem;
    overflow: scroll;
    scroll-snap-type: none;
}
.wrapper-content > div:last-child {
    scroll-snap-align: start;
}
.wrapper-index .title.text-light-green {
    padding-right: 1.06rem;
    font-size: 2.5rem;
}
.wrapper-index .blinking {
    animation: blink 1s infinite;
}
.wrapper-index .wrapper-question-input {
    border-top: 0.13rem solid var(--light-green)!important;
}
.wrapper-index .wrapper-question-input textarea {
    overflow-x: hidden;
    margin-top: 0.63rem;
    padding-left: 0.31rem;
}
.wrapper-index .wrapper-question-input.first-mounted  {
    border: none!important;
}
.wrapper-index .wrapper-question-input.first-mounted textarea {
    border: none!important;
    height: 4.06rem;
}
.wrapper-index .wrapper-question-input textarea,  .wrapper-index .wrapper-question-input textarea::placeholder{
    background: transparent;
    border: none;
    text-align: start;
    color: var(--dark-green);
    font-family: Consolas, Menlo, Monaco, Lucida Console, Liberation Mono,
    DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace, serif;
    font-weight: 300;
    font-size: 1.88rem;
    height: 3rem;
    padding-left: 0.63rem;
}
.wrapper-index .wrapper-question-input .wrapper-send-icon {
    cursor: pointer;
}
.wrapper-index .wrapper-question-input textarea:focus {
    outline: unset;
    box-shadow: unset;
}
.wrapper-historical-conversation {
    width: 48rem;
    height: 38.19rem;
    border: 0.19rem solid var(--light-green);
    border-radius: 1.81rem;
    overflow-y: auto;
    animation: zoom-in-zoom-out 1s ease;
}
.wrapper-historical-conversation h1 {
    font-size: 1.88rem;
}
.wrapper-historical-conversation .text-dark-green{
    margin-left: 7.06rem; 
}
.wrapper-historical-conversation .text-light-green {
    margin-right: 7.06rem; 
}
@keyframes zoom-in-zoom-out {
  0% {
    transform: scale(0, 0);
  }
  100% {
    transform: scale(1, 1);
  }
}

@media(max-width: 1077px) {
    .wrapper-index .wrapper-title {
        width: 20rem;
    }
    .wrapper-send-icon {
        align-items: flex-start!important;
    }
    h1.title.text-light-green, .wrapper-index .wrapper-question-input textarea, 
    .wrapper-index .wrapper-question-input textarea::placeholder,
    .wrapper-historical-conversation .text-light-green, 
    .wrapper-historical-conversation .text-dark-green {
        font-size: 1.19rem;
    }
    .wrapper-index .underline{
        border: 0.13rem solid var(--light-green);
        width: 21rem;
    }
    .wrapper-historical-conversation {
        width: 22rem;
        height: 29rem;
    }
}
@keyframes blink {
  0% {
    opacity: 100%;
  }
  50% {
    opacity: 50%;
  }
}
@media(min-width: 2000px) {
    .wrapper-index .wrapper-title {
        width: 60rem;
    }
    .wrapper-historical-conversation {
        width: 70rem;
        height: 54.19rem;
    }
}
</style>
