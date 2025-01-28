var express = require('express');
const { addPanjayath, getPanjayath, updatePanjayath, deletePanjayath } = require('../controller/PanjayathController');
var router = express.Router();

router.route('/')
    .get(getPanjayath)
    .post(addPanjayath)

router.route('/:id')
    .put(updatePanjayath)
    .delete(deletePanjayath)

// router.post('/login', panjayathLogin);

module.exports = router;
