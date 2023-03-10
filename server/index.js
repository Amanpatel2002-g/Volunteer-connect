const Express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./auth/Userauth');
const ngoauthRouter = require('./auth/Ngoauth');
const jobRouter = require('./features/job_releases');
const postRouter = require('./features/post');
const app = Express();
const PORT = 3000;
const DB = "mongodb+srv://AmanPatel:amanpatel@cluster0.odjac11.mongodb.net/?retryWrites=true&w=majority";


app.use(Express.json());
app.use('/api/user/',authRouter);
app.use('/api/ngo/', ngoauthRouter);
app.use('/api', jobRouter);
app.use('/api/post', postRouter);


mongoose.connect(DB).then(() => {
    console.log("Database Connected");
}).catch((e) => {
    console.log({ "The error is": e });
});


app.listen(PORT, () => {
    console.log(`server running at http://localhost:${PORT}`);
});

