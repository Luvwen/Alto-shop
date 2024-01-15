const database = require('../database/database');

const homeController = {
    showHome: async (req, res) => {
        try {
            const pool = await database();
            const queryResult = await pool.request('SELECT 15');
            res.status(200).json({
                status: 200,
                message: queryResult,
            });
        } catch (error) {
            res.status(500).json({
                status: 500,
                error: error,
            });
        } finally {
            pool.close();
        }
    },
};

module.exports = homeController;
