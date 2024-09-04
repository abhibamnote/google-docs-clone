import { PrismaClient } from "@prisma/client";
import {hashSync, compareSync} from "bcrypt";

const prisma = new PrismaClient();

export const createUser = async (userInfo) => {
    const user = await prisma.user.create({
        data:{
            ...userInfo,
            password: hashSync(userInfo.password, 12)
        }
    })

    return user;
}

export const getUserById = async (id) => {
    const user = await prisma.user.findUnique({
        where: {
            id: id
        }
    })
}

export const getUserByEmail = async (email) => {
    const user = await prisma.user.findUnique({
        where: {
            email: email
        }
    })

    return user;
}

export const updateUserPassword = async (email, oldPass, newPass) => {
    const user = await prisma.user.findUnique({
        where: {
            email: email
        }
    })

    if(compareSync(oldPass, user.password)){
        const updatePassword = await prisma.user.update({
            where:{
                email: email
            },
            data: {
                password: hashSync(newPass, 12)
            }
        })

        return true;
    }

    return false;
}