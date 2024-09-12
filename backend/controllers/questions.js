import { catchAsync } from "../utils/catchAsync.js";
import AppError from "../utils/appError.js";
import { createQuestionService, updateQuestionService } from "../services/questions.js";

export const createQuestion = catchAsync(async (req, res, next) => {
    const data = req.body;
    // text: "",
    // required: false,
    // active: false
    // type: text 

    const question = await createQuestionService(data);

    res.status(200).json({
        success: true,
        message: "Question created",
        data: question
    })
})

export const updateQuestion = catchAsync(async (req, res, next) => {
    const data = req.body;
    const questionId = req.params.id;

    const question = updateQuestionService(questionId, data);

    res.status(200).json({
        success: true,
        message: "Question created",
        data: question
    })
})