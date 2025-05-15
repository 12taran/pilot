import express from 'express';
import { getUserInvestments } from '../controllers/investment.controller.js';

const router = express.Router();

router.get('/:userId', getUserInvestments);

export default router;
