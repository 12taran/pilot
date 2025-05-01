import cookieParser from "cookie-parser";
import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import connectDB from "./utils/db.js";
import userRoute from "./routes/user.route.js";
import paymentRoute from "./routes/payment.route.js";

dotenv.config();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(cors({ origin: "*" }));

const PORT = process.env.PORT;

app.get("/", (req, res) => {
  res.send(`Hello World`);
});

// api's
app.use("/api/v1/user", userRoute);
app.use("/api/v1/payment", paymentRoute);

app.listen(PORT, () => {
  connectDB();
  console.log(`Server is running on ${PORT}`);
});
