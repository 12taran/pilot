import cookieParser from "cookie-parser";
import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import multer from "multer";
import connectDB from "./utils/db.js";

import userRoute from "./routes/user.route.js";
import memberRoute from "./routes/member.route.js";

dotenv.config();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(cors({ origin: "*" }));

app.use('/uploads', express.static('uploads'));

app.get("/", (req, res) => {
  res.send(`Hello World`);
});

// api's
app.use("/api/v1/user", userRoute);
app.use("/api/v1/user/member", memberRoute);

//  Global error handler for image multer
app.use((err, req, res, next) => {
  if (err instanceof multer.MulterError || err.message.includes("Unexpected field")) {
    return res.status(400).json({
      message: "Please upload only one image",
      success: false,
    });
  }

  console.error(err.stack);
  res.status(500).json({
    message: "Something went wrong",
    success: false,
  });
});

const PORT = process.env.PORT;
app.listen(PORT, () => {
  connectDB();
  console.log(`Server is running on ${PORT}`);
});
