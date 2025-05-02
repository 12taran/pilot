import mongoose from "mongoose";

const propertySchema = new mongoose.Schema(
    {
        projectName : {
            type : String,
            required : true,
            trim : true,
        },
        images: [
            {
              type: String,
              required: true,
            }
          ],
          address: {
            type: String,
            required: true,
          },
          latitude: {
            type: Number,
            required: true,
          },
          longitude: {
            type: Number,
            required: true,
          },
          price: {
            type: String,
            required: true,
          },
          type: {
            type: String,
            enum: ["Residential", "Commercial", "Holiday Homes","Plot"],
            required: true,
          },
          description: {
            type: String,
            required: true,
          },
        }, {
          timestamps: true
        }
);

export const Property = mongoose.model("Property",propertySchema);