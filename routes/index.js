var express = require('express');
var router = express.Router();
const url = require('url');
const db = require('../services/queries')



/* GET home page. */
router.get('/', function(req, res, next) {
  res.json({ info: 'Node.js, Express, and Postgres API' })
});

// router.get('/drinks', db.getDrinks())
// router.get('/drinks/:id', db.getDrinkById())
// router.post('/drinks', db.addDrink())
// router.put('/drinks/:id', db.updateDrink())
// router.delete('/drinks:id', db.deleteDrink())

router.route('/drinks')
    .get((req, res) => {
      db.getDrinks()
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
            consloe.log(e.message);
            res.status(400).send({virhe: e.message})
          })

    })

module.exports = router;

