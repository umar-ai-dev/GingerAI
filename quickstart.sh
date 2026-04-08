#!/bin/bash

# GingerAI Assist - Quick Start Script
# This script sets up the project and runs both frontend and backend

echo "🚀 GingerAI Assist - Quick Start"
echo "================================"

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "❌ Node.js is not installed. Please install Node.js v18 or higher."
    echo "Download from: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo "✅ npm version: $(npm --version)"
echo ""

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found"
    cp .env.example .env
    echo "✅ Created .env from .env.example"
    echo "⚠️  Please update .env with your OpenAI API key!"
    echo "   Edit the file and set: OPENAI_API_KEY=sk-your-key"
    echo ""
fi

# Install dependencies
echo "📦 Installing server dependencies..."
cd server
npm install --legacy-peer-deps
cd ..

echo "📦 Installing client dependencies..."
cd client
npm install --legacy-peer-deps
cd ..

echo ""
echo "✅ Installation complete!"
echo ""
echo "🎯 To start the application:"
echo ""
echo "Terminal 1 (Backend):"
echo "  cd server && npm run dev"
echo ""
echo "Terminal 2 (Frontend):"
echo "  cd client && npm run dev"
echo ""
echo "Then open: http://localhost:5173"
echo ""
echo "📝 First time? Check SETUP.md for detailed instructions"
