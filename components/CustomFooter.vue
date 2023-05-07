<script setup>
</script>

<template>
    <div class="footer w-100">
        <div class="row align-items-start">
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Multilingual Support </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > About us </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > FAQ's </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Facebook </nuxt-link>
            </div>
        </div>
        <div class="row align-items-start">
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Commerce Solutions </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Contact us </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > How to </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Instagram </nuxt-link>
            </div>
        </div>
        <div class="row align-items-start">
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Social Media </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Blog </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Site Map </nuxt-link>
            </div>
            <div class="col-lg-3">
                <a 
                    class="nav-link"
                    href="https://api.whatsapp.com/send?phone=13052041810"
                    target="_blank"
                > 
                    Whatsapp 
                </a>
            </div>
        </div>
        <div class="row align-items-start">
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Marketing </nuxt-link>
            </div>
            <div class="col-lg-3">
                <nuxt-link class="nav-link" > Careers </nuxt-link>
            </div>
        </div>
    </div>
</template>

<style scoped>
.footer.w-100 {
    background: #0e0e0e;
    padding: 29px 0px;
    border-top-right-radius: 76px;
    border-top-left-radius: 76px;
    position: absolute;
    top: 100vh;;
}
.footer a{
    color: var(--light-green)
}
.footer a.nav-link {
    text-align: start!important;
    width: 13rem;
}
.footer .col-lg-3 {
    display: flex;
    align-items: center;
    justify-content: center;
}
.footer .row.align-items-start {
    width: inherit;
}
</style>