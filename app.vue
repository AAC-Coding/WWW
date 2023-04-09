<script setup>
</script>
<template>
  <div class="h-100">
     <NuxtLayout>
      <NuxtPage/>
    </NuxtLayout>
    <!-- <nav :class="{'default-layout navbar navbar-expand-lg bg-black pt-4 pb-4': true, 'add-border': addBorder}">
      <div class="container-fluid d-flex justify-content-center ps-5 pe-5">
        <nuxt-link class="navbar-brand" href="#">
          <div class="">
             <img
              src="~assets/images/alca.png"
              width="148"
              height="50"
            />
          </div>
         
        </nuxt-link>
        <button 
          class="navbar-toggler" 
          type="button" 
          data-bs-toggle="collapse" 
          data-bs-target="#navbarNavAltMarkup" 
          aria-controls="navbarNavAltMarkup" 
          aria-expanded="false" 
          aria-label="Toggle navigation"
          @click="() => addBorder = !addBorder">
          <svg 
            xmlns="http://www.w3.org/2000/svg" 
            width="32" 
            height="32" 
            class="bi" 
            fill="currentColor" 
            viewBox="0 0 16 16"
          >
            <path 
              fill-rule="evenodd" 
              d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"
            >
            </path>
          </svg>
        </button>
        <div 
          class="collapse navbar-collapse" 
          id="navbarNavAltMarkup"
        >
          <ul class="navbar-nav">
            <li class="nav-item me-2">
              <nuxt-link 
                class="nav-link active" 
                aria-current="page" 
                to="/"
              > 
                HOME 
              </nuxt-link>
            </li>
            <li class="nav-item me-2">
              <nuxt-link class="nav-link" to="/" > SOLUTIONS </nuxt-link>
            </li>
            <li class="nav-item me-2">
              <nuxt-link class="nav-link"> BLOG </nuxt-link>
            </li>
            <li class="nav-item">
              <nuxt-link class="nav-link"> CONTACT </nuxt-link>
            </li>
          </ul>
        </div>
      </div>
  </nav> -->
  </div>
</template>
