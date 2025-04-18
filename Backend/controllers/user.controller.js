import { User } from "../Models/user.model.js";

export const userVerify = async (req, res) => {
  try {
    const { phoneNumber } = req.body;

    if (!phoneNumber) {
      return res.status(400).json({
        message: "phoneNumber is missing",
        success: false,
      });
    }

    const user = await User.findOne({ phoneNumber });
    if (user) {
      return res.status(400).json({
        message: "User Already exist",
        success: false,
        userId: user._id,
      });
    }

    const newUser = await User.create({
      phoneNumber,
    });
    return res.status(201).json({
      message: "Account created successfully",
      success: true,
      userId: newUser._id,
    });
  } catch (error) {
    console.log(error);
  }
};

export const userGet = async (req, res) => {
  try {
    const userId = req.id;
    const user = await User.find({ userId });

    if (!user) {
      return res.status(404).json({
        message: "Profile not found",
        success: false,
      });
    }
    return res.status(200).json({
      success: true,
      user,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      message: "Failed to load",
      success: false,
    });
  }
};

export const userProfile = async (req, res) => {
  try {
    const { fullname, address, phoneNumber } = req.body;
    const userId = req.id;
  } catch (error) {
    console.log(error);
  }
};

export const userEdit = async (req, res) => {
  try {
    const userId = req.id;
    const { fullname, address } = req.body;

    // const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({
        message: "User not found",
        success: false,
      });
    }

    const updatedData = { fullname, address };

    const updatedUser = await User.findByIdAndUpdate(userId, updatedData, {
      new: true,
    });

    return res.status(200).json({
      message: "Profile Updated Successfully",
      user: updatedUser,
      success: true,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      message: "Failed to update",
      success: false,
    });
  }
};
