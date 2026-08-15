// @ts-check

import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'

import App from './App.jsx';

const root = /** @type {HTMLElement} */ (document.getElementById('root'));

createRoot(root).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
