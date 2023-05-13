import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    
    proxy: {
      "/api": {
        target: "https://cs157a-hospital.herokuapp.com",
        changeOrigin: true,
      },
      "/view": {
        target: "https://cs157a-hospital.herokuapp.com",
        changeOrigin: true,
      },
    }
  }
})
