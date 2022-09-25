const router = require('express').Router();

const authRoutes = require('./auth.routes');
const productRoutes = require('./product.routes');
const cartRoutes = require('./cart.routes');


router.use(authRoutes);
router.use(productRoutes);
router.use(cartRoutes);


module.exports = router;