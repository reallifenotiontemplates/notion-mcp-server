FROM node:20-slim
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build
RUN npm link
ENV OPENAPI_MCP_HEADERS="{}"
CMD ["notion-mcp-server"]
