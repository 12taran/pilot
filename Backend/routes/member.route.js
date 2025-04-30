import express from "express";
import {uploadMember} from "../middlewares/uploadMember.middleware.js";
import {
    createMember,
    getAllMembers,
    deleteMember
 } from "../controllers/member.controller.js";

 const router = express.Router();

 router.post('/create', uploadMember.single("image"), createMember);
 router.get('/getAll', getAllMembers);
 router.delete('/delete/:id',deleteMember);
 
 export default router;