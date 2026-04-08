# GingerAI Assist | Domain-Specific AI Assistant Platform

An intelligent AI assistant platform specialised for legal, medical, and business domains. Combines the power of OpenAI API with Retrieval-Augmented Generation (RAG) to provide domain-specific answers based on uploaded documents.

## 🎯 Key Features

✅ **Chat Interface** - Clean, modern ChatGPT-like UI
✅ **File Upload** - Upload PDFs, documents for the knowledge base
✅ **Domain Modes** - Switch between Legal, Medical, and Business modes
✅ **RAG System** - AI answers based on your documents + GPT intelligence
✅ **Chat History** - Save and access conversation history
✅ **Authentication** - Secure login/signup
✅ **API Integration** - OpenAI GPT integration
✅ **Vector Database** - Advanced document embedding and retrieval

## 🧠 How It Works

1. **Upload Documents** → PDF documents are processed and split into chunks
2. **Generate Embeddings** → Chunks are converted to vector embeddings
3. **Store in Vector DB** → Embeddings stored for fast retrieval
4. **User Query** → User asks a question in chat
5. **Retrieve Context** → Relevant document chunks are retrieved
6. **Generate Response** → OpenAI generates response using context + query
7. **Return Answer** → Domain-specific answer delivered to user

## 💻 Tech Stack

### Frontend
- **React 18** - UI library
- **Vite** - Build tool for fast development
- **Tailwind CSS** - Styling
- **Axios** - HTTP client
- **React Router** - Navigation

### Backend
- **Node.js + Express** - Web server
- **OpenAI API** - LLM integration
- **Pinecone/FAISS** - Vector database
- **Multer** - File upload handling
- **PDF.js** - PDF parsing
- **JWT** - Authentication

### Database
- **MongoDB** - Chat history & user data
- **Vector DB** - Document embeddings

## 📁 Project Structure

```
ai-assistant/
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/    # React components
│   │   │   ├── ChatBox.jsx
│   │   │   ├── FileUpload.jsx
│   │   │   ├── DomainSelector.jsx
│   │   │   └── ChatHistory.jsx
│   │   ├── pages/         # Page components
│   │   │   ├── Home.jsx
│   │   │   ├── Dashboard.jsx
│   │   │   └── Login.jsx
│   │   ├── styles/        # CSS files
│   │   ├── App.jsx
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
│
├── server/                # Node.js backend
│   ├── src/
│   │   ├── routes/        # API endpoints
│   │   │   ├── auth.js
│   │   │   ├── chat.js
│   │   │   └── documents.js
│   │   ├── controllers/   # Business logic
│   │   │   ├── chatController.js
│   │   │   ├── authController.js
│   │   │   └── documentController.js
│   │   ├── middleware/    # Custom middleware
│   │   │   ├── auth.js
│   │   │   └── errorHandler.js
│   │   ├── services/      # External service integration
│   │   │   ├── openai.js
│   │   │   ├── vectorStore.js
│   │   │   └── pdfProcessor.js
│   │   ├── models/        # Database schemas
│   │   │   ├── User.js
│   │   │   ├── Chat.js
│   │   │   └── Document.js
│   │   ├── config/        # Configuration files
│   │   │   └── database.js
│   │   └── app.js         # Express app
│   ├── package.json
│   └── .env.example
│
├── docs/                  # Sample documents
│   ├── sample-legal.pdf
│   └── sample-medical.pdf
│
├── .gitignore
├── .env.example
└── package.json          # Root monorepo config
```

## 🚀 Quick Start

### Prerequisites
- Node.js (v18+)
- npm or yarn
- OpenAI API key
- MongoDB connection string (or local MongoDB)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/GingerAI-Assist.git
cd GingerAI-Assist
```

2. **Setup Environment Variables**
```bash
cp .env.example .env
# Edit .env with your credentials
```

3. **Install Backend Dependencies**
```bash
cd server
npm install
```

4. **Install Frontend Dependencies**
```bash
cd ../client
npm install
```

5. **Start Backend Server**
```bash
cd server
npm run dev
```

6. **Start Frontend (in another terminal)**
```bash
cd client
npm run dev
```

Visit `http://localhost:5173` in your browser.

## 🔑 API Endpoints

### Authentication
- `POST /api/auth/register` - Create new account
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user

### Chat
- `POST /api/chat/message` - Send message and get response
- `GET /api/chat/history` - Get chat history
- `DELETE /api/chat/:id` - Delete conversation

### Documents
- `POST /api/documents/upload` - Upload PDF document
- `GET /api/documents` - Get the user's documents
- `DELETE /api/documents/:id` - Delete document

## 📖 Usage Examples

### 1. Legal Mode
Upload contract templates, case laws → Ask "What are the liability clauses?"
Get answers based on your documents + GPT intelligence

### 2. Medical Mode
Upload medical guidelines, FAQs → Ask "What are the symptoms of condition X?"
Get domain-specific medical responses

### 3. Business Mode
Upload company policies, procedures → Ask "What's the leave policy?"
Get instant answers from the company's knowledge base

## ⚠️ Important Legal & Compliance

**Disclaimer:** This AI assistant is not a licensed professional. Always consult qualified professionals.

### For Medical Domain
- Complies with privacy standards
- Add HIPAA disclaimer
- Do NOT use for diagnosis/treatment decisions

### For Legal Domain
- Not legal advice
- Consult licensed attorney
- Compliance with bar association rules

## 🔒 Security Features

- JWT authentication
- Password hashing (bcrypt)
- Environment variables for secrets
- File upload validation
- Input sanitization
- CORS protection

## 📊 Future Enhancements

- [ ] Voice input (speech-to-text)
- [ ] Multi-language support
- [ ] Dark/light theme toggle
- [ ] Export conversations as PDF
- [ ] Admin dashboard for analytics
- [ ] Fine-tuning with user feedback
- [ ] Integration with more domains
- [ ] Collaborative features (team sharing)

## 💡 Business Model Potential

If you scale this into a SaaS:
- **Basic Tier:** ₹999/month (limited documents)
- **Pro Tier:** ₹2999/month (unlimited documents + API)
- **Enterprise:** Custom pricing for teams

## 👨‍💻 For Recruiters & Portfolio

This project demonstrates:
✅ Full-stack development (React + Node.js)
✅ AI/ML integration (OpenAI API)
✅ Advanced architecture (RAG system)
✅ Real-world problem solving
✅ Professional code structure
✅ Attention to security & compliance

Perfect for roles in:
- AI/ML Engineering
- Full-Stack Development
- SaaS Product Development
- Startup Technical Roles

## 📝 License

MIT License - feel free to use this for your portfolio

## 🤝 Contributing

Contributions welcome! Feel free to fork and submit PRs.

## 📧 Contact

For questions or collaboration: [info@gingerlink.in]

---

**"Building domain-specific AI for the real world."**

Made with ❤️ for the Ginger Link Technologies brand
