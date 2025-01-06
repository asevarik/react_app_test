import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0', // Ensure the server is accessible from outside the container
    port: 5173,      // Optional: Explicitly set the port (default is 5173)
    strictPort: true // Optional: Ensures Vite fails if the port is in use
  }
})
