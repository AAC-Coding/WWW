<script setup>
    import surpriseRobot from '@/assets/images/surpriseRobot.png'
</script>

<template>
    <div class="second-solutions-content w-100">
      <div class="row">
            <div class="col-lg-4 wrapper-image">
                <img 
                    class="suprise-robot pt-5"
                    :src = "surpriseRobot"
                />
            </div>
            <div class="col-lg-6">
                <h1 class="title text-white"> AI CAN HELP YOU HAVE THE BEST EXPERIENCE FOR YOUR CUSTOMERS. </h1>
                <h4 class="text-light-green text-end mt-5"> Benefits of ai customer service: </h4>
                <p class="text-white mt-3 mb-0 text-end"> 1.Improved response times </p>
                <p class="text-white m-0 text-end"> 2.Personalized interactions </p>
                <p class="text-white m-0 text-end"> 3.Consistent and accurate information </p>
                <p class="text-white m-0 text-end"> 4.Enhanced efficiency through automation </p>
                <p class="text-white m-0 text-end"> 5.Reduced waiting times </p>
                <p class="text-white m-0 text-end"> 6.Cost-effective solutions </p>
                <p class="text-white m-0 text-end"> 7.Increased customer satisfaction </p>
                <p class="text-white m-0 text-end"> 8.Handle large volumes of inquiries </p>
                <p class="text-white m-0 text-end"> 9.Reduced need for human intervention and potential for human error. </p>
            </div>
        </div>
    </div>
</template>

<style scoped>
.second-solutions-content  p {
    font-size: 1.40rem;
}
.second-solutions-content .title {
    font-size: 2.25rem;
}
.second-solutions-content .suprise-robot  {
    top: 5rem;
    left: 0rem;
}
@media(min-width: 2000px) {
    .second-solutions-content p {
        font-size: 2rem;
    }
    .second-solutions-content .title {
        font-size: 3rem;
    }
    .second-solutions-content h4 {
        font-size: 2.5rem;
    }
}

@media(max-width: 1077px) {
    .second-solutions-content {
        margin-bottom: 5rem;
    }
    .second-solutions-content .suprise-robot {
        width: 15rem;
    }
    .second-solutions-content .title {
        display: none;
    }
    .second-solutions-content .wrapper-image {
        display: flex;
        justify-content: center;
    }
    .second-solutions-content h4, .second-solutions-content p {
        text-align: start!important;
    }
    .second-solutions-content h4 {
        font-size: 1.93rem;
    }
   
}


</style>