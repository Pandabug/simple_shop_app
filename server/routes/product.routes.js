const router = require('express').Router();

const productController = require('../controllers/product.controllers');
const authMiddlewares = require('../middlewares/auth.middlewares');


router.get('/products', productController.findAll);
router.post('/product/create', authMiddlewares, productController.create);
router.get('/product/delete/:id', authMiddlewares, productController.delete);


module.exports = router;