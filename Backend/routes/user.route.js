import express from "express";
import {
  userEdit,
  userGet,
  userVerify,
  userById,
  userLogin,
} from "../controllers/user.controller.js";

const router = express.Router();

router.route("/register/phone").post(userVerify);
router.route("/get").get(userGet);
router.route('/get/:userId').get(userById);
router.route("/edit/:id").patch(userEdit);
router.route('/login').post(userLogin);

export default router;
