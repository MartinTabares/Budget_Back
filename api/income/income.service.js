const pool = require("../../config/database");

module.exports = {
    getAllIncomesById: (data, callBack) => {
        pool.query(
            `SELECT inc.id, inc.description, inc.amount, u.fullname
             FROM income inc 
             JOIN user u ON inc.user_id = u.id 
             where user_id = ?`, 
             [    data.user_id   ],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    createIncome: (data, callBack) => {
        pool.query(
            `INSERT INTO income VALUES(null, ?, ?, ?)`,
            [
                data.description,
                data.amount,
                data.user_id
            ],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    update: (data, callBack) => {
        pool.query(
            `UPDATE income SET description = ?, amount = ? , user_id = ? WHERE id = ?`,
            [   data.description,
                data.amount,
                data.user_id,
                data.id ],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        )
    },
    delete: (data, callBack) => {
        pool.query(
            `DELETE FROM income WHERE id = ?`,
            [   data.id ],
            (error, results, fields) => {
                if (error) {
                    return callBack(error);
                }
                return callBack(null, results);
            }
        )
    }
}