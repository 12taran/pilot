import multer from "multer";
import path from "path";

// Set storage for board member images
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/member"); // store in 'uploads/member' folder
  },
  filename: function (req, file, cb) {
    const uniqueName = Date.now() + path.extname(file.originalname);
    cb(null, uniqueName); // e.g., 1714412300000.jpg
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

export const uploadMember = multer({ storage, fileFilter });
