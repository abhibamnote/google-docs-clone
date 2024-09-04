/*
  Warnings:

  - The primary key for the `Form` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Form` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `FormResponse` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `FormResponse` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `userId` column on the `FormResponse` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Option` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Option` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Question` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Question` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Response` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Response` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ResponseOption` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `ResponseOption` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `userId` on the `Form` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `formId` on the `FormResponse` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `questionId` on the `Option` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `formId` on the `Option` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `formId` on the `Question` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `questionId` on the `Response` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `formId` on the `Response` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `formResponseId` on the `Response` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `optionId` on the `ResponseOption` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `responseId` on the `ResponseOption` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Form" DROP CONSTRAINT "Form_userId_fkey";

-- DropForeignKey
ALTER TABLE "FormResponse" DROP CONSTRAINT "FormResponse_formId_fkey";

-- DropForeignKey
ALTER TABLE "Option" DROP CONSTRAINT "Option_questionId_fkey";

-- DropForeignKey
ALTER TABLE "Question" DROP CONSTRAINT "Question_formId_fkey";

-- DropForeignKey
ALTER TABLE "Response" DROP CONSTRAINT "Response_formResponseId_fkey";

-- DropForeignKey
ALTER TABLE "Response" DROP CONSTRAINT "Response_questionId_fkey";

-- DropForeignKey
ALTER TABLE "ResponseOption" DROP CONSTRAINT "ResponseOption_optionId_fkey";

-- DropForeignKey
ALTER TABLE "ResponseOption" DROP CONSTRAINT "ResponseOption_responseId_fkey";

-- AlterTable
ALTER TABLE "Form" DROP CONSTRAINT "Form_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "Form_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "FormResponse" DROP CONSTRAINT "FormResponse_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "formId",
ADD COLUMN     "formId" INTEGER NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER,
ADD CONSTRAINT "FormResponse_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Option" DROP CONSTRAINT "Option_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "questionId",
ADD COLUMN     "questionId" INTEGER NOT NULL,
DROP COLUMN "formId",
ADD COLUMN     "formId" INTEGER NOT NULL,
ADD CONSTRAINT "Option_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Question" DROP CONSTRAINT "Question_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "formId",
ADD COLUMN     "formId" INTEGER NOT NULL,
ADD CONSTRAINT "Question_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Response" DROP CONSTRAINT "Response_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "questionId",
ADD COLUMN     "questionId" INTEGER NOT NULL,
DROP COLUMN "formId",
ADD COLUMN     "formId" INTEGER NOT NULL,
DROP COLUMN "formResponseId",
ADD COLUMN     "formResponseId" INTEGER NOT NULL,
ADD CONSTRAINT "Response_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "ResponseOption" DROP CONSTRAINT "ResponseOption_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "optionId",
ADD COLUMN     "optionId" INTEGER NOT NULL,
DROP COLUMN "responseId",
ADD COLUMN     "responseId" INTEGER NOT NULL,
ADD CONSTRAINT "ResponseOption_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "Form" ADD CONSTRAINT "Form_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Question" ADD CONSTRAINT "Question_formId_fkey" FOREIGN KEY ("formId") REFERENCES "Form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Option" ADD CONSTRAINT "Option_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Response" ADD CONSTRAINT "Response_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Response" ADD CONSTRAINT "Response_formResponseId_fkey" FOREIGN KEY ("formResponseId") REFERENCES "FormResponse"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FormResponse" ADD CONSTRAINT "FormResponse_formId_fkey" FOREIGN KEY ("formId") REFERENCES "Form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponseOption" ADD CONSTRAINT "ResponseOption_optionId_fkey" FOREIGN KEY ("optionId") REFERENCES "Option"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResponseOption" ADD CONSTRAINT "ResponseOption_responseId_fkey" FOREIGN KEY ("responseId") REFERENCES "Response"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
