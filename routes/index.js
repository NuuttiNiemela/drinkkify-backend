var express = require('express');
var router = express.Router();
const db = require('../services/database');


import 'dotenv/config';



/* GET home page. */
router.get('/', function(req, res, next) {

  db.createTables();
  res.render('index', { title: 'Express' });
});

module.exports = router;
