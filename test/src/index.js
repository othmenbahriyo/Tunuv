require("./models/User");
require("./models/Track");
require("./models/Booking");
const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require('body-parser');
const authRoutes = require("./routes/authRoutes");
const trackroutes = require('./routes/trackRoutes');
const requireAuth = require('./middlewares/requireAuth');
const bookingroutes = require('./routes/bookingRoutes');

const app = express();

app.use(bodyParser.json());
app.use(authRoutes);
app.use(trackroutes);
app.use(bookingroutes);

//const mongoUri = 'mongodb+srv://hbUser:<password>@cluster0.spjhk.mongodb.net/<dbname>?retryWrites=true&w=majority';
const mongoUri = 'mongodb://localhost:27017/oth';
mongoose.connect(mongoUri, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
});

mongoose.connection.on('connected', () => {
    console.log('connected to mongoose instance')
});

mongoose.connection.on('error', (err) => {
    console.error('Error connecting to mongodb', err);
});


app.get('/', requireAuth, (req, res) => {
    res.send(`your email:${req.user.email}`);
});


app.listen(3000, () => {
    console.log("listening on port 3000");
});