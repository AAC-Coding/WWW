<script setup>

    import chatIcon from "~/assets/images/chatIcon.svg"
    import pageUp from "~/assets/images/pageUp.svg"

    import FirstSolutionsContent from "./components/FirstSolutionsContent"
    import SecondSolutionsContent from "./components/SecondSolutionsContent"

    import {ref, onMounted, watch} from 'vue'

    definePageMeta({layout: 'custom-layout'})

    const containerTest = ref(null)
    const section1 = ref(null)
    const section2 = ref(null)
    const sections = [section1, section2]
    const solutions = ref(null)
    let currentSectionIndex = ref(0);
    let isThrottled = false
    let isHover = ref(false)
    let isShowChat = ref(false)


    const handleOnWheel = (e) => {
        e.preventDefault()
        throttle(e, scrollHandler, 1000)
    }
    
    const activeSection = (index) => {
        sections[index].value?.scrollIntoView({ block: "start", behavior: "smooth"});
    }

    const throttle = (e, func, limit) => {
        if (!isThrottled) {
            func(e);
            isThrottled = true;
            setTimeout(function() {
            isThrottled = false;
            }, limit);
        }
    }

    const scrollHandler = (event) => {
        if (event.deltaY !== undefined && event.deltaY < 0) {
            currentSectionIndex.value--;
        } else if (event.deltaY !== undefined && event.deltaY > 0) {
            currentSectionIndex.value++;
        }
        if (currentSectionIndex.value < 0) {
            currentSectionIndex.value = 0;
        } else if (currentSectionIndex.value > sections.length - 1) {
            currentSectionIndex.value = sections.length - 1;
        }
        sections[currentSectionIndex.value]?.value?.scrollIntoView({ block: "start", behavior: "smooth"});
        currentSectionIndex.value == 0 ? window.scrollBy(0, -5000) : null
    }

    watch(isHover, () => {
        if(isHover.value ) {
            document.removeEventListener('wheel',handleOnWheel)
        }
        else  {
          document.addEventListener('wheel', handleOnWheel, {passive: false});
        }
    })
    onMounted(() => {
      if (!/Mobi/.test(navigator.userAgent)){
        document.addEventListener('wheel', handleOnWheel, {passive: false});
      }
    })

</script>

<template>
    <div class="solutions  position-relative" ref="solutions">
        <button  
            type="button" 
            class="quote-button btn text-white position-fixed"
        > 
            GET A QUOTE 
        </button>
        <section class="vh-100 pt-5 ps-5 pe-5 d-flex align-items-center " ref="section1">
          <first-solutions-content/>
        </section>
        <section class="vh-100 d-flex align-items-center background-black ps-5 pe-5" ref="section2">
          <second-solutions-content/>
        </section>
        <div class="wrapper-buttons position-fixed">
             <div 
                v-for = "(_, index) in sections"
                class="active-section-button mb-4"
                :key="index" 
                @click="activeSection(index)"
            >
                <span :class="{active:currentSectionIndex == index, inactive: currentSectionIndex !== index}"></span>
            </div>
        </div>
         <div class="wrapper-action-buttons position-fixed d-flex justify-content-end">
            <img
                alt="chatIcon"
                class="me-2"
                :src="chatIcon"
                @click="isShowChat = !isShowChat"
            />
            <img
                alt="pageUp"
                :src="pageUp"
                @click="activeSection(0)"
            />
        </div>
        <chat 
            v-show = "isShowChat"
            class="position-fixed"
            @isShowChat = "isShowChat = !isShowChat"
            @onHover = "isHover = $event"
        />
    </div>
</template>

<style scoped>
.solutions {
    background-color: var(--dull-green);
}
.solutions .quote-button {
    background-color: var(--light-green);
    right: 4rem;
    top: 10rem;
    font-size: 1.63rem;
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
.solutions .active, .solutions .inactive{
    display: block;
    height: 1rem;
    width: 1rem;
    border-radius: 10rem;
    background-color: var(--dark-green);
}
.solutions .inactive{
    background-color: white;
    
}
.solutions .wrapper-buttons {
    top: 15rem;
    right: 8rem;
}
.solutions .background-black {
    background-color: black;
}
.solutions .active-section-button  {
    cursor: pointer;
}

@media(max-width: 1077px) {
    .solutions {
        padding-top: 3rem;
    }
    .solutions .wrapper-buttons {
        display: none;
    }
    .solutions section {
        padding-left: 2.8rem!important;
        padding-right: 2.8rem!important;
        height: unset!important;
    }
    .solutions .wrapper-action-buttons img:nth-child(2) {
        display: none;
    }
    .solutions .background-black {
        background-color: var(--dull-green);
    }
    .solutions .wrapper-action-buttons {
        right: 0rem;
        bottom: 1rem;
    }
    .solutions .wrapper-action-buttons img {
        width: 2rem;
    }
    .solutions .quote-button {
        display: none;
    }
}
</style>