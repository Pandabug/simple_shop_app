const mongoose = require('mongoose');


mongoose.connect(process.env.MONGOOSE_URL || 'mongodb://127.0.0.1:27017/simple_shop_app_db_tests', {
    useNewUrlParser: true,
    useUnifiedTopology: true
});

const db = mongoose.connection;


module.exports = db;