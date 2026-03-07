/**
 * @fileoverview Main entry point for the Memory Garden backend server.
 * Bootstraps the Express application.
 */

const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', message: 'Memory Garden server is running' });
});

// Start the server only if this file is executed directly (not when required for tests)
if (require.main === module) {
  app.listen(PORT, () => {
    // eslint-disable-next-line no-console
    console.log(`Server listening on port ${PORT}`);
  });
}

module.exports = app;
