const mongoose = require('mongoose');


const productModel = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'users',
        required: true,
    },
    name: {
        type: String,
    },
    description: {
        type: String,
    },
    price: {
        type: String,
    },
    image: {
        type: String,
    },
});


module.exports = mongoose.model('products', productModel);