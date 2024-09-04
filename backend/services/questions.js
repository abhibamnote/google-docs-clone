import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const createQuestionService = async (data) => {
    const question = prisma.question.create({
        data: {
            ...data
        }
    })

    return question;
}

export const updateQuestionService = async (questionId, data) => {
    const question = prisma.question.update({
        where: {
            id: questionId
        },
        data: {
            ...data
        }
    })
}

