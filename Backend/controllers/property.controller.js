import { User } from "../Models/user.model.js";
import { Property } from "../Models/property.model.js";
import path from "path";
import fs from "fs";
import { fileURLToPath } from "url";
import { Investment } from "../Models/investment.model.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Create a property
export const createProperty = async (req, res) => {
  try {
    console.log(req.body);
    console.log(req.files);
    const images = req.files.map((file) => `property/${file.filename}`); // It loops through each file and extracts the filename
    const {
      userId,
      projectName,
      address,
      area,
      latitude,
      longitude,
      price,
      type,
      description,
    } = req.body;

    const numericArea = Number(area);
    if (!projectName  || !address || !area || !latitude || !longitude || !price || !type || !description  || isNaN(numericArea) || numericArea <= 0 || images.length === 0) {
      return res.status(400).json({
        message: "All fields are required",
        success: false,
      });
    }

    const newProperty = await Property.create({
      userId,
      projectName,
      address,
      area: numericArea,
      availableArea: numericArea,
      latitude,
      longitude,
      price,
      type,
      description,
      images,
    });

    return res.status(201).json({
      message: "Property created successfully",
      success: true,
      property: newProperty,
    });
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Failed to create property",
      success: false,
    });
  }
};

// Edit property
export const editProperty = async (req, res) => {
  try {
    const { propertyId: id } = req.body;
    const property = await Property.findById(id);

    if (!property) {
      return res.status(404).json({
        message: "Property not found",
        success: false,
      });
    }

    // Keep existing images and add new ones (if any)
    const newImages =
      req.files?.length > 0
        ? req.files.map((file) => `property/${file.filename}`)
        : [];

    const updatedImages = [...property.images, ...newImages];

    const updatedProperty = await Property.findByIdAndUpdate(
      id,
      {
        ...req.body,
        images: updatedImages,
      },
      { new: true }
    );

    return res.status(200).json({
      message: "Property updated successfully (old images retained)",
      success: true,
      property: updatedProperty,
    });
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Failed to update property",
      success: false,
    });
  }
};

// Get all properties
export const getAllProperties = async (req, res) => {
  try {
    const properties = await Property.find().sort({ createdAt: -1 }); // Sorts the results by the createdAt field in descending order
    return res.status(200).json({
      message: "Properties retrieved successfully",
      success: true,
      properties,
    });
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Failed to retrieve properties",
      success: false,
    });
  }
};

// Get all properties by id
export const getUserProperty = async (req, res) => {
  try {
    const { userId } = req.body;
    console.log(userId);
    const properties = await Property.find({ userId }).sort({ createdAt: -1 }); // in descending order
    return res.status(200).json({
      message: "Properties retrieved successfully",
      success: true,
      properties,
    });
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Failed to retrieve properties",
      success: false,
    });
  }
};

// Delete property
export const deleteProperty = async (req, res) => {
  try {
    const { propertyId: id } = req.body;
    const property = await Property.findById(id);
    if (!property) {
      return res.status(404).json({
        message: "Property not found",
        success: false,
      });
    }

    // Delete images from disk
    property.images.forEach((img) => {
      const imgPath = path.join(__dirname, `../uploads/${img}`);
      if (fs.existsSync(imgPath)) fs.unlinkSync(imgPath);
    });

    await property.deleteOne();

    return res.status(200).json({
      message: "Property deleted successfully",
      success: true,
    });
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Failed to delete property",
      success: false,
    });
  }
};

// Buy Property (Fractional Area)
export const buyProperty = async (req, res) => {
  try {
    console.log(req.body);
    const { propertyId, areaToBuy, userId } = req.body;

    const numericAreaToBuy = Number(areaToBuy);
    if (isNaN(numericAreaToBuy) || numericAreaToBuy <= 0) {
      return res.status(400).json({
        message: "Invalid area to buy",
        success: false,
      });
    }

    const property = await Property.findById(propertyId);
    if (!property || property.availableArea < numericAreaToBuy) {
      return res.status(400).json({
        message: "Not enough available area to buy",
        success: false,
      });
    }

    property.availableArea -= numericAreaToBuy;
    await property.save();

    const adminId = property.userId;

    await Investment.create({
      userId,
      propertyId,
      areaInvested: numericAreaToBuy,
      priceAtPurchase: property.price,
      adminId,
    });

    const user = await User.findById(userId);

    return res.status(200).json({
      message: `${user.fullname} Successfully bought ${numericAreaToBuy} sq ft`,
      remainingAvailableArea: property.availableArea,
      success: true,
    });
  } catch (err) {
    console.error(err);
    return res
      .status(500)
      .json({ message: "Failed to buy property", success: false });
  }
};

// Extend Property Area
export const extendPropertyArea = async (req, res) => {
  try {
    const { propertyId, areaToAdd } = req.body;
    const numericArea = Number(areaToAdd);

    if (isNaN(numericArea) || numericArea <= 0) {
      return res.status(400).json({
        message: "Area to add must be a positive number",
        success: false,
      });
    }

    const property = await Property.findById(propertyId);
    if (!property) {
      return res.status(404).json({
        message: "Property not found",
        success: false,
      });
    }

    property.area += numericArea;
    property.availableArea += numericArea;
    await property.save();

    return res.status(200).json({
      message: `Area extended by ${numericArea} sq ft`,
      success: true,
      newTotalArea: property.area,
      newAvailableArea: property.availableArea,
    });
  } catch (err) {
    console.error(err);
    return res
      .status(500)
      .json({ message: "Failed to extend area", success: false });
  }
};

// set property
export const sellProperties = async (req, res) => {
  try {
    const { userId, propId, price } = req.body;
    if (!userId || !propId || !price) {
      return res.status(400).json({
        message: "Missing required fields",
        success: false,
      });
    }
    const property = await Property.findById(propId);

    if (!property) {
      return res.status(500).json({
        message: "Error",
      });
    }
    return res.status(200).json({
      message:
        "Property Sold Successfully and the amount will be credited to your account in 2-3 working days",
      success: true,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      message: "Sell Order of property Failed",
      success: false,
    });
  }
};
