import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
  phoneNumber: {
    type: Number,
    required: true,
    unique: true,
  },
});

export const User = mongoose.model("User", userSchema);
