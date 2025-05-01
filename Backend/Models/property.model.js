import mongoose from "mongoose";

const propertySchema = new mongoose.Schema(
    {
        name : {
            type : String,
            required : true,
            trim : true,
        },
        furnished : {
            type : String,
            enum : ["Furnished","Semi-Furnished","Unfurnished","Raw space"],
            required : true,
        },
        images: [
            {
              type: String,
              required: true,
            }
          ],
          location: {
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