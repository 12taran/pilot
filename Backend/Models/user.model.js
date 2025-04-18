import mongoose from "mongoose";

const userSchema = new mongoose.Schema(
  {
    fullname: {
      type: String,
      required: true,

    },
    address: {
      type: String,
      required: true,
    },
    phoneNumber: {
      type: Number,
      required: true,
      unique: true,
      minlength: [10, "Phone number must be exactly 10 digits"],// mongo db won't store invalid data
      maxlength: [10, "Phone number must be exactly 10 digits"],
      match: [/^\d{10}$/, "Phone number must contain only digits"],      
    },
  },
  { timestamps: true }
);

export const User = mongoose.model("User", userSchema);
