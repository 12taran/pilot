import { User } from "../Models/user.model.js";

export const userVerify = async (req, res) => {
  try {
    const { phoneNumber } = req.body;
    if (!phoneNumber) {
      return res.status(400).json({
        message: "Phone Number Required",
        success: false,
      });
    }
    const user = await User.findOne({ phoneNumber });
    if (user) {
      return res.status(400).json({
        message: "User Already exist",
        success: false,
      });
    }

    await User.create({
      phoneNumber,
    });
    return res.status(201).json({
      message: "Account created successfully",
      success: true,
    });
  } catch (error) {
    console.log(error);
  }
};
