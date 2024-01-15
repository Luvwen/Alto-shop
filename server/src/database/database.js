const sql = require('mssql');

const connectDb = async () => {
    try {
        const pool = await sql.connect({
            user: process.env.USER,
            password: process.env.PASSWORD,
            server: process.env.SERVER,
            database: process.env.DATABASE,
            options: {
                encrypt: true,
                trustServerCertificate: true,
            },
        });

        console.log('Conected to the database');
        return pool;
    } catch (error) {
        console.error(error);
    }
};

module.exports = connectDb;
