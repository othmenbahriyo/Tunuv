const mongoose = require('mongoose');

const bookingSchema = new mongoose.Schema({
        hotel: String,
        userid: String,
        price: Number,
        rate: String,
});


mongoose.model('booking', bookingSchema);