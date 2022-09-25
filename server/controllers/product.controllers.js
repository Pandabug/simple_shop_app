const productModel = require('../models/product.model');


module.exports = {
    create: async (req, res) => {
        try {
            const { name, description, price, image } = req.body;

            const product = new productModel({ userId: req.user.id, name: name, description: description, price: price, image: image });
            await product.save();

            res.status(200).json({ message: 'Product succesfully created!' });
        } catch (e) {
            res.status(400).json({ message: 'Create product error!' });
        }
    },

    findAll: async (req, res) => {
        try {
            const products = await productModel.find({});
            if (!products)
                return res.status(400).json({ message: 'Product not found!' });

            res.status(200).json(products);
        } catch (e) {
            res.status(400).json({ message: 'Find all product error!' });
        }
    },

    delete: async (req, res) => {
        try {
            const { id } = req.params;

            const product = await productModel.findById(id);
            if (!product)
                return res.status(400).json({ message: 'Product not found!' });
            
            if (product.userId != req.user.id)
                return res.status(400).json({ message: 'This user can\'t delelete this product!' });

            await product.delete();

            res.status(200).json({ message: 'Product successfully deleted!' });
        } catch (e) {
            res.status(400).json({ message: 'Update product error!' });
        }
    },
}