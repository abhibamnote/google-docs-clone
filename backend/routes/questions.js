import express from "express";
import { checkAuth } from "../middlewares/checkAuth.js";
import { createQuestion, updateQuestion } from "../controllers/questions.js";

const router = express.Router();

router.post('/', createQuestion);
router.patch('/:id', updateQuestion);

export const questionsRouter = router;
