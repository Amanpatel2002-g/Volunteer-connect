const express = require('express');
const JobModel = require('../models/job_model');
const ngoMiddleWare = require('../middlewares/ngo_middleware');
const jobRouter = express.Router();
const Authmiddleware = require('../middlewares/auth_middleware');
const NGOModel = require('../models/ngo_model');
const User = require('../models/user_model');
const { default: mongoose } = require('mongoose');
const { stringify } = require('nodemon/lib/utils');

jobRouter.post('/postJob', ngoMiddleWare, async (req, res) => {
    try {
        const { name, ngoId, startdate, enddate, heading, description, country, state, district, profileUrl } = req.body;
        let job = new JobModel({ ngoId: ngoId, startdate: startdate, enddate: enddate, heading: heading, description: description, country: country, state: state, district: district, name: name , profileUrl:profileUrl});
        job = await job.save();
        console.log(job);
        return res.json(job);
    } catch (error) {
        console.log("Error from /postjob: " + error.message);
        res.status(501).json({ err: error.message });
    }
});


jobRouter.get('/getJobs', async (req, res) => {
    try {
        const jobs = await JobModel.find();
        console.log(jobs);
        res.json(jobs);


    } catch (error) {
        return res.status(501).json({ err: error.message });
    }
});

jobRouter.post('/applyforNGO', async (req, res) => {
    try {

        const { jobId, userId } = req.body;
        const jobs = await JobModel.findByIdAndUpdate(jobId, { $push: { applied: userId } });
        console.log(jobs);
        res.json(jobs);

    } catch (error) {
        res.status(501).json({ err: error.message });
    }
});


jobRouter.get('/getJobByNgo/:ngoId', async (req, res) => {
    // would get the list of jobs released by ngo
    try {
        console.log("get the jobs by this ngo");
        let ngoId = req.params.ngoId;
        ngoId = ngoId.slice(1);
        console.log(ngoId);
        if (mongoose.Types.ObjectId.isValid(ngoId)) console.log('valid ngoId');
        const jobs = await JobModel.find({ ngoId: ngoId });
        if (!jobs) jobs = [];
        res.json(jobs);
    } catch (error) {
        res.status(501).json({ err: error.message });
    }

});

jobRouter.get('/getAppliedPeople/:jobId', async (req, res) => {
    try {
        let jobId = req.params.jobId;
        jobId = jobId.slice(1);
        console.log(jobId);
        if (mongoose.Types.ObjectId.isValid(jobId)) console.log('valid ngoId');
        let job = await JobModel.findById(jobId);
        let volunteers = [];
        for (let i = 0; i < job.applied.length; i++) {
            const id = job.applied[i];
            const vol = await User.findById(id);
            volunteers.push(vol);
        }
        console.log(volunteers);
        console.log("printing volunteers above")
        res.json(volunteers);
    } catch (error) {
        console.log(error.message);

        res.status(501).json({ err: error.message });
    }
})

module.exports = jobRouter;