// @ts-check

import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'

import App from './App.jsx';
import Nav from './pages/Nav.jsx';
import { BrowserRouter } from 'react-router-dom';

const root = /** @type {HTMLElement} */ (document.getElementById('root'));

createRoot(root).render(
  <StrictMode>
    <BrowserRouter basename='/my-app'>
      <Nav />
      <App />
    </BrowserRouter>
  </StrictMode>,
)
