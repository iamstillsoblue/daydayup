FROM node:lts AS runtime
WORKDIR /app

# 拷贝代码
COPY . .

# 安装 pnpm
RUN npm install -g pnpm

# 安装依赖
RUN rm -rf node_modules pnpm-lock.yaml && pnpm install

# 构建应用
RUN pnpm run build

ENV HOST=0.0.0.0
ENV PORT=1218
EXPOSE 1218
CMD ["node", "./dist/server/entry.mjs"]
