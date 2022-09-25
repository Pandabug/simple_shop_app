const mongoose = require('mongoose');


const cartModel = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'users',
        required: true,
    },
    productId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'products',
        required: true,
    },
    count: {
        type: String,
    },
    startDate: {
        type: Date,
        default: Date.now(),
    },
});


module.exports = mongoose.model('carts', cartModel);