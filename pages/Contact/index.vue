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
</script>

<template>
    <div class="contact d-flex flex-column align-items-center justify-content-center">
        <div class="d-flex justify-content-center">
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
                    <h4 class="text-dark-green"> Chat here </h4>
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
        <div class="d-flex justify-content-center mt-5">
            <hr/>
        </div>
        <div class="d-flex justify-content-center">
            <img 
                class="contact-icon  facebook-icon ps-5 me-5" 
                :src="facebookIcon"
                @click="link('https://www.facebook.com/profile.php?id=100090060412659')">
            />
            <i class="contact-icon bi bi-instagram me-5"></i>
            <i class="contact-icon bi bi-whatsapp me-5" @click="link('https://api.whatsapp.com/send?phone=13052041810')"></i>
            <i class="contact-icon bi bi-messenger me-5"></i>
        </div>
        <chat/>
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
        border: 2px solid var(--dark-green);
        opacity: 1;;
        width: 40rem;
    }
    .contact .contact-icon {
        cursor: pointer;
        font-size: 4.2rem;
        color: var(--light-green);
    }
</style>