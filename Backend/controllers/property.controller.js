import { Property } from "../Models/property.model.js";
import path from "path";
import fs from "fs";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Create a property
export const createProperty = async (req, res) => {
  try {
    console.log(req.body);
    console.log(req.files);
    const images = req.files.map(file => `property/${file.filename}`);// It loops through each file and extracts the filename
    const {
      projectName,
      address,
      latitude,
      longitude,
      price,
      type,
      description,
    } = req.body;

    if (!projectName  || !address || !latitude || !longitude || !price || !type || !description || images.length === 0) {
      return res.status(400).json({
        message: "All fields are required",
        success: false,
      });
    }

    const newProperty = await Property.create({
      projectName,
      address,
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
    const newImages = req.files?.length > 0
      ? req.files.map(file => `property/${file.filename}`)
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

// Delete property 
export const deleteProperty = async (req, res) => {
  try {
    const { propertyId : id } = req.body;
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
