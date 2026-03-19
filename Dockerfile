FROM node:18-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# copiar standalone corretamente
RUN cp -r .next/standalone/* ./
RUN cp -r .next/static ./.next/static
RUN cp -r public ./public

EXPOSE 3000

ENV PORT=3000
ENV HOSTNAME=0.0.0.0

CMD ["node", "server.js"]