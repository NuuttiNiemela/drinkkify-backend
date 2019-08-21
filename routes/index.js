var express = require('express');
var router = express.Router();
const url = require('url');
const db = require('../services/queries')



/* GET home page. */
router.get('/', function(req, res, next) {
  res.json({ info: 'Upea Drinkkipalvelu' })
});



module.exports = router;

