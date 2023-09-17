const express = require('express');
const app = express();
const mongoose = require('mongoose');

const DB = `mongodb+srv://enigmageu:enigmageu@cluster0.yxj9duc.mongodb.net/?retryWrites=true&w=majority&appName=AtlasApp`;

mongoose.connect(DB).then(() => {
    console.log('Connection successful');
}).catch((err) => {
    console.log('Connection failed');
})

app.get('/', (req, resp) => {
    console.log('Hello world');
})
app.get('/404', (req, resp) => {
    console.log('Hello - This page does not exist');
})
app.get('/about', (req, resp) => {
    console.log('Hello - This is about page');
})
app.get('/certificates', (req, resp) => {
    console.log('Hello - This is certificates page');
})
app.get('/home', (req, resp) => {
    console.log('Hello - This is home page');
})
app.get('/signin', (req, resp) => {
    console.log('Hello - This is signin page');
})
app.get('/signup', (req, resp) => {
    console.log('Hello - This is signup page');
})

app.listen(5000, () => {
    console.log('Server is running on port 5000');
})