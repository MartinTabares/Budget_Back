require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const income_router = require("./api/income/income.router");
const expense_router = require("./api/expense/expense.router");

app.use(bodyParser.json());

app.use("/api/income", income_router);
app.use("/api/expense", expense_router);

app.get("/api", (req, res) => {
    res.json({
        success: 1,
        message: "Api is up"
    });
});

app.listen(process.env.APP_PORT, () => {
    console.log("Server running on port: ", process.env.APP_PORT);
});
