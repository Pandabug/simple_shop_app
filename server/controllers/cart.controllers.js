const cartModel = require('../models/cart.model');
const productModel = require('../models/product.model');


module.exports = {
    create: async (req, res) => {
        try {
            const { id } = req.params;
            const { count } = req.body;

            const product = await productModel.findById(id);
            if (!product)
                return res.status(400).json({ message: 'Product not found!' });

            const cart = new cartModel({ userId: req.user.id, productId: id, count: count });
            await cart.save();

            cart.productId = product;

            res.status(200).json({ message: 'Product succesfully created!', cart: cart });
        } catch (e) {
            res.status(400).json({ message: 'Create cart error!' });
        }
    },

    findAll: async (req, res) => {
        try {
            const cart = await cartModel.find({ userId: req.user.id });
            if (!cart)
                return res.status(400).json({ message: 'Products not found!' });
                
            var cartProductList = [];
            for (var x = 0; x < cart.length; x++)
                cartProductList.push({'_id': cart[x]._id, 'userId': cart[x].userId, 'productId': await productModel.findById(cart[x].productId), 'count': cart[x].count, 'startDate': cart[x].startDate});
            
            res.status(200).json(cartProductList);
        } catch (e) {
            res.status(400).json({ message: 'Find all cart error!' });
        }
    },

    delete: async (req, res) => {
        try {
            const { id } = req.params;

            const cart = await cartModel.findById(id);
            if (!cart)
                return res.status(400).json({ message: 'Cart not found!' });

            await cart.delete();

            res.status(200).json({ message: 'Cart successfully deleted!' });
        } catch (e) {
            res.status(400).json({ message: 'Update cart error!' });
        }
    },
}