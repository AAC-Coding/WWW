<script setup>
</script>

<template>
    <div class="contact-card  d-flex flex-column justify-content-center align-items-center">
        <slot/>
    </div>
</template>

<style scoped>
    .contact-card{
        background-color: var(--light-green);
        color: white;
        border-radius: 5.88rem;
        width: 17.81rem;
        height: 17.68rem;
        padding: 2rem;
    }
</style>