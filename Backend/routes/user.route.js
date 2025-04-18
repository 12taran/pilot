import express from "express";
import {
  userEdit,
  userGet,
  userVerify,
} from "../controllers/user.controller.js";

const router = express.Router();

router.route("/register/phone").post(userVerify);
router.route("/get").get(userGet);
router.route("/edit/:id").post(userEdit);

export default router;
