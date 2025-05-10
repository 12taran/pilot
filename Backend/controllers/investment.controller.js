import { Investment } from "../Models/investment.model.js";

// Get all investments of a user
export const getUserInvestments = async (req, res) => {
  try {
    console.log(req.params);
    const { userId } = req.params;

    const investments = await Investment.find({ userId })
    .sort({ createdAt: -1 })
    .populate("propertyId")
    .populate("adminId")
    .populate("userId");

    return res.status(200).json({
      message: "Investments fetched successfully",
      success: true,
      investments,
    });
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Failed to fetch investments",
      success: false,
    });
  }
};
