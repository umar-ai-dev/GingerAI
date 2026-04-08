# GingerAI Assist - Setup & Installation Guide

Complete guide to set up and run the GingerAI Assist platform locally.

## Prerequisites

Make sure you have the following installed:

- **Node.js** (v18 or higher) - [Download](https://nodejs.org/)
- **npm** (comes with Node.js) - Verify with `npm --version`
- **Git** - [Download](https://git-scm.com/)
- **OpenAI API Key** - Get from [OpenAI Platform](https://platform.openai.com/api-keys)

## Project Structure

```
ai-assistant/
├── server/          # Node.js + Express backend
├── client/          # React frontend
├── .env.example     # Environment template
├── .gitignore
└── README.md
```

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/GingerAI-Assist.git
cd GingerAI-Assist
```

### 2. Setup Environment Variables

```bash
# Copy the example environment file
cp .env.example .env

# Edit .env with your actual credentials
nano .env  # or use your preferred editor
```

**Required environment variables to set:**

```env
# OpenAI API Configuration
OPENAI_API_KEY=sk-your-actual-api-key-here
OPENAI_MODEL=gpt-3.5-turbo

# Backend Server
BACKEND_PORT=5000
NODE_ENV=development

# Frontend
VITE_API_URL=http://localhost:5000/api
```

### 3. Install Backend Dependencies

```bash
# Navigate to server directory
cd server

# Install dependencies
npm install

# Return to root directory
cd ..
```

**Key packages installed:**
- `express` - Web framework
- `mongoose` - Database (optional for MongoDB)
- `jsonwebtoken` - Authentication
- `bcryptjs` - Password hashing
- `multer` - File uploads
- `axios` - HTTP client
- `pdfjs-dist` - PDF parsing
- `pdfparse` - PDF text extraction

### 4. Install Frontend Dependencies

```bash
# Navigate to client directory
cd client

# Install dependencies
npm install

# Return to root directory
cd ..
```

**Key packages installed:**
- `react` - UI library
- `react-dom` - DOM rendering
- `react-router-dom` - Navigation
- `zustand` - State management
- `axios` - HTTP client
- `tailwindcss` - Styling

## Running the Application

### Option 1: Run in Separate Terminals (Recommended for Development)

**Terminal 1 - Start Backend Server:**

```bash
cd server
npm run dev
```

Expected output:
```
🚀 GingerAI Assist API running on port 5000
Environment: development
```

**Terminal 2 - Start Frontend Server:**

```bash
cd client
npm run dev
```

Expected output:
```
  VITE v5.0.0  ready in 123 ms

  ➜  Local:   http://localhost:5173/
  ➜  press h to show help
```

### Option 2: Run Both from Root Directory

```bash
# Terminal 1
cd server && npm run dev

# Terminal 2 (from root directory)
cd client && npm run dev
```

## Accessing the Application

1. Open your browser
2. Navigate to: `http://localhost:5173`
3. You'll see the login page

## First Time Setup

### Create Test Account

1. Click "Register here" on the login page
2. Fill in the form:
   - **Name:** Your Name
   - **Email:** test@example.com
   - **Password:** Your password (min 6 characters)
3. Click "Register"
4. You'll be logged in automatically

### Upload Your First Document

1. On the Dashboard, select a domain (Legal, Medical, or Business)
2. In the right sidebar, use the "Upload Documents" section
3. Drag and drop or click to select a PDF file
4. Give it a name (optional)
5. Wait for upload to complete

### Start Chatting

1. Type a question in the chat box
2. Click "Send" or press Enter
3. The AI will respond based on:
   - The domain you selected
   - Any documents you uploaded
   - The OpenAI GPT model

## API Endpoints

### Authentication

- `POST /api/auth/register` - Create account
- `POST /api/auth/login` - Login
- `POST /api/auth/logout` - Logout

### Chat

- `POST /api/chat/message` - Send message
- `GET /api/chat/history` - Get conversations
- `DELETE /api/chat/:id` - Delete conversation

### Documents

- `POST /api/documents/upload` - Upload PDF
- `GET /api/documents` - List documents
- `DELETE /api/documents/:id` - Delete document

## Troubleshooting

### Port Already in Use

If port 5000 or 5173 is already in use:

```bash
# Kill process on port 5000 (macOS/Linux)
lsof -ti:5000 | xargs kill -9

# Or change port in .env
BACKEND_PORT=5001
```

### OpenAI API Error

```
Failed to generate response from AI
```

**Solution:**
- Verify your API key is correct
- Check you have credits in OpenAI account
- Ensure API key has the right permissions

### CORS Error

```
Access to XMLHttpRequest blocked by CORS policy
```

**Solution:**
- Ensure backend is running on port 5000
- Check `CORS_ORIGIN` in `.env`
- Restart both servers

### Database Connection Error

If you're using MongoDB:

```bash
# Start MongoDB locally
mongod

# Or use MongoDB Atlas cloud connection
MONGODB_URI=mongodb+srv://user:pass@cluster.mongodb.net/dbname
```

## Environment Variables Explained

```env
# API Configuration
OPENAI_API_KEY           # Your OpenAI API key (REQUIRED)
OPENAI_MODEL             # Model to use (gpt-3.5-turbo, gpt-4, etc.)
BACKEND_PORT             # Port for backend server
NODE_ENV                 # development or production

# Database (Optional)
MONGODB_URI              # MongoDB connection string
MONGODB_USER             # MongoDB username
MONGODB_PASSWORD         # MongoDB password

# Vector Database (Optional)
PINECONE_API_KEY         # Pinecone API key (for production RAG)
PINECONE_ENVIRONMENT     # Pinecone environment

# Authentication
JWT_SECRET               # Secret key for JWT tokens
JWT_EXPIRE               # Token expiration time

# File Upload
MAX_FILE_SIZE            # Max file size in bytes (default: 10MB)
UPLOAD_DIR               # Directory for uploaded files

# Frontend
VITE_API_URL             # API base URL for frontend
VITE_APP_NAME            # App name to display

# Email (Optional)
EMAIL_SERVICE            # Email service provider
EMAIL_USER               # Email username
EMAIL_PASSWORD           # Email password

# CORS
CORS_ORIGIN              # Allowed frontend origin
```

## Building for Production

### Build Backend

```bash
# Backend doesn't need building, just run with npm start
cd server
npm start
```

### Build Frontend

```bash
# Build optimized production bundle
cd client
npm run build

# Output will be in client/dist/
```

## Deployment

### Deploy to Heroku

```bash
# Install Heroku CLI
npm install -g heroku

# Login to Heroku
heroku login

# Create Heroku app
heroku create your-app-name

# Set environment variables
heroku config:set OPENAI_API_KEY=sk-your-key

# Deploy
git push heroku main
```

### Deploy to Vercel (Frontend)

```bash
npm install -g vercel
vercel
```

## Development Tips

1. **Hot Reload:** Both frontend and backend support hot reload during development
2. **API Testing:** Use Postman to test endpoints
3. **Browser DevTools:** React and Network tabs useful for debugging
4. **Console Logs:** Check terminal output for backend logs

## Performance Optimization

- **Frontend:**
  - Code splitting enabled by Vite
  - Lazy loading for routes
  - Image optimization

- **Backend:**
  - Request caching
  - Connection pooling
  - Response compression

## Security Best Practices

1. ✅ Never commit `.env` file
2. ✅ Use environment variables for secrets
3. ✅ Validate all user inputs
4. ✅ Use HTTPS in production
5. ✅ Implement rate limiting
6. ✅ Keep dependencies updated

## Next Steps

1. **Customize domain prompts** in `server/src/services/openai.js`
2. **Add MongoDB integration** for persistent storage
3. **Setup Pinecone** for production vector database
4. **Add more features** like voice input, exports, etc.
5. **Deploy to production**

## Getting Help

- Check the main [README.md](README.md)
- Review API documentation in code comments
- Check [OpenAI API docs](https://platform.openai.com/docs)
- Raise issues on GitHub

## License

MIT - Feel free to use for personal and commercial projects

---

**Made with ❤️ for the Ginger Technologies brand**
