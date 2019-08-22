var express = require('express');
var router = express.Router();
const url = require('url');
const db = require('../services/queries')



/* GET home page. */
router.get('/', function(req, res, next) {
    res.send('/drinks => GET, POST _______ /drinks/:id => GET, PUT, DELETE')
});

router.route('/drinks')
    .get((req, res) => {
        db.getDrinks()
        // db.getDrinksWithJoin()
            .then(rivit => {
                res.status(200).send(rivit);
            })
            .catch(e => {
                console.log(e.message);
                res.status(400).send({virheviesti: e.message});
            });
    })

    .post((req, res)=> {
        const newDrink = req.body;
        db.addDrink(newDrink)  // Promise
            .then(id => {
                const locurl = url.format({
                    protocol: req.protocol,
                    host: req.get('host'),
                    pathname: req.originalUrl + "/" + id
                });
                res.setHeader('Location', locurl);
                newDrink.id = id;
                res.status(201).send(newDrink);
            })
            .catch(e=> {
                res.status(400).send({virhe: e.message})
            })
    });

router.route('/drinks/:id')
    .get((req, res) => {
        const id = parseInt(req.params.id);
        db.getDrinkById(id)
            .then(rivit => {
                res.status(200).send(rivit)
            })
            .catch(e => {
                console.log(e.message);
                res.status(400).send({virhe: e.message})
            })

    })
    .delete((req, res) => {
        const id = parseInt(req.params.id);
        db.deleteDrink(id)
            .then(rivit => {
                res.status(200).send(rivit)
            })
            .catch( e => {
                console.log(e.message);
                res.status(400).send({virhe: e.message})
            });
    })
    .put((req, res) => {
        const id = parseInt(req.params.id);
        const drinkData = {drink_name: req.body.drink_name, drink_instructions: req.body.drink_instructions};

        db.updateDrink(id, drinkData)
            .then(response => {
                res.status(200).send(response)
            })
            .catch( e => {
                console.log(e.message);
                res.status(400).send({virhe: e.message})
            });
    })
module.exports = router;

