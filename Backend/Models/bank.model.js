import { timeStamp } from "console";
import mongoose from "mongoose";

const bankSchema = new mongoose.Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    accountNumber: {
      type: Number,
      required: true,
    },
    ifsc: {
      type: String,
      required: true,
      match: /^[A-Z]{4}0[A-Z0-9]{6}$/,
    },
    accountHolderName: {
      type: String,
      required: true,
    },
  },
  {
    timeStamps: true,
  }
);

export const BankDetail = mongoose.model("BankDetail", bankSchema);
