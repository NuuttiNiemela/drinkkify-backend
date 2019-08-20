var express = require('express');
var router = express.Router();
var drinkservice = require('../services/drinkservice')


/* GET users listing. */

router.route('/')
    .get((req, res) => {
        drinkservice.getAllDrinks()
            .then(rivit => {
                res.status(200).send(rivit);
            })
            .catch(e => {
                console.log(e.message);
                res.status(400).send({virheviesti: e.message});
            });
    });

// router.get('/', (req, res) => {
//     drinkservice.getAllDrinks()
//     return res.send(Object.values(drinks));
// });
//
// router.get('/:id', (req, res) => {
//
//     return res.send(drinks[req.params.id]);
// });
//
// router.post('/', (req, res) => {
//     return res.send('Received a POST HTTP method');
// });
//
// router.put('/', (req, res) => {
//     return res.send('Received a PUT HTTP method');
// });
//
// router.delete('/', (req, res) => {
//     return res.send('Received a DELETE HTTP method');
// });

module.exports = router;
