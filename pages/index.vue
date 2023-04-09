<script setup>
    import sendIcon from '@/assets/images/comingSoon.png'
    definePageMeta({ layout:  'default-layout'})
</script>

<template>
    <div id="logo-container">
      <img id="logo" :src="sendIcon" alt="send-icon-principal-chat">
    </div>
</template>

<style scoped>
    #logo-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 100px);
        margin: 50px;
    }
    #logo {
        max-width: 80%;
        height: auto;
    }
</style>