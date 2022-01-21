var express = require('express');
var router = express.Router();
const databaseHelper = require("../databaseHelper/databaseHelper")

/* GET home page. */
// router.get('/', function(req, res, next) {
//   console.log("SAGAL")
//   // res.render('index', { title: 'Express' });
// });
module.exports = (db) => {
router.get('/test', function(req,res,next){
  console.log("SAGAL")
})
//user can favorite items in chat
router.post('/favorites', function(req,res){
  const chat_room_id= req.body.roomID
  const user_id = req.body.userID
  const text= req.body.text
  databaseHelper.favoritedMsg(chat_room_id, user_id, text,db)
  .then((newFavoritedMsg) => {
          if(!newFavoritedMsg){
            res.send({error: "no favorited msg"})
            return;
          }
          res.json(newFavoritedMsg);
        })
        .catch((e) => res.send(e));
})
}
module.exports = router;
