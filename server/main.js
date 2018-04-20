const express = require("express");
const shell = require("shelljs");

const app = express();

app.get("/", (req, res) => {
	shell.exec("../goatfact.sh");
	res.send("fact generated");
});

app.listen(3000, () => console.log("listening on port 3000"));
