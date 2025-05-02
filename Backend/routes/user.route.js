import express from "express";
import {
  isAdmin
} from "../middlewares/isAdmin.middleware.js";
import {
  userEdit,
  userGet,
  userVerify,
  userById,
  userLogin,
  makeAdmin
} from "../controllers/user.controller.js";
import {upload} from "../middlewares/upload.middleware.js";

const router = express.Router();

router.route("/register/phone").post(userVerify);
router.route("/get").get(userGet);
router.route('/getById/:userId').get(userById);
router.route("/edit/:id").patch(upload.single("image"),userEdit);
router.route('/login').post(userLogin);
router.route('/makeAdmin').post(isAdmin,makeAdmin);

export default router;
