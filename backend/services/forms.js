import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const createFormService = async (data) => {
    const form = await prisma.form.create({
        data: {
            ...data
        }
    })

    return form;
}

export const updateFormService = async (id, userId, data) => {
    const form = await prisma.form.update({
        where: {
            id: id,
            userId: userId
        },
        data: {
            ...data
        }
    })

    return form;
}

export const getAllFormsService = async (userId) => {
    const forms = await prisma.form.findMany({
        where: {
            userId: userId
        }
    })

    return forms;
}

export const getFormService = async (id) => {
    const form = await prisma.form.findUnique({
        where:{
            id: id
        },
        include: {
            questions: {
                include: {
                    options: true
                }
            }
        }
    })

    return form;
}

export const deleteFormService = async (id) => {
    await prisma.form.delete({
        where: {
            id: id
        }
    })
}