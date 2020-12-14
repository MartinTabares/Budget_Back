const pool = require("../../config/database");

module.exports = {

    getAllExpensesById: (data, callBack) => {
        pool.query(
            `SELECT exp.id, exp.description, exp.amount, u.fullname
             FROM expenses exp 
             JOIN user u ON exp.user_id = u.id 
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
    createExpense: (data, callBack) => {
        pool.query(
            `INSERT INTO expenses VALUES(null, ?, ?, ?)`,
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
            `UPDATE expenses SET description = ?, amount = ? , user_id = ? WHERE id = ?`,
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
            `DELETE FROM expenses WHERE id = ?`,
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