import express from "express";
import {uploadMember} from "../middlewares/uploadMember.middleware.js";
import {
    createMember,
    getAllMembers,
    editMember,
    deleteMember
 } from "../controllers/member.controller.js";

 const router = express.Router();

 router.route("/create").post(uploadMember.single("image"), createMember);
 router.route("/get").get(getAllMembers);
 router.route("/edit").patch(uploadMember.single("image"), editMember);
 router.route("/delete").delete(deleteMember);
 

 export default router;