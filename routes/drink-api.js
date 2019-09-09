var express = require('express');
var router = express.Router();
const url = require('url');
const db = require('../services/queries')
const admin = require('../firebase-admin/admin');

async function verifyToken(req, res, next) {
    const idToken = req.headers.authorization;

    try {
        const decodedToken = await admin.auth().verifyIdToken(idToken);

        if (decodedToken) {
            req.body.uid = decodedToken.uid;

            return next();
        } else {
            return res.status(401).send("You're not logged in!");
        }
    } catch (e) {
        return res.status(401).send("You're not logged in!");
    }
}




/* GET home page. */
router.get('/', function(req, res, next) {
    res.send('<p>/api/drinks => GET, POST</p>' +
        '<p>/api/drinks/:id => GET, PUT, DELETE BY ID </p>' +
        '<p>/api/drinks/haku?name="kirjoita"</p>' +
        '<p>/api/ingredients => GET</p>' +
        '<p>/api/ingredients => GET with query: key: i_name, value: whatever</p>')
});

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
        console.log(newDrink);
        db.addDrinkRecipe(newDrink)  // Promise
            .then(id => {
                console.log('Tässä on addRinkRecipen iidee' + id)
                const locurl = url.format({
                    protocol: req.protocol,
                    host: req.get('host'),
                    pathname: req.originalUrl + "/" + id
                });
                res.setHeader('Location', locurl);
                newDrink.id = id;
                res.status(201).send(newDrink.id);
            })
            .catch(e=> {
                res.status(400).send({virhe_recipe: e.message})
            })
    });

router.route('/drinks/actionsbyid/:id')
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

router.route('/drinks/haku')
    .get((req, res) => {
        const drinkName = req.query.name;
        console.log(drinkName);
        db.getDrinkByName(drinkName)
            .then(response => {
                console.log(response)
                res.status(200).send(response);
            })
            .catch( e => {
                console.log(e.message);
                res.status(400).send({virhe: e.message});
            })

    })

router.route('/ingredients/search')
    .get((req, res) => {
        db.getIngredientByName(req.query.name)
            .then(response => {
                console.log(response)
                res.status(200).send(response);
            })
            .catch( e => {
                console.log(e.message);
                res.status(400).send({virhe: e.message});
            })

    })
router.route('/ingredients')
    .get((req, res) => {
        db.getIngredients()
            .then(rivit => {
                res.status(200).send(rivit);
            })
            .catch(e => {
                console.log(e.message);
                res.status(400).send({virheviesti: e.message});
            });
    })
    .post((req, res)=> {
        const newIngredient = req.body;
        const email = req.query.email;
        db.addIngredient(newIngredient,email)  // Promise
            .then(id => {
                const locurl = url.format({
                    protocol: req.protocol,
                    host: req.get('host'),
                    pathname: req.originalUrl + "/" + id
                });
                res.setHeader('Location', locurl);
                newIngredient.id = id;
                res.status(201).send(newIngredient.id);
            })
            .catch(e=> {
                res.status(400).send({virhe: e.message})
            })
    });

router.route('/cabinetverify/:email',verifyToken)
    .get((req, res) => {
        db.getOwnIngredients(req.params.email)
            .then(rivit => {
                res.status(200).send(rivit);
            })
            .catch(e => {
                console.log(e.message);
                res.status(400).send({virheviesti: e.message});
            });
    })
    .post((req, res) => {
        const newOwnIngredient = req.body;
        db.addToCabinet(req.params.email, newOwnIngredient)
            .then(id => {
                console.log('Tässä ingredient id: ' + id)
                const locurl = url.format({
                    protocol: req.protocol,
                    host: req.get('host'),
                    pathname: req.originalUrl + "/" + id
                });
                res.setHeader('Location', locurl);
                newOwnIngredient.id = id;
                res.status(201).send(newOwnIngredient.id);
            })
            .catch(e=> {
                res.status(400).send({virheviesti: e.message})
            })
    })

router.route('/cabinetverify/del')
    .delete((req, res) => {
        const email = req.query.email;
        const id = req.query.id;
        const num = db.removeFromCabin(email,id).then((value) => {res.status(200).send(value)})
        console.log(num)
    })

router.route('/cabinetverify/search/drinkkify')
    .get((req, res) => {
        const email = req.query.email;
        db.drinkkify(email)
            .then(rivit => {
                res.status(200).send(rivit);
            })
            .catch(e => {
                console.log(e.message);
                res.status(400).send({virheviesti: e.message});
            })
    })

router.route('/user')
    .post((req, res) => {
        const newUser = req.body;
        db.addUser(newUser)  // Promise
            .then(uid => {
                console.log('Tässä on addUserin iidee' + uid)
                const locurl = url.format({
                    protocol: req.protocol,
                    host: req.get('host'),
                    pathname: req.originalUrl + "/" + uid
                });
                res.setHeader('Location', locurl);
                newUser.id = uid;
                res.status(201).send(newUser.id);
            })
            .catch(e=> {
                res.status(400).send({virhe_recipe: e.message})
            })
    })

router.route('/cabinet')
    .get((req, res) => {
        db.getIngredients()
            .then(rivit => {
                res.status(200).send(rivit);
            })
            .catch(e => {
                console.log(e.message);
                res.status(400).send({virheviesti: e.message});
            });
    })
    .post((req, res)=> {
        const ingredient = req.body;
        db.addToCabinet(ingredient)  // Promise
            .then(response => {
                ingredient.id = response;
                res.status(201).json(ingredient);
            })
            .catch(e=> {
                res.status(400).send({adding_ingredient_to_cabinet_: e.message})
            })
    });


module.exports = router;

