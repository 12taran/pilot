import express from "express";
import { order, paymentVerify } from "../controllers/payment.controller.js";

const router = express.Router();

router.route("/order").post(order);
router.route("/verify").post(paymentVerify);

export default router;
