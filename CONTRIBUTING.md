# Contributing to GingerAI Assist

Thank you for your interest in contributing! This guide will help you get started.

## Code of Conduct

This project adheres to a Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to [maintainer email].

## Getting Started

### 1. Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork

git clone https://github.com/YOUR-USERNAME/GingerAI-Assist.git
cd GingerAI-Assist

# Add upstream remote
git remote add upstream https://github.com/original-owner/GingerAI-Assist.git
```

### 2. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
```

Use descriptive branch names:
- `feature/add-voice-input`
- `bugfix/chat-message-overflow`
- `docs/update-setup-guide`

### 3. Make Your Changes

Follow the coding standards:

#### JavaScript/React
- Use ES6+ syntax
- Use functional components in React
- Follow Airbnb style guide
- Use meaningful variable names

#### File Structure
- Keep components focused and reusable
- One component per file
- Use `index.js` for exports
- Organize by feature, not by file type

#### Comments
- Comment complex logic
- Use JSDoc for functions
- Keep comments up-to-date

### 4. Commit Messages

Write clear, descriptive commit messages:

```
feat: Add voice input functionality
- Implement speech-to-text conversion
- Add voice button to chat interface
- Handle browser compatibility

fix: Resolve chat history loading issue
- Clear previous messages before loading
- Add proper error handling

docs: Update API documentation
- Add endpoint examples
- Fix typos in descriptions
```

### 5. Test Your Changes

```bash
# Backend
cd server
npm test

# Frontend
cd client
npm test
```

### 6. Push and Create PR

```bash
# Push to your fork
git push origin feature/your-feature-name

# Create Pull Request on GitHub
# Reference any related issues: Closes #123
```

## Pull Request Guidelines

Your PR should:

- [ ] Have a clear, descriptive title
- [ ] Include a detailed description of changes
- [ ] Reference related issues
- [ ] Have no merge conflicts
- [ ] Pass all CI/CD checks
- [ ] Include updated documentation if needed
- [ ] Have proper commit history

### PR Template

```markdown
## Description
Brief description of what this PR does.

## Related Issues
Closes #123

## Changes Made
- Change 1
- Change 2
- Change 3

## Testing
- [ ] Tested locally
- [ ] Added tests
- [ ] Updated docs

## Screenshots (if applicable)
Screenshots or GIFs showing the changes.
```

## Areas We Need Help With

### High Priority
- [ ] Backend unit tests
- [ ] Frontend E2E tests
- [ ] Documentation improvements
- [ ] Bug fixes

### Medium Priority
- [ ] UI/UX improvements
- [ ] Performance optimizations
- [ ] Code refactoring
- [ ] Configuration improvements

### Nice to Have
- [ ] Language translations
- [ ] Theme/styling improvements
- [ ] Example projects
- [ ] Blog posts/tutorials

## Development Setup

See [SETUP.md](SETUP.md) for detailed setup instructions.

## Coding Standards

### Backend (Node.js)

```javascript
// ✅ Good
const processUserMessage = async (message, userId) => {
  try {
    const validation = validateInput(message);
    if (!validation.isValid) {
      throw new Error(validation.error);
    }
    return await generateResponse(message);
  } catch (error) {
    logger.error('Error processing message:', error);
    throw error;
  }
};

// ❌ Avoid
const process = async (m, u) => {
  var result = generateResponse(m);
  return result;
};
```

### Frontend (React)

```javascript
// ✅ Good
const ChatMessage = ({ message, isUser }) => {
  return (
    <div className={isUser ? 'user-message' : 'ai-message'}>
      <p>{message.content}</p>
      <time>{formatTime(message.timestamp)}</time>
    </div>
  );
};

// ❌ Avoid
const ChatMessage = (props) => {
  return (
    <div className={props.isUser ? 'user' : 'ai'}>
      <p>{props.msg.text}</p>
    </div>
  );
};
```

## Documentation

When adding features, update:
- [ ] README.md (if user-facing)
- [ ] API documentation (if backend)
- [ ] Code comments (if complex)
- [ ] SETUP.md (if setup changes)
- [ ] ROADMAP.md (if future planning)

## Performance Considerations

- Use lazy loading for images
- Implement pagination for lists
- Cache API responses intelligently
- Optimize database queries
- Profile before optimizing

## Security

- Never commit secrets to git
- Validate all user inputs
- Sanitize output to prevent XSS
- Use environment variables
- Follow OWASP guidelines

## Testing

### Backend Tests

```bash
# Run all tests
npm test

# Run specific test file
npm test -- tests/auth.test.js

# With coverage
npm test -- --coverage
```

### Frontend Tests

```bash
# Run all tests
npm test

# Watch mode
npm test -- --watch

# Coverage
npm test -- --coverage
```

## Release Process

1. Update version in `package.json`
2. Update `CHANGELOG.md`
3. Create a git tag: `git tag v1.0.0`
4. Push: `git push origin main --tags`
5. Create GitHub Release

## Questions?

- Check [SETUP.md](SETUP.md) for setup help
- Read [README.md](README.md) for overview
- Check [ROADMAP.md](ROADMAP.md) for planned features
- Open an issue for questions
- Start a discussion on GitHub

## Recognition

Contributors will be recognized in:
- CONTRIBUTORS.md
- README.md
- Release notes
- GitHub contributors page

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Happy Contributing! 🎉**

Made with ❤️ for the community
