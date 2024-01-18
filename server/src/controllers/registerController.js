const database = require('../database/database');

const registerController = {
    showRegister: (req, res) => {
        res.status(200).json({
            status: 200,
            message: 'Página de registro',
        });
    },
    registerForm: async (req, res) => {
        const { mail } = req.body;

        try {
            const pool = await database();
            const result = await pool
                .request()
                .query(`SELECT * FROM users WHERE user_mail = '${mail}'`);

            const formattedResult = result.recordsets[0];

            res.status(200).json({
                status: 200,
                result: formattedResult,
            });
        } catch (error) {
            res.status(404).json({
                status: 404,
                error: error,
            });
        }
    },
};

module.exports = registerController;
