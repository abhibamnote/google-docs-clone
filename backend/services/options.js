import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const createOptionService = async (data) => {
    const option = prisma.option.create({
        data: {
            ...data
        }
    })

    return option;
}

export const updateOptionService = async (id, data) => {
    const option = prisma.option.update({
        where: {
            id: id
        },
        data: {
            ...data
        }
    })

    return option;
}