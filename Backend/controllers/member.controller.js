import fs from "fs";
import path from "path";
import { Member } from "../Models/member.model.js";
import { fileURLToPath } from "url";

// Define __dirname manually
const __dirname = path.dirname(fileURLToPath(import.meta.url));

// new member 
export const createMember = async (req, res) => {
    try{

        // console.log("REQ BODY:", req.body);
        // console.log("REQ FILE:", req.file);
        const {name,designation} = req.body;
        const image = req.file?req.file.filename:null;
        
        console.log(image,name,designation);
        if(!name || !designation || !image){
            return res.status(400).json({
                message : "All fields are required",
                success : false,
            });
        }
        const newMember = await Member.create({
            name,
            designation,
            image : `member/${image}`,
        });

        return res.status(201).json({
            message : "Member created successfully",
            success : true,
            data : newMember,
        }); 
    }
    catch(err){
        console.log(err);
        return res.status(500).json({
            message : "Server problem while creating member",
            success : false,
        });
    }
}

export const getAllMembers = async (req, res) => {
    try{
        const members = await Member.find();
        return res.status(200).json({
            message : "All members fetched successfully",
            success : true,
            data : members,
        });
    }
    catch(err){
        console.log(err);
        return res.status(500).json({
            message : "Failed to fetch members",
            success : false,
        });
    }
}

export const editMember = async (req, res) => {
    try {
      const { id, name, designation } = req.body;
  
      const member = await Member.findById(id);
      if (!member) {
        return res.status(404).json({
          message: "Member not found",
          success: false,
        });
      }
  
      let imagePath = member.image;
  
      // If a new image is uploaded
      if (req.file) {
        const oldImagePath = path.join(__dirname, "..", "uploads", member.image);
        if (fs.existsSync(oldImagePath)) {
          fs.unlinkSync(oldImagePath);
        }
        imagePath = `member/${req.file.filename}`;
      }
  
      const updatedMember = await Member.findByIdAndUpdate(
        id,
        { name, designation, image: imagePath },
        { new: true }
      );
  
      return res.status(200).json({
        message: "Member updated successfully",
        success: true,
        data: updatedMember,
      });
  
    } catch (err) {
      console.error(err);
      return res.status(500).json({
        message: "Failed to update member",
        success: false,
      });
    }
  };
  

export const deleteMember = async (req, res) => {
    try{
        const {id} = req.body;
        const member = await Member.findById(id);

        if(!member){
            return res.status(404).json({
                message : "Member not found",
                success : false,
            });
        }

        // Delete the image file from the server
        const imagePath = path.join(__dirname, ".." ,"uploads",member.image);
        if(fs.existsSync(imagePath)){
            fs.unlinkSync(imagePath);
        }
        // delete from db 
        await Member.findByIdAndDelete(id);
        return res.status(200).json({
            message : "Member deleted successfully",
            success :true,
        });
    } catch(err){
        console.log(err);
        return res.status(500).json({
            message : "Failed to delete member",
            successs : false,
        });
    }
}