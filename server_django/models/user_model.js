const { default: mongoose } = require("mongoose");

const userSchema = mongoose.Schema({
    username:{
        type:String,
        required:true
    },
    email:{
        type:String, 
        required:true,
        trim:true,
    },
    profileUrl:{
        type:String,
    },
    password:{
        type:String,
        required:true
    },
    address:{
        type:String,
    },
    mobile:{
        type:String,
    },
    school:{
        type:String,
    },
    age:{
        type:Number,
    },
});

const User = mongoose.model('User',userSchema);
module.exports = User;