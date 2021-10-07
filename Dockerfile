# ---- Builder ----
FROM node:lts-alpine AS builder
WORKDIR /app
COPY . /app/
RUN yarn install --frozen-lockfile && \
    yarn build

FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html/
