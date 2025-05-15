import express from "express";
import { storeBank } from "../controllers/bank.controller.js";

const router = express.Router();

router.route("/bank-details").post(storeBank);

export default router;
