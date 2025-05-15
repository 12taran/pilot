import mongoose from "mongoose";
import { BankDetail } from "../Models/bank.model.js";

export const storeBank = async (req, res) => {
  try {
    const {
      accountNumber,
      confirmAccountNumber,
      ifsc,
      accountHolderName,
      userId,
    } = req.body;

    if (
      !accountNumber ||
      !confirmAccountNumber ||
      !ifsc ||
      !accountHolderName
    ) {
      return res.status(500).json({
        message: "Something is missing",
        success: false,
      });
    }

    if (accountNumber != confirmAccountNumber) {
      return res.status(400).json({
        message: "Account Number Mismatch",
        success: false,
      });
    }

    const ifscRegex = /^[A-Z]{4}0[A-Z0-9]{6}$/;
    if (!ifscRegex.test(ifsc)) {
      return res.status(400).json({
        message: "Invalid IFSC Format",
        success: false,
      });
    }

    const bankDetails = new BankDetail({
      accountNumber,
      ifsc,
      accountHolderName,
      userId,
    });

    await bankDetails.save();
    return res.status(200).json({
      message: "Bank Details Saved Successfully",
      success: true,
    });
  } catch (error) {
    console.log(error);
    return res.status(400).json({
      message: "Bank Details not saved",
    });
  }
};
