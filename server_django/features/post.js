const express = require('express');
const PostModel = require('../models/post_model');
const postRouter = express.Router();


// const PostSchema = mongoose.Schema({
//     name:{
//         type:String,
//         required:true
//     },
//     profileUrl:{
//         type:String,
//     },
//     date:{
//         type:String,
//         required:true
//     },
//     time:{
//         type:String,
//         required:true
//     },
//     imageUrl:{
//         type:String,
//     },
//     message:{
//         type:String,
//         required:true
//     }
// });


postRouter.post('/addPost', async (req, res) => {
    try {
        console.log("came here to save the post");
        const { name, profileUrl, date, time, imageUrl, message, senderId, postType } = req.body;
        let post = new PostModel({ name, profileUrl, date, time, imageUrl, message, senderId, postType });
        post = await post.save();
        res.json(post._doc);
        console.log("came here to save the post");
    } catch (error) {
        console.log(error.message);
        res.status(501).json({ err: error });
    }
});

postRouter.get('/getPosts', async (req, res) => {
    try {
        console.log("came on the getPosts");
        let posts = await PostModel.find();
        res.json(posts);
        console.log("leaving hte /getposts");
    } catch (error) {
        console.log("error on the /getPosts is: \n");
        res.status(501).json({ err: error });
    }
});

module.exports = postRouter;