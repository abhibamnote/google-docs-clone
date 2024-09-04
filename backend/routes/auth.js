import express from "express";
import { changePassword, loginUser, registerUser } from "../controllers/auth.js";
import { checkAuth } from "../middlewares/checkAuth.js";

const router = express.Router();

router.post('/signup', registerUser);
router.post('/login', loginUser);
router.post('change-password', checkAuth, changePassword);

router.get('/secret', checkAuth, (req, res)=> {
    res.send("Hello");
})

export const authRouter = router;