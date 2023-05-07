<template>
    <div
        class="jumping-dots-loader mb-3"> 
        <span></span> <span></span> <span></span> 
    </div>
</template>

<style>
.jumping-dots-loader span {
    display: inline-block;
    width: 0.63rem;
    height: 0.63rem;
    border-radius: 100%;
    background-color: var(--light-green)
 }

 .jumping-dots-loader span:nth-child(1) {
     animation: bounce 1s ease-in-out infinite
 }

 .jumping-dots-loader span:nth-child(2) {
     animation: bounce 1s ease-in-out 0.33s infinite
 }

 .jumping-dots-loader span:nth-child(3) {
     animation: bounce 1s ease-in-out 0.66s infinite
 }

@keyframes bounce {
    0%,
    75%,
    100% {
        -webkit-transform: translateY(0);
        -ms-transform: translateY(0);
        -o-transform: translateY(0);
        transform: translateY(0)
    }
    25% {
        -webkit-transform: translateY(-10px);
        -ms-transform: translateY(-10px);
        -o-transform: translateY(-10px);
        transform: translateY(-10px)
    }
 }
 @media(max-width: 1077px) {
    .jumping-dots-loader span {
        width: 0.5rem;
        height: 0.5rem;
    }
 }
</style>