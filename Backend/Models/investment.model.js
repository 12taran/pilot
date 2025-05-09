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
  priceAtPurchase: {
    type: Number,
    required: true,
  },
  adminId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
}, { timestamps: true });

export const Investment = mongoose.model("Investment", investmentSchema);
