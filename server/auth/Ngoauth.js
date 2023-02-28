const express = require('express');
var jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const User = require('../models/user_model');
const mongoose = require('mongoose');
const NGOModel = require('../models/ngo_model');
const { tokenKey } = require('../commons');

const ngoauthRouter = express.Router();

ngoauthRouter.post('/signUp', async (req, res)=>{
    const {name, uniqueId, password} = req.body;
    const existingNGO = await NGOModel.findOne({uniqueId});
    if(!existingNGO){
        let encryptedPassword = await bcryptjs.hash(password, 8);
        let newNgo = new NGOModel({name, uniqueId, password:encryptedPassword});
        newNgo = await newNgo.save();
        const token = jwt.sign({id: newNgo._id}, tokenKey);
        res.json({...newNgo._doc, token});
        return;
    }
    return res.status(401).json({ msg: "NGO already exists please sign in then" });
});

ngoauthRouter.post('/signIn', async(req, res)=>{
    const {uniqueId, password} = req.body;
    const existingNGO = await NGOModel.findOne({uniqueId:uniqueId});
    if(existingNGO){
        const verify = await bcryptjs.compare(password, existingNGO.password);
        if(verify){
            const token = jwt.sign({id:existingNGO._id}, tokenKey);
            return res.json({...existingNGO._doc, token});
        }
        return res.status(401).json({ msg: "Password doesn't match." })
    }
    return res.status(401).json({ msg: "NGO already exists please sign in then" });
});


module.exports = ngoauthRouter;