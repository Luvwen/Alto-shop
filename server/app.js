const cookieParser = require('cookie-parser');
const cors = require('cors');
const express = require('express');
const path = require('path');

require('dotenv').config();

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
