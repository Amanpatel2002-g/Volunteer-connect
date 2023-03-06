const { default: mongoose } = require("mongoose");

const PostSchema = mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    profileUrl:{
        type:String,
    },
    date:{
        type:String,
        required:true
    },
    time:{
        type:String,
        required:true
    },
    imageUrl:{
        type:String,
    },
    message:{
        type:String,
        required:true
    },
    senderId:{
        type:mongoose.Schema.Types.ObjectId, 
        required:true
    },
    postType:{
        type:String,
        required:true
    }
});

const PostModel = mongoose.model('PostSchema', PostSchema);
module.exports = PostModel;