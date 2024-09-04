import jwt from "jsonwebtoken";
import { catchAsync } from "../utils/catchAsync.js";
import AppError from "../utils/appError.js";
import { createUser, getUserByEmail, updateUserPassword } from "../services/user.js";
import {compareSync} from "bcrypt";


const createTokenAndSend = (user, res) => {
    const token = jwt.sign({
        id: user.id
    }, process.env.JWT, {
        expiresIn: '82d',
    })

    res.json({
        data: {
            token: token
        }
    });
}

export const registerUser = catchAsync(async (req, res, next) => {
    const data = req.body;
    if(!data.name || !data.email || !data.password){
        return next(new AppError("Please enter all details", 400));
    }

    const exists = await getUserByEmail(data.email);

    if(exists){
        next(new AppError("User already exisits", 401));
    }

    const user = await createUser(data);

    createTokenAndSend(user, res);
})

export const loginUser = catchAsync(async (req, res, next) => {
    const {email, password} = req.body;

    const user = await getUserByEmail(email);

    if(!user){
        next(new AppError("User not found", 404));
    }
    
    if(compareSync(password, user.password)){
        return createTokenAndSend(user, res);
    }

    next(new AppError("Incorrect password", 401));
})

export const changePassword = catchAsync(async (req, res, next) => {
    const {oldPass, newPass} = req.body;
    const email = req.user.email;
    const change = await updateUserPassword(email, oldPass, newPass);

    if(change){
        return res.status(200).json({
            success: true,
            message: "Password changed"
        })
    }

    next(new AppError("Something went wrong", 400));

})