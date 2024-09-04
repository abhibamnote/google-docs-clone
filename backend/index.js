import express, { json } from "express";
import {PrismaClient} from "@prisma/client";
import dotenv from "dotenv";
import { indexRouter } from "./routes/index.js";
import { GlobalError } from "./utils/globalError.js";
dotenv.config();

const app = express();
app.use(express.json({limit: '16kb'}));
app.use(express.urlencoded({ extended: true, limit: '16kb' }));
app.use(GlobalError);

app.use("/api/v1", indexRouter);

app.listen(process.env.PORT, ()=>{
    console.log("Connected at port ", process.env.PORT);
})