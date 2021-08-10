const mongoose = require('mongoose');

const pointSchema = new mongoose.Schema({
    coords: {
        latitude: Number,
        longitude: Number,
        altitude: Number,
        place: String,
        price: String
    },
});
const trackSchema = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId , //to indicate that user id is referenced to some other object stored inside mongodb
        ref: 'User'
    },
    name: {
        type: String,
        default: '',
    },

    locations: [pointSchema]
});

mongoose.model('Track', trackSchema);