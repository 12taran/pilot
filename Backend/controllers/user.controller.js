import fs from "fs";
import path from "path";
import { User } from "../Models/user.model.js";
import { fileURLToPath } from "url";

// Manually define __dirname in ES module
const __dirname = path.dirname(fileURLToPath(import.meta.url));

export const userVerify = async (req, res) => {
  try {
    req.body.phoneNumber = req.body.phoneNumber.replace(/\s+/g, '');

    const { phoneNumber,fullname,address } = req.body;

    if(phoneNumber.length != 10){
      return res.status(400).json({
        message : "Enter valid number",
        success : false,
      })
    }

    if (!phoneNumber || !fullname || !address) {
      return res.status(400).json({
        message: "All fields are required",
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
      fullname,
      address,
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

export const userById = async (req, res) => {
  try {
    const {userId} = req.params;
    const user = await User.findById(userId );// findById() expects the ID directly, not an object

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
    const {id : userId} = req.params;// grabs id from URL and assigns it to userId
    const { fullname, address } = req.body;
    const image = req.file ? req.file.filename : undefined;

    const user = await User.findById(userId);

    if (!user) {
      return res.status(404).json({
        message: "User not found",
        success: false,
      });
    }

    // If the user has a previous image, delete it from the server
    if (image && user.image && user.image !== "userImage.jpg") {
      const oldImagePath = path.join(__dirname, "../uploads", user.image);
      fs.unlink(oldImagePath, (err) => {
        if (err) {
          console.log("Error deleting old image: ", err);
        }
      });
    }


    const updatedData = { fullname, address };
    if (image) updatedData.image = image;
    
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

export const userLogin = async (req, res) => {
  try {
    req.body.phoneNumber = req.body.phoneNumber.replace(/\s+/g, '');// remove spaces in middle if any

    const { phoneNumber } = req.body;

    if(!phoneNumber || phoneNumber.length !== 10){
      return res.status(400).json({
        message : "Enter valid number",
        success : false,
      })
    } 

    const user = await User.findOne({phoneNumber});

    if (!user) {
      return res.status(404).json({
        message: "User not found",
        success: false,
      });
    }

    return res.status(200).json({
      message: `Welcome back ${user.fullname}`,
      success: true,
      userId: user._id,
    });

  } catch (error) {
    console.log(error);
    return res.status(500).json({
      message: "Server problem",
      success: false,
    });
  }
};