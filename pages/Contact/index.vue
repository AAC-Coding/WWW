<script setup>
    import ai from "@/assets/images/ai.svg"
    import email from "@/assets/images/email.svg"
    import facebookIcon from "@/assets/images/facebookIcon.svg"
    import phone from "@/assets/images/phone.svg"
    definePageMeta({ layout:  'custom-layout'})

    const link = (hrefLink) => {
        let link = document.createElement('a');
        link.href = hrefLink;
        link.target = '_blank'
        window.open(link)
    }
    const isOpenChat = ref(false)
</script>

<template>
    <div class="contact d-flex flex-column align-items-center justify-content-center">
        <div class="wrapper-contact-card d-flex justify-content-center">
            <div class="d-flex flex-column align-items-center me-5">
                <img 
                    class="mb-5"
                    :src="email"
                />
                <contact-card>
                    <h4> Questions? </h4>
                    <h4> Suggestions? </h4>
                    <h4> Anything else? </h4>
                    <h4 class="text-center mt-5" > Reach us at info@alcaai.com </h4>
                </contact-card>
            </div>
            <div class="d-flex flex-column align-items-center me-5">
                <img 
                    class="mb-5"
                    :src="ai"
                />
                <contact-card>
                    <p class="text-center">
                        Our artificial intelligence is fully trained to help, inform and be able to do anything a human can do.
                    </p>
                    <h4 class="chat-here-text text-dark-green" @click="isOpenChat = !isOpenChat"> Chat here </h4>
                </contact-card>
            </div>
            <div class="d-flex flex-column align-items-center">
                <img 
                    class="mb-5"
                    :src="phone"
                />
                <contact-card>
                    <h4>
                        Call us at
                    </h4>
                    <h4 class="text-center text-dark-green"> (305) 204 1810 </h4>
                </contact-card>
            </div>
        </div>
        <div class="wrapper-hr d-flex justify-content-center mt-5">
            <hr/>
        </div>
        <div class="d-flex justify-content-center pb-5">
            <img 
                class="contact-icon  facebook-icon ps-5 me-5" 
                :src="facebookIcon"
                @click="link('https://www.facebook.com/profile.php?id=100090060412659')">
            />
            <i class="contact-icon bi bi-instagram me-5"></i>
            <i class="contact-icon bi bi-whatsapp me-5" @click="link('https://api.whatsapp.com/send?phone=13052041810')"></i>
            <i class="contact-icon bi bi-messenger me-5"></i>
        </div>
        <chat
            :isOpenChat = "isOpenChat"
            @onModifyOpenChat = "isOpenChat = $event"
        />
    </div>
    
</template>

<style scoped>
    .contact {
        height: inherit;
        padding-top: 12rem;
    }
    .contact h4, .contact p {
        font-size: 1rem;
        font-weight: 400;
    }
    .contact hr{
        border: 1px solid var(--dark-green);
        opacity: 1;
        width: 40rem;
    }
    .contact .contact-icon {
        cursor: pointer;
        font-size: 4.2rem;
        color: var(--light-green);
    }
    .contact .contact-card .chat-here-text{
        cursor: pointer;
    }
    @media(max-width: 1077px) {
        .contact {
            padding-top: 23rem;
        }
        .contact .wrapper-contact-card {
            flex-direction: column;
            width: 16rem;
        }
        .contact .contact-card h4, .contact .contact-card p {
            display: none;
            margin-top: 0!important;
            color: white;
        }
        .contact .contact-card h4:last-child {
            display: unset;
        }
        .contact .contact-card {
            background: transparent;
            width: unset;
            height: unset;
            padding: 0;
        }
        .contact .wrapper-contact-card div {
            margin-right: 0!important;
            margin-bottom: 1.5rem;
        }
        .contact .wrapper-contact-card img {
            margin-bottom: 1rem!important;
        }
        .contact .wrapper-hr {
            margin-top: 0!important;
            
        }
        .contact hr {
            opacity: 1;
            width: 17rem;
        }
        .contact .contact-icon.facebook-icon{
            width: 4rem;
            margin-right: 1rem!important;
            padding-left: 0rem!important;
            width: 1rem;
        }
        .contact .contact-icon {
            font-size: 2rem;
            margin-right: 2rem!important;
        }
        .contact .contact-icon:last-child {
            margin-right: 0rem!important;
        }

    }
</style>