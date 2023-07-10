import crypto from "crypto";
import express from "express";
import session from "express-session";
import cookieParser from "cookie-parser";
const app = express();
const port = 8001;
const randomString = crypto.randomBytes(32).toString("hex");
app.use(cookieParser());
app.use(
  session({
    secret: randomString,
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false },
  })
);
console.log(randomString);

app.get("/", (req, res) => {
  req.session.username = "dawit wondwosen";
  res.send(req.session.username);
  // res.send("session setted");
});
app.get("/dashboard", (req, res) => {
  res.send(`welcome Mr.${req.session.username}`);
});
app.listen(port, () => {
  console.log("running on port " + port);
});
// import jwt from "jsonwebtoken";
// const payload = {
//   userId: 33,
//   Username: "dawit",
//   Role: "admin",
// };
// console.log(randomString);
// const token = jwt.sign(payload, randomString, { expiresIn: "1h" });
// console.log("generated token", token);

// jwt.verify(token, randomString, (err, decode) => {
//   if (err) {
//     console.log("error while decoding");
//     return;
//   }
//   console.log("Decoded payload", decode);
// });
