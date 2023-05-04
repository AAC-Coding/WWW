<script setup>
    import happyRobot from '@/assets/images/happyRobot.png'
    import SocialMedia from "./SocialMedia"
</script>

<template>
    <div class="first-solutions-content w-100">
      <div class="row">
            <div class="col-lg-7 col-md-12 pe-0">
                <h1 class="title text-white"> AI MULTILINGUAL CUSTOMER SERVICE. </h1>
                <p class="first-line text-white m-0 pt-3 "> We can help your customer service by providing 
                </p>
                <p class="text-white m-0">
                    quick and efficient responses to customer inquiries 
                </p>
                <p class="text-white m-0">
                    and support requests.
                </p>
                <p class="first-line text-white m-0">
                    We can handle basic and repetitive tasks, freeing up 
                </p>
                <p class="text-white m-0">
                    human agents to focus on more complex issues. 
                </p>
                <p class="first-line text-white m-0">
                    AI chatbots can also operate 24/7, 
                </p>
                <p class="text-white m-0">
                    ensuring that customers can 
                </p>
                <p class="text-white m-0">
                    receive assistance at any time.
                </p>
                <p class="first-line text-white m-0">
                    Our solutions can be used 
                </p>
                <p class="text-white m-0">
                    in many different platforms. 
                </p>
                <social-media/>
            </div>
            <div class="col-lg-5 col-md-12 wrapper-image p-0">
                <img 
                    class="happy-robot"
                    :src = "happyRobot"
                />
            </div>
        </div>
    </div>
</template>

<style scoped>
.first-solutions-content {
    padding-top: 3rem;
}
.first-solutions-content .first-line{
    text-indent: 1.25rem;
}
.first-solutions-content p {
    font-size: 1.40rem;
}
.first-solutions-content .title {
    font-size: 2.25rem;
}
.first-solutions-content .happy-robot {
    top: 6rem;
    right: 8rem;
}
.first-solutions-content .wrapper-image img{
    padding-top: 5rem;
}
@media(min-width: 2000px) {
    .first-solutions-content p {
        font-size: 2rem;
    }
    .first-solutions-content .title {
        font-size: 3rem;
    }
}


</style>