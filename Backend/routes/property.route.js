import express from 'express';
import {
    createProperty,
    getAllProperties,
    editProperty,
    deleteProperty,
} from '../controllers/property.controller.js';

import {uploadPropertyImages} from "../middlewares/uploadProperty.middleware.js";
import {isAdmin} from "../middlewares/isAdmin.middleware.js";

const router = express.Router();

router.route('/create').post(
    uploadPropertyImages.array("images", 20),isAdmin,
    createProperty
);
router.route('/getAll').get(getAllProperties);
router.route('/edit').patch(isAdmin,
    uploadPropertyImages.array("images", 20),
    editProperty
);
router.route('/delete').delete(isAdmin, deleteProperty);

export default router;