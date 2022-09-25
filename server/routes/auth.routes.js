const router = require('express').Router();

const authController = require('../controllers/auth.controllers');
const authMiddlewares = require('../middlewares/auth.middlewares');


router.post('/auth/login', authController.login);
router.post('/auth/signup', authController.signup);

router.get('/profile', authMiddlewares, authController.profile);


module.exports = router;