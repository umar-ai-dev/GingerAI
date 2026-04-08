# API Reference Guide

Complete documentation for GingerAI Assist API endpoints.

## Base URL

```
http://localhost:5000/api
```

## Authentication

All protected endpoints require a JWT token in the Authorization header:

```
Authorization: Bearer your-jwt-token-here
```

Tokens are valid for 7 days by default.

---

## Authentication Endpoints

### Register User

Create a new user account.

**Request**
```http
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "securepassword",
  "name": "John Doe"
}
```

**Response (201 Created)**
```json
{
  "message": "User registered successfully",
  "user": {
    "id": "user-uuid",
    "email": "user@example.com",
    "name": "John Doe"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error (409 Conflict)**
```json
{
  "error": "User already exists"
}
```

### Login User

Authenticate user and get JWT token.

**Request**
```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "securepassword"
}
```

**Response (200 OK)**
```json
{
  "message": "Login successful",
  "user": {
    "id": "user-uuid",
    "email": "user@example.com",
    "name": "John Doe"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Error (401 Unauthorized)**
```json
{
  "error": "Invalid email or password"
}
```

### Logout User

Invalidate session (optional - client-side token removal).

**Request**
```http
POST /auth/logout
Authorization: Bearer your-jwt-token
```

**Response (200 OK)**
```json
{
  "message": "Logout successful"
}
```

---

## Chat Endpoints

### Send Message

Send a message and get AI response.

**Request**
```http
POST /chat/message
Authorization: Bearer your-jwt-token
Content-Type: application/json

{
  "message": "What are the liability clauses?",
  "domain": "legal",
  "conversationId": "optional-existing-conversation-id"
}
```

**Parameters**
- `message` (string, required): User's message
- `domain` (string, required): One of: `legal`, `medical`, `business`
- `conversationId` (string, optional): Continue existing conversation

**Response (200 OK)**
```json
{
  "conversationId": "conversation-uuid",
  "message": {
    "role": "assistant",
    "content": "Based on the liability clauses in document X...",
    "contextUsed": true,
    "sourceCount": 2
  }
}
```

**Error (400 Bad Request)**
```json
{
  "error": "Message and domain are required"
}
```

### Get Chat History

Retrieve all conversations for the user.

**Request**
```http
GET /chat/history
Authorization: Bearer your-jwt-token
```

**Response (200 OK)**
```json
{
  "conversations": [
    {
      "id": "conversation-uuid",
      "domain": "legal",
      "messages": [
        {
          "role": "user",
          "content": "What's the liability clause?",
          "timestamp": "2024-01-15T10:30:00Z"
        },
        {
          "role": "assistant",
          "content": "The liability clause states...",
          "timestamp": "2024-01-15T10:31:00Z",
          "contextSources": true
        }
      ],
      "createdAt": "2024-01-15T10:30:00Z",
      "updatedAt": "2024-01-15T10:31:00Z"
    }
  ]
}
```

### Delete Conversation

Remove a conversation.

**Request**
```http
DELETE /chat/{conversationId}
Authorization: Bearer your-jwt-token
```

**Response (200 OK)**
```json
{
  "message": "Conversation deleted successfully"
}
```

**Error (404 Not Found)**
```json
{
  "error": "Conversation not found"
}
```

---

## Document Endpoints

### Upload Document

Upload a PDF document for the knowledge base.

**Request**
```http
POST /documents/upload
Authorization: Bearer your-jwt-token
Content-Type: multipart/form-data

FormData:
- file: [PDF file]
- name: "Contract Template"
- domain: "legal"
```

**Parameters**
- `file` (file, required): PDF file (max 10MB)
- `name` (string, optional): Document name
- `domain` (string, required): One of: `legal`, `medical`, `business`

**Response (201 Created)**
```json
{
  "message": "Document uploaded successfully",
  "document": {
    "id": "document-uuid",
    "name": "Contract Template",
    "domain": "legal",
    "uploadedAt": "2024-01-15T10:30:00Z"
  }
}
```

**Error (400 Bad Request)**
```json
{
  "error": "No file provided"
}
```

### List Documents

Get all documents uploaded by the user.

**Request**
```http
GET /documents
Authorization: Bearer your-jwt-token
```

**Response (200 OK)**
```json
{
  "documents": [
    {
      "id": "document-uuid",
      "name": "Contract Template",
      "domain": "legal",
      "fileName": "contract.pdf",
      "fileSize": 102400,
      "uploadedAt": "2024-01-15T10:30:00Z"
    }
  ],
  "total": 1
}
```

### Delete Document

Remove a document from the knowledge base.

**Request**
```http
DELETE /documents/{documentId}
Authorization: Bearer your-jwt-token
```

**Response (200 OK)**
```json
{
  "message": "Document deleted successfully"
}
```

**Error (403 Forbidden)**
```json
{
  "error": "Unauthorized access"
}
```

---

## Health Check

### API Status

Check if the API is running.

**Request**
```http
GET /health
```

**Response (200 OK)**
```json
{
  "status": "OK",
  "message": "GingerAI Assist API is running"
}
```

---

## Error Response Format

All errors follow this format:

```json
{
  "error": "Description of what went wrong"
}
```

### Common HTTP Status Codes

| Code | Meaning |
|------|---------|
| 200 | OK - Request successful |
| 201 | Created - Resource created successfully |
| 400 | Bad Request - Invalid parameters |
| 401 | Unauthorized - Missing/invalid token |
| 403 | Forbidden - Access denied |
| 404 | Not Found - Resource doesn't exist |
| 500 | Internal Server Error |

---

## Rate Limiting

Currently no strict rate limiting, but planned for production:

```
10 requests per minute for anonymous users
100 requests per minute for authenticated users
1000 requests per minute for pro users
```

---

## Examples

### JavaScript/Node.js

```javascript
const API_BASE = 'http://localhost:5000/api';

// Login
const login = async (email, password) => {
  const response = await fetch(`${API_BASE}/auth/login`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password })
  });
  return response.json();
};

// Send message
const sendMessage = async (token, message, domain) => {
  const response = await fetch(`${API_BASE}/chat/message`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify({ message, domain })
  });
  return response.json();
};

// Upload document
const uploadDocument = async (token, file, name, domain) => {
  const formData = new FormData();
  formData.append('file', file);
  formData.append('name', name);
  formData.append('domain', domain);

  const response = await fetch(`${API_BASE}/documents/upload`, {
    method: 'POST',
    headers: { 'Authorization': `Bearer ${token}` },
    body: formData
  });
  return response.json();
};
```

### curl

```bash
# Register
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com","password":"pass","name":"User"}'

# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"user@example.com","password":"pass"}'

# Send message
curl -X POST http://localhost:5000/api/chat/message \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer TOKEN" \
  -d '{"message":"Hello","domain":"legal"}'

# Upload document
curl -X POST http://localhost:5000/api/documents/upload \
  -H "Authorization: Bearer TOKEN" \
  -F "file=@contract.pdf" \
  -F "name=Contract" \
  -F "domain=legal"
```

### Python

```python
import requests

API_BASE = 'http://localhost:5000/api'

# Login
response = requests.post(f'{API_BASE}/auth/login', json={
    'email': 'user@example.com',
    'password': 'password'
})
token = response.json()['token']

# Send message
headers = {'Authorization': f'Bearer {token}'}
response = requests.post(f'{API_BASE}/chat/message', 
    headers=headers,
    json={
        'message': 'What is liability?',
        'domain': 'legal'
    }
)
print(response.json())

# Upload document
files = {'file': open('contract.pdf', 'rb')}
data = {'name': 'Contract', 'domain': 'legal'}
response = requests.post(f'{API_BASE}/documents/upload',
    headers=headers,
    files=files,
    data=data
)
print(response.json())
```

---

## API Versioning

Current Version: **v1** (implicit)

Future versions will use: `/api/v2/...`

Backward compatibility will be maintained when possible.

---

## Support

For API issues:
1. Check this documentation
2. Review error messages
3. Check GitHub issues
4. Create a new issue with:
   - API endpoint
   - Request body
   - Error response
   - Expected behavior

---

**Last Updated:** April 2026
