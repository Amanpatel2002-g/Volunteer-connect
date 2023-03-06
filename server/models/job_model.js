const { default: mongoose } = require("mongoose");

const JobSchema = mongoose.Schema({
    ngoId:{
        required:true,
        type:mongoose.Schema.Types.ObjectId
    },
    profileUrl:{
        type:String,
    },
    name:{
        required:true,
        type:String,
    },
    startdate:{
        required:true,
        type: String,
    }, 
    enddate:{
        required:true,
        type:String,
    },
    country:{
        type:String,
        required:true
    },
    state:{
        type:String,
        required:true
    },
    district:{
        type:String,
        required:true
    },
    heading:{
        rquired:true,
        type:String,
    },
    description:{
        required:true,
        type:String,
    },
    applied:[{
        type:mongoose.Schema.Types.ObjectId
    }]

});

const JobModel = mongoose.model('JobSchema', JobSchema);
module.exports = JobModel;

