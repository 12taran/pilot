import express from 'express';
import {
    createProperty,
    getAllProperties,
    getUserProperty,
    editProperty,
    deleteProperty,
    buyProperty,
    extendPropertyArea
} from '../controllers/property.controller.js';

import {uploadPropertyImages} from "../middlewares/uploadProperty.middleware.js";
import {isAdmin} from "../middlewares/isAdmin.middleware.js";

const router = express.Router();

router.route('/create').post(
    uploadPropertyImages.array("images", 20),isAdmin,
    createProperty
);
router.route('/getAll').get(getAllProperties);
router.route('/get/:userId').get(getUserProperty);
router.route('/edit').patch(
    uploadPropertyImages.array("images", 20),
    isAdmin,
    editProperty
);
router.route('/delete').delete(isAdmin, deleteProperty);
router.route('/buy').post(buyProperty);
router.route('/extend').patch(
    uploadPropertyImages.array("images", 20),
    isAdmin,
    extendPropertyArea
);
export default router;