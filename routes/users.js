var express = require('express');
var router = express.Router();
const url = require('url');
const db = require('../services/queries')

/* GET users listing. */
router.route('/')
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

module.exports = router;
