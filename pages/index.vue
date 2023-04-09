<script setup>
    import {ref} from 'vue'
    import sendIcon from '../assets/images/sendIcon.svg'
    import homePageService from "../API/homePageService"
    let question = ref("")
    let conversation = ref([{chatbot: "Hello! How can I help you?"}])
    let isWaiting = ref(false)
    const submit = async () => {
        if(question.value && !isWaiting.value) {
            const data = await homePageService.get_initial_chat()
            console.log('asfasdfsdfsaddfasdf',data)
            conversation.value.push({user: question.value})
            isWaiting.value = true
            setTimeout(() => {
                conversation.value.push({chatbot:"adios"})
                isWaiting.value = false
            },3000)
            question.value = ""
        }
    }
</script>
<template>
    <div  class="wrapper-index d-flex justify-content-center align-items-center flex-column">
        <div 
            v-if="conversation.length == 1"
            class="wrapper-title d-flex flex-column align-items-center"
        >
            <h1 class="title text-light-green"> 
               {{conversation[0].chatbot}}
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
                    class="wrapper-send-icon d-flex align-items-center mt-3 ps-2" 
                    @click="submit"
                >
                    <img :src="sendIcon" alt="send-icon-principla">
                </div>
            </div>
        </div>
        <div v-else class="wrapper-historical-conversation pe-4 ps-4 pt-3 pb-3 d-flex flex-column justify-content-end overflow-scroll">
            <div class="wrapper-content">
                <div v-for = "(message, index) in conversation" :key="index">
                        <h1 class="text-light-green d-flex justify-content-start">
                        {{message.chatbot}}
                        </h1>
                        <h1 class="text-dark-green d-flex justify-content-end">
                            {{message.user}}
                        </h1>

                    </div>    
                <div
                    v-if = "isWaiting" 
                    class="jumping-dots-loader mb-3"> 
                    <span></span> <span></span> <span></span> 
                </div>
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
                    class="wrapper-send-icon d-flex align-items-end mt-3 ps-2" 
                    @click="submit"
                >
                    <img :src="sendIcon" alt="send-icon-principal-chat">
                </div>
            </div>
        </div>
        <custom-footer/>
    </div>

</template>

<style scoped>
.wrapper-index {
    height: 90%;
}
.wrapper-index .wrapper-title {
    width: 45.6rem;
}
.wrapper-index .underline {
    border: 2px solid var(--light-green);
    width: 100%;
}
.wrapper-content {
    max-height: 36rem;
    overflow: scroll;
    scroll-snap-align: end;
    scroll-behavior: smooth;
    scroll-snap-type: y mandatory;
}
.wrapper-index .title.text-light-green {
    border-right: 1px solid;
    padding-right: 17px;
    animation: typing 2s steps(23), blink .5s step-end infinite alternate;
    width: 26ch;
    white-space: nowrap;
    overflow: hidden;
}
.wrapper-index .wrapper-question-input {
    border-top: 2px solid var(--light-green)!important;
}
.wrapper-index .wrapper-question-input textarea {
    overflow-x: hidden;
}
.wrapper-index .wrapper-question-input.first-mounted  {
    border: none!important;
}
.wrapper-index .wrapper-question-input.first-mounted textarea {
    border: none!important;
    height: 65px;
}
.wrapper-index .wrapper-question-input textarea,  .wrapper-index .wrapper-question-input textarea::placeholder{
    background: transparent;
    border: none;
    text-align: start;
    color: var(--dark-green);
    font-family: Consolas, Menlo, Monaco, Lucida Console, Liberation Mono,
    DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace, serif;
    font-weight: 300;
    font-size: 30px;
    height: 3rem;
    padding-top: 10px;
    /* padding: 10px; */
}
.wrapper-index .wrapper-question-input .wrapper-send-icon {
    cursor: pointer;
}
.wrapper-index .wrapper-question-input textarea:focus {
    outline: unset;
    box-shadow: unset;
}
.wrapper-historical-conversation {
    width: 768px;
    height: 611px;
    border: 3px solid var(--light-green);
    border-radius: 29px;
    overflow-y: auto;
    animation: zoom-in-zoom-out 1s ease;
}
.wrapper-historical-conversation h1 {
    font-size: 30px;
}
.wrapper-historical-conversation .text-dark-green{
    word-break: break-all;
    margin-left: 113px;
}
.wrapper-historical-conversation .text-light-green {
    word-break: break-all;
    margin-right: 113px; 
}
.jumping-dots-loader span {
    display: inline-block;
    width: 10px;
    height: 10px;
    border-radius: 100%;
    background-color: var(--light-green)
 }

 .jumping-dots-loader span:nth-child(1) {
     animation: bounce 1s ease-in-out infinite
 }

 .jumping-dots-loader span:nth-child(2) {
     animation: bounce 1s ease-in-out 0.33s infinite
 }

 .jumping-dots-loader span:nth-child(3) {
     animation: bounce 1s ease-in-out 0.66s infinite
 }

 @keyframes bounce {
    0%,
    75%,
    100% {
        -webkit-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0)
    }

    25% {
        -webkit-transform: translateY(-10px);
        -ms-transform: translateY(-10px);
        -o-transform: translateY(-10px);
        transform: translateY(-10px)
    }
 }
@keyframes zoom-in-zoom-out {
  0% {
    transform: scale(0, 0);
  }
  100% {
    transform: scale(1, 1);
  }
}

@keyframes typing {
  from {
    width: 0
  }
}
    
@keyframes blink {
  50% {
    border-color: transparent
  }
}
@media(max-width: 636px) {
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
        font-size: 19px;
    }
    .wrapper-index .underline{
        border: 2px solid var(--light-green);
        width: 21rem;
    }
    .wrapper-historical-conversation {
        width: 22rem;
        height: 29rem;
    }

}
@media(min-width: 637px) and (max-width: 800px) {
    .wrapper-index .wrapper-title {
        width: 37rem;
        height: 32rem;
    }
    .wrapper-index .underline{
        width: 37rem;
    }
    .wrapper-historical-conversation {
        width: 38rem;
        height: 32rem;
    }

}
</style>