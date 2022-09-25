const router = require('express').Router();

const cartController = require('../controllers/cart.controllers');
const authMiddlewares = require('../middlewares/auth.middlewares');


router.get('/cart', authMiddlewares, cartController.findAll);
router.post('/cart/create/:id', authMiddlewares, cartController.create);
router.get('/cart/delete/:id', authMiddlewares, cartController.delete);


module.exports = router;