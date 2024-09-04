import jwt from "jsonwebtoken";
import { getUserById } from "../services/user.js";


export const checkAuth = async (req, res, next) => {
    const token = req.headers["authorization"];
    
    if(!token){
        return res.status(401).send("Access Denied. No token provided.");
    }

    try {
        const decode = jwt.verify(token, process.env.JWT);
        const user = await getUserById(decode.id);
        req.user = user;
        next();
    } catch (error) {
        return res.status(400).json({
            message: "Token invalid",
            success: false
        });
    }
}