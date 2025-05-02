import multer from "multer";
import path from "path";
import fs from "fs";

// Ensure uploads/property directory exists
const uploadPath = "uploads/property";
if (!fs.existsSync(uploadPath)) {
  fs.mkdirSync(uploadPath, { recursive: true });
}

// Set storage
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, uploadPath); // store in 'uploads/property' folder
  },
  filename: function (req, file, cb) {
    const uniqueName = Date.now() + '-' + Math.round(Math.random() * 1E9) + path.extname(file.originalname);
    cb(null, uniqueName); // e.g., 1616516987-987654321.jpg
  }
});

// File filter
const fileFilter = (req, file, cb) => {
  const allowedTypes = /jpeg|jpg|png/;
  const ext = path.extname(file.originalname).toLowerCase();
  if (allowedTypes.test(ext)) {
    cb(null, true);
  } else {
    cb(new Error("Only .jpg, .jpeg, .png files allowed"));
  }
};

export const uploadPropertyImages = multer({ storage, fileFilter });
