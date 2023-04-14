<template>
    <div class="row hover-menu">
        <div class="col p-0 position-relative customer-service">
            <hr class="vertical-line "/>
            <div class="dot"></div>
            <h4 class="text-dark-green text-center pt-1"> CUSTOMER SERVICE </h4>
        </div>
        <div class="col p-0 not-first position-relative">
            <div class="dot marketing"></div>
            <hr class="vertical-line marketing"/>
            <div class="dot"></div>
            <h4 class="text-dark-green text-center pt-1"> MARKETING </h4>
        </div>
        <div class="col p-0 not-first ">
            <hr class="vertical-line social-media"/>
            <div class="dot"></div>
            <h4 class="text-dark-green text-center pt-1"> SOCIAL MEDIA </h4>
        </div>
        <div class="col p-0 not-first ">
            <hr class="vertical-line health-care"/>
            <div class="dot"></div>
            <h4 class="text-dark-green text-center pt-1"> HEALTH CARE </h4>
        </div>
        <div class="col p-0 retail">
            <hr class="horizontal"/>
            <hr class="vertical-line "/>
            <div class="dot"></div>
            <h4 class="text-dark-green text-center pt-1"> RETAIL </h4>
        </div>
    </div>
</template>

<style scoped>
hr {
    margin: 0px;
}
h4 {
    font-size: 20px;
}
.row.hover-menu {
    width: 55rem;
    position: absolute;
    top: 5.2rem;
    left: 25rem;
    z-index: 2;
}
.customer-service h4{
    position: absolute;
    right: -6px;
    width: 13rem;
}
.customer-service .vertical-line {
    margin-left: 5rem;
    border-top: 2px solid var(--dark-green);
    animation: appearHr 5s;
}
.customer-service .dot {
    margin-left: 4.8rem;
}
.vertical-line {
    border: none;
    border-left: 2px solid var(--dark-green);
    height: 4rem;
    opacity: 1;
}

.vertical-line.marketing {
    height: 10rem;
    margin-top: -1rem;
}
.vertical-line.health-care {
    height: 9rem;
}
.not-first .vertical-line{
    margin-left: 5rem;
}
.not-first {
    border-top: 2px solid var(--dark-green);;
}
.not-first .vertical-line + .dot {
    margin-left: 4.8rem;
}
.retail .vertical-line {
    margin-left: 5rem;
}
.retail .dot{
    margin-left: 4.6rem;
}
.retail .horizontal {
    border: 1px solid var(--dark-green);
    opacity: 1;
    width: 5.12rem;
}
.dot {
    width: 0.62rem;
    height: 0.62rem;
    background: var(--dark-green);
    border-radius: 11px;
}
.dot.marketing {
    position: absolute;
    right: 5.6rem;
    top: -0.4rem;
}
</style>