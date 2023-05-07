<script setup>
    import facebookIcon from "@/assets/images/facebookIcon.svg"
    import arrowLeft from "@/assets/images/arrowLeft.png"
    import arrowTopLeft from "@/assets/images/arrowTopLeft.png"
    import arrowTopRight from "@/assets/images/arrowTopRight.png"
    import arrowRight from "@/assets/images/arrowRight.png"
</script>
<template>
    <div class="mobile-social-media d-flex flex-column align-items-center position-relative mb-2">
        <div class="wrapper-image d-flex position-relative">
            <div class="facebook-wrapper d-grid position-absolute">
                <img class="facebook-icon ps-5" :src="facebookIcon"/>
            </div>
            <div class="instagram-wrapper d-grid position-relative">
                <i class="instagram-icon bi bi-instagram position-absolute"></i>
            </div>
            <div class="d-grid position-relative">
                <i class="whatsapp-icon bi bi-whatsapp position-absolute"></i>
            </div>
            <div class="d-grid position-relative">
                <i class="messenger-icon bi bi-messenger position-absolute"></i>
            </div>
        </div>
        <h4 class="text-demo text-dark-green"> CLICK FOR LIVE DEMO </h4>
    </div>
</template>

<style scoped>
.mobile-social-media {
    height: 11rem;
}
.mobile-social-media .wrapper-image {
    height: 11rem;
}
.mobile-social-media i::before{
    color: var(--light-green);
    font-size: 4rem;
}   
.mobile-social-media .live-demo-button {
    background: var(--light-green);
    font-size: 3.44rem;
    border-radius: 0.94rem;
    width: 22.23rem;
    top: 9rem;
}
.mobile-social-media .facebook-wrapper {
    right: 7.8rem;
    top: 2rem;
}
.mobile-social-media .instagram-arrow-image {
    padding-top: 3.6rem;
    right: 5rem;
}
.mobile-social-media .instagram-icon {
    right: 1.8rem;
    top: 2rem;
}
.mobile-social-media .whatsapp-arrow-image {
    padding-top: 4.7rem;
    left: 2rem;
}
.mobile-social-media .whatsapp-icon {
    left: 0.4rem;
    top: 2rem;
}
.mobile-social-media .messenger-arrow-image {
    left: 10.9rem;
    top: 5.6rem;
}
.mobile-social-media .messenger-icon {
    left: 6rem;
    top: 2rem;
}

@media(min-width: 1077px) {
    .mobile-social-media {
        display: none!important;
    }
}
</style>