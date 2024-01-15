const cookieParser = require('cookie-parser');
const cors = require('cors');
const express = require('express');
const path = require('path');
const app = express();
const routes = require('./src/routes/index.js');
const connectDb = require('./src/database/database.js');
require('dotenv').config();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

connectDb();

app.use('/', routes);

module.exports = app;
