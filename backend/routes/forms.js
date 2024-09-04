import express from "express";
import { checkAuth } from "../middlewares/checkAuth.js";
import { createForm, getAllForms, getForm, updateForm } from "../controllers/forms.js";

const router = express.Router();

router.post('/', checkAuth, createForm);
router.patch('/:id', checkAuth, updateForm);
router.get('/', checkAuth, getAllForms);
router.get('/:id', getForm);

export const formsRouter = router;
