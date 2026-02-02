FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies first (better caching)
COPY package.json .
RUN npm install --production

# Copy source code
COPY . .

# Create storage structure with permissions
# output: خروجی بیلد
# data: فایل‌های جیسون
# templates: فایل‌های قالب
# config: تنظیمات سیستم
RUN mkdir -p storage/templates storage/data storage/output storage/config && \
    chmod -R 777 storage

# Expose port
EXPOSE 3000

# Start command
CMD ["node", "server.js"]