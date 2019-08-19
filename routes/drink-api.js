var express = require('express');
var router = express.Router();


let drinks = {
    1: {
        id: 1,
        name: "GT"
        },
    2: {
        id: 2,
        name: "Old fashioned"
    }
}
/* GET users listing. */
router.get('/', (req, res) => {
    return res.send(Object.values(drinks));
});

router.get('/:id', (req, res) => {

    return res.send(drinks[req.params.id]);
});

router.post('/', (req, res) => {
    return res.send('Received a POST HTTP method');
});

router.put('/', (req, res) => {
    return res.send('Received a PUT HTTP method');
});

router.delete('/', (req, res) => {
    return res.send('Received a DELETE HTTP method');
});

module.exports = router;
