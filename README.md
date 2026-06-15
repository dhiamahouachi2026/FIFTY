# Türkçe Öğren — Fixed Working App

This version fixes the frontend so it is visible immediately.

## Run frontend

```bash
cd frontend
npm install
npm run dev
```

Open the URL shown by Vite, usually `http://localhost:5173`.

## Important

Do not open `frontend/index.html` by double-clicking. React/Vite apps must run with `npm run dev` or be deployed after `npm run build`.

## Demo mode

The app works without Supabase keys. It uses localStorage and fallback words, so you can see the website/frontend immediately.

## Optional backend AI

```bash
cd backend
npm install
cp .env.example .env
# add ANTHROPIC_API_KEY
npm run dev
```

Then in `frontend/.env` set:

```env
VITE_BACKEND_URL=http://localhost:3001
```

## Optional online progress

Add Supabase keys in `frontend/.env` and run `supabase_schema.sql` in Supabase.
