/*
  Warnings:

  - The `type` column on the `Question` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "questionType" AS ENUM ('text', 'radio', 'multiple', 'file', 'date', 'time');

-- AlterTable
ALTER TABLE "Question" DROP COLUMN "type",
ADD COLUMN     "type" "questionType" NOT NULL DEFAULT 'text';
