const { default: mongoose } = require("mongoose");

const ngoSchema = mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    uniqueId:{
        type:String,
        required:true
    },
    password:{
        type:String,
        required:true,
    },
    state:{
        type:String,
    },
    District:{
        type:String,
    },
    Sector:{
        type:String,
    },

});

const NGOModel = mongoose.model('NGO schema', ngoSchema);
module.exports = NGOModel;