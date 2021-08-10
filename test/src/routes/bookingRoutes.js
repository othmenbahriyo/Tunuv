const express = require('express');
const mongoose = require('mongoose');
const requireAuth = require("../middlewares/requireAuth");

const Booking = mongoose.model('booking');
const router = express.Router();



router.get('/bookings', async (req, res) => {
    const booking = await Booking.find();

    res.send(booking);

});

router.post('/bookings', async ( req, res ) => {
    const { hotel, userId, price ,rate } = req.body;

    if(!hotel || !userId || !price|| !rate ) {
        return res.status(422).send({ error: "You must provide a ...." });
    }
    try{
        const booking = new Booking({hotel: hotel, userid: userId, price: price, rate:rate });
        await booking.save();
        res.send(booking); 
    } catch(err) {
        res.status(422).send({error: err.message }); 
    };
    
})


router.get('/booking:id_user', async (req, res) => {
    id_user = req.params.id_user
    await Booking.find({
        userid: id_user
    }, async function (err, result) {
        console.log(result)
        res.json(result)

    });
});


module.exports = router;