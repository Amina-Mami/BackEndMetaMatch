FROM node:16-alpine AS build

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build-dev

# Stage 2: Create the final image
FROM node:16-alpine

WORKDIR /app

COPY --from=build /app .

EXPOSE 5000

CMD ["npm", "start"]



# FROM node:16-alpine
# WORKDIR /app
# COPY . /app
# RUN npm install
# RUN npm run build-dev
# EXPOSE 5000
# CMD ["npm", "start"]
# Stage 1: Build the application
