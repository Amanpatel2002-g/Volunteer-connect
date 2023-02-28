const jwt = require("jsonwebtoken");
const { tokenKey } = require("../commons")

const ngoMiddleWare = async((req, res, next)=>{
    console.log("came here at ngoMiddleware");
    const token = req.header(tokenKey);
    const verify =  jwt.verify(token);
    if(!verify)res.status(501).json({err: 'token verificationo failed, Access Denied'});
    req.token = token;
    req.id = verify.id;
    next();
    console.log("left the ngomiddleware");
});

module.exports = ngoMiddleWare;
