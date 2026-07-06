<template>
    <div v-for="([a, b]) of Object.entries(obj)">array destructuring wrapped in parens</div>
    <div v-for="[a, b] of Object.entries(obj)">array destructuring without parens</div>
    <div v-for="([key, value], i) of Object.entries(obj)">destructured value with index</div>
    <div v-for="(a, b) of Object.entries(obj)">plain value and key</div>
    <div v-for="{ foo, bar } of items">object destructuring</div>
    <div v-for="item of items">simple alias</div>
</template>
