# ---------- FRONTEND BUILD ----------
FROM node:18 AS frontend

WORKDIR /frontend

COPY Risk_Management/package*.json ./
RUN npm install

COPY Risk_Management .
RUN npm run build


# ---------- BACKEND ----------
FROM node:18

WORKDIR /app

COPY Backend/package*.json ./
RUN npm install

COPY Backend .

COPY --from=frontend /frontend/dist ./public

EXPOSE 5000

CMD ["node", "app.js"]