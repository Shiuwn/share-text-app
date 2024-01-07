import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
const nodeEnv = process.env.NODE_ENV

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react({
      include: ['**/*.bs.mjs'],
    }),
  ],
  base: nodeEnv === 'production' ? "/share-text-app" : ""
});
