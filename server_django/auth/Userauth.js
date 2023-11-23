const express = require('express');
var jwt = require('jsonwebtoken');
const authRouter = express.Router();
const bcryptjs = require('bcryptjs');
const User = require('../models/user_model');
const mongoose = require('mongoose');
const { tokenKey } = require('../commons');
authRouter.post('/signup', async (req, res) => {
    try {
        const { username, email, password } = req.body;
        const existingUser = await User.findOne({ email: email });
        if (existingUser) {
            return res.status(401).json({ msg: "email already exists please sign in then" });
        }
        const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            username,
            email,
            password: hashedPassword,
        });
        user = await user.save();
        // getting the token now;
        console.log(user);
        const token = jwt.sign({ id: user._id }, tokenKey);
        res.json({ ...user._doc, token });
    } catch (error) {
        res.status(500).json({ err: error.message });
    }

});
authRouter.post('/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        const existingUser = await User.findOne({ email: email });
        if (!existingUser) {
            return res.status(400).json({ msg: 'User with this email does not exist' })
        }
        const isMatch = await bcryptjs.compare(password, existingUser.password);
        if(!isMatch){
            return res.status(400).json({msg:'password doesnot match'});
        }
        const token = jwt.sign({ id: existingUser._id }, 'x-auth-token');
        res.json({ ...existingUser._doc, token });
    } catch (error) {
        res.status(500).json({ err: error.message });
    }
});

authRouter.get('/verifyToken', async (req, res) => {
    try {
        console.log("came here ");
        const token = req.header('token');
        if (!token) {
            return res.status(400).json({ msg: "token Invalid, Access Denied" })
        }
        const isVerified = jwt.verify(token, 'x-auth-token');
        const userId = isVerified.id;
        console.log(userId);
        const user = await User.findById(userId);
        console.log({ ...user._doc, token });
        res.json({ ...user._doc, token });
        console.log("came here");
    } catch (error) {
        console.log(error.message);
        res.status(500).json({ err: error.message });
    }
});

module.exports = authRouter;