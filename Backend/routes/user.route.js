import express from "express";
import { userVerify } from "../controllers/user.controller.js";

const router = express.Router();

router.route("/register/phone").post(userVerify);

export default router;
