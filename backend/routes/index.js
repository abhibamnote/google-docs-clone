import express from "express";
import { authRouter } from "./auth.js";
import { formsRouter } from "./forms.js";
import { questionsRouter } from "./questions.js";

const router = express.Router();

router.use("/auth", authRouter);
router.use('/forms', formsRouter);
router.use('/questions', questionsRouter);

export const indexRouter = router;