<script setup>
  import {onMounted} from "vue"
  onMounted(() => {
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl)
    })
    
  })
</script>
<template>
  <div class="h-100">
    <NuxtLayout>
      <NuxtPage/>
    </NuxtLayout>
  </div>
</template>
