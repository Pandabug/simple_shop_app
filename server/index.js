require('dotenv').config();

require('./db/index');
const app = require('./app');


const PORT = process.env.PORT || 3000;


app.listen(PORT, () => console.log(`Server running on port:${PORT}, http://localhost:${PORT}/api`));