const jwt = require('jsonwebtoken');
const { tokenKey } = require('../commons');

AuthMiddlware = (req, res, next) => {
    try {
        const token = req.header('token');
        if (!token) {
            return res.json({ msg: 'No auth Token, access denied' });
        }
        const user = jwt.verify(token, tokenKey);
        // req.token = token;
        if (!user) {
            return res.status(401).json({ msg: 'Token verification failed, Access Denied' });
        }
        req.token = token;
        req.id = user.id;
        next();
    } catch (error) {
        res.json({ err: error.message });
    }
}

module.exports = AuthMiddlware;