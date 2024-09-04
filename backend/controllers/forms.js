import { catchAsync } from "../utils/catchAsync.js";
import AppError from "../utils/appError.js";
import { createFormService, deleteFormService, getAllFormsService, getFormService, updateFormService } from "../services/forms.js";

export const createForm = catchAsync(async (req, res, next) => {
    // const data = req.body
    const data = {
        userId: req.user.id,
        active: false
    }

    const form = await createFormService(data);

    res.status(200).json({
        success: true,
        data: form
    })
})

export const updateForm = catchAsync(async (req, res, next) => {
    const data = req.body;
    const formId = req.params.id;
    const userId = req.user.id

    const updatedForm = await updateFormService(formId, userId, data);

    if(!updateForm){
        next(new AppError("Unauthorized request.", 400));
    }

    res.status(200).json({
        success: true,
        data: updatedForm
    })
})

export const getAllForms = catchAsync(async (req, res, next) => {
    // const userId = req.user.id;

    const forms = await getAllFormsService(req.user.id);

    res.status(200).json({
        success: true,
        data: forms
    })
})

export const getForm = catchAsync(async (req, res, next) => {
    const formId = req.params.id;

    const form = await getFormService(formId);

    res.status(200).json({
        success: true,
        data: form
    })
})

export const deleteForm = catchAsync(async (req, res, next) => {
    await deleteFormService(req.params.id);
    res.status(200).json({
        success: true,
        message: "Form deleted"
    })
})