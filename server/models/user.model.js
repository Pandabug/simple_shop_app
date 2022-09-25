const mongoose = require('mongoose');


const userModel = new mongoose.Schema({
    email: {
        type: String,
        required: true,
        unique: true,
        trim: true,
    },
    password: {
        type: String,
        required: true,
    },
    image: {
        type: String,
    },
});


module.exports = mongoose.model('users', userModel);