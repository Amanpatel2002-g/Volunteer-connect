const jwt = require("jsonwebtoken");
const { tokenKey } = require("../commons")

const ngoMiddleWare = ((req, res, next) => {
    try {
        console.log("came here at ngoMiddleware");
        console.log(tokenKey);
        const token = req.header(tokenKey);
        const verify = jwt.verify(token, tokenKey);
        if (!verify) res.status(501).json({ err: 'token verificationo failed, Access Denied' });
        req.token = token;
        req.id = verify.id;
        next();
        console.log("left the ngomiddleware");
    } catch (error) {
        res.status(501).json({ err: error.message });
        console.log(error.message);
    }
});

module.exports = ngoMiddleWare;
