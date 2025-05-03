import mongoose from "mongoose";

const investmentSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  propertyId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Property",
    required: true,
  },
  areaInvested: {
    type: Number,
    required: true,
  },
}, { timestamps: true });

export const Investment = mongoose.model("Investment", investmentSchema);
