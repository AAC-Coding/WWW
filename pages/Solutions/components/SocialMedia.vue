<script setup>
    import facebookIcon from "@/assets/images/facebookIcon.svg"
    import arrowLeft from "@/assets/images/arrowLeft.png"
    import arrowTopLeft from "@/assets/images/arrowTopLeft.png"
    import arrowTopRight from "@/assets/images/arrowTopRight.png"
    import arrowRight from "@/assets/images/arrowRight.png"

    const link = () => {
        console.log('ME ESTOY EJECUTANDO')
        var link = document.createElement('a');
        link.href = "https://api.whatsapp.com/send?phone=13052041810";
        link.target = '_blank'
        window.open(link)
    }
</script>
<template>
    <div class="social-media d-flex flex-column align-items-center position-relative">
        <div class="wrapper-image d-flex position-relative">
            <div class="facebook-wrapper d-grid position-absolute">
                <img class="facebook-icon ps-5" :src="facebookIcon"/>
                <img class="facebook-arrow-image" :src="arrowLeft"/>
            </div>
            <div class="instagram-wrapper d-grid position-relative">
                <i class="instagram-icon bi bi-instagram position-absolute"></i>
                <img class="instagram-arrow-image position-absolute" :src="arrowTopLeft"/>
            </div>
            <div class="d-grid position-relative">
                <i class="whatsapp-icon bi bi-whatsapp position-absolute" @click="link"></i>
                <img class="whatsapp-arrow-image position-absolute" :src="arrowTopRight"/>
            </div>
            <div class="d-grid position-relative">
                <i class="messenger-icon bi bi-messenger position-absolute"></i>
                <img class="messenger-arrow-image position-absolute" :src="arrowRight"/>
            </div>
        </div>
        <button type="button" class="live-demo-button btn text-white position-absolute">
            LIVE DEMO
        </button>
    </div>
</template>

<style scoped>
    .social-media {
        height: 16rem;
    }
    .social-media i::before{
        color: var(--light-green);
        font-size: 4rem;
    }   
    .social-media .live-demo-button {
        background: var(--light-green);
        font-size: 3.44rem;
        border-radius: 0.94rem;
        width: 22.23rem;
        top: 9rem;
    }
    .social-media .facebook-wrapper {
        right: 11.5rem;
        top: 2rem;
    }
    .social-media .instagram-arrow-image {
        padding-top: 3.6rem;
        right: 5rem;
    }
    .social-media .instagram-icon {
        right: 3.5rem;
        top: 2rem;
    }
    .social-media .whatsapp-arrow-image {
        padding-top: 4.7rem;
        left: 2rem;
    }
    .social-media .whatsapp-icon {
        left: 1rem;
        top: 2rem;
        z-index: 1;
    }
    .social-media .messenger-arrow-image {
        left: 10.9rem;
        top: 5.6rem;
    }
    .social-media .messenger-icon {
        left: 9rem;
        top: 2rem;
    }
</style>