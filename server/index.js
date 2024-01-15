const http = require('http');
const port = process.env.PORT || '3000';
const app = require('./app');

const server = http.createServer(app);

server.listen(port, (error) => {
    if (error) {
        return console.error(error);
    }
    console.log(`Listening on port: ${port}`);
});
