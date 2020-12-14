const service = require("./income.service");

module.exports = {
    getAll: (req, res) => {
        service.getAllIncomesById(req.body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: err.message
                })
            }
            return res.status(200).json({
                success: 1,
                data: results
            })
        });
    },
    create: (req, res) => {
        service.createIncome(req.body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: err.message
                })
            }
            return res.status(200).json({
                success: 1,
                data: results
            })
        });
    },
    update: (req, res) => {
        service.update(req.body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: err.message
                })
            }
            return res.status(200).json({
                success: 1,
                data: results
            })
        })
    },
    delete: (req, res) => {
        service.delete(req.body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: err.message
                })
            }
            return res.status(200).json({
                success: 1,
                data: results
            })
        })
    }
}