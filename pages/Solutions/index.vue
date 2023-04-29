<script setup>
    import chatIcon from "~/assets/images/chatIcon.svg"
    import pageUp from "~/assets/images/pageUp.svg"

    import FirstSolutionsContent from "./components/FirstSolutionsContent"
    import SecondSolutionsContent from "./components/SecondSolutionsContent"

    import {ref} from 'vue'

    definePageMeta({layout: 'custom-layout'})

    let isShowChat = ref(false)
</script>

<template>
    <div class="solutions ps-5 pe-5 position-relative">
        <div class="d-flex align-items-center h-100">
        <button 
            type="button"
            class="quote-button btn text-white position-absolute"
        > 
            GET QUOTE 
        </button>    
        <div id="carouselExampleCaptions" class="carousel slide w-100 position-relative vertical" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"
                data-bs-interval="2000"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 1"
                data-bs-interval="2000"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <first-solutions-content/>
                </div>
                <div class="carousel-item ">
                    <second-solutions-content/>
                </div>
            </div>
           
        </div>
         <div class="wrapper-action-buttons position-absolute d-flex justify-content-end">
            <img
                alt="chatIcon"
                class="me-2"
                :src="chatIcon"
                @click="isShowChat = !isShowChat"
            />
            <img
                alt="chatIcon"
                :src="pageUp"
            />
        </div>
        <chat 
            v-if = "isShowChat"
            class="position-absolute"
            @isShowChat = "isShowChat = !isShowChat"
        />
        </div>
    </div>
</template>

<style scoped>
.solutions {
    background-color: #263F37;
    height: inherit;
}
.solutions .quote-button {
    background-color: var(--light-green);
    /* right: 11rem; */
    top: 4rem;
    font-size: 1.63rem;
    right: 6rem;
}
.solutions .carousel-inner {
    overflow: visible;
}
.solutions .carousel-indicators {
    flex-direction: column;
    bottom: unset;
    top: 11rem;
    left: 95%;
    margin: 0rem;
    width: 2rem;
}
.solutions .carousel-indicators button {
    width: 1.25rem;
    height: 1.25rem;
    border-radius: 100%;  
    background-color: var(--dark-green);
}
.solutions .carousel-indicators .active {
    background-color: white
}
.solutions div#carouselExampleCaptions {
    position: relative;
}
.solutions .wrapper-action-buttons {
    right: 5rem;
    bottom: 4rem;
}
.solutions .wrapper-action-buttons img{
    cursor: pointer;
}


</style>