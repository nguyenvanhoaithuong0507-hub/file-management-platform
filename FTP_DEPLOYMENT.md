# 📤 Hướng Dẫn Upload lên FTP & Triển Khai

Tài liệu này hướng dẫn cách upload dự án Next.js lên server thông qua FTP và chạy trên Node.js.

---

## ⚙️ Yêu Cầu Server

- **Node.js**: v18.x trở lên (khuyên v20.x)
- **npm/pnpm/yarn**: Package manager
- **Port**: 3000 (hoặc config khác)
- **OS**: Linux, macOS, Windows Server

---

## 📋 Chuẩn Bị Trước Khi Upload

### 1. Build Project Locally

```bash
# Cài dependencies
pnpm install

# Build production
pnpm build

# Test build locally
pnpm start
```

### 2. Kiểm Tra Files Cần Upload

**Files BẮT BUỘC upload:**
```
✅ app/              (tất cả files)
✅ components/       (tất cả files)
✅ lib/              (tất cả files)
✅ public/           (tất cả assets)
✅ types/            (type definitions)
✅ utils/            (utilities)
✅ hooks/            (custom hooks)
✅ constants/        (constants)
✅ data/             (JSON data)
✅ styles/           (stylesheets)
✅ package.json      (dependencies list)
✅ next.config.mjs   (Next.js config)
✅ tsconfig.json     (TypeScript config)
✅ tailwind.config.ts (Tailwind config)
✅ postcss.config.mjs (PostCSS config)
✅ .env.production   (environment vars)
```

**Files KHÔNG upload (Git/Build):**
```
❌ node_modules/     (cài lại trên server)
❌ .next/            (build lại trên server)
❌ .git/             (không cần)
❌ .env.local        (local development)
❌ README.md         (tùy chọn)
```

---

## 🔧 Phương Pháp 1: FileZilla (FTP GUI)

### Bước 1: Cài Đặt FileZilla
- Download từ: https://filezilla-project.org
- Cài đặt ứng dụng

### Bước 2: Cấu Hình Kết Nối

1. Mở FileZilla
2. Chọn **File → Site Manager**
3. Click **New site**
4. Nhập thông tin:
   - **Protocol**: FTP (or SFTP nếu hỗ trợ)
   - **Host**: ftp.example.com
   - **Port**: 21 (FTP) hoặc 22 (SFTP)
   - **User**: username
   - **Password**: password
5. Click **Connect**

### Bước 3: Upload Files

**Cấu trúc upload:**
```
Remote Server:
/home/username/
  └── public_html/          (hoặc /app)
      └── nextjs-app/       (thư mục dự án)
          ├── app/
          ├── components/
          ├── lib/
          ├── package.json
          └── ...
```

**Cách upload:**
1. Left panel: Chọn folder local `/project`
2. Right panel: Navigate đến `/public_html/`
3. Right-click → Create folder: `nextjs-app`
4. Double-click `nextjs-app` để vào
5. Chọn files/folders → Right-click → Upload

### Bước 4: Kiểm Tra Upload

```bash
# SSH vào server
ssh username@example.com

# Navigate
cd ~/public_html/nextjs-app

# Kiểm tra files
ls -la
# Kết quả:
# app/
# components/
# lib/
# package.json
# ...
```

---

## 🔧 Phương Pháp 2: Command Line (SFTP)

### Bước 1: Tạo Script Upload

**File: `deploy.sh`**
```bash
#!/bin/bash

# Configuration
SERVER="username@example.com"
REMOTE_PATH="/home/username/public_html/nextjs-app"
LOCAL_PATH="."

# Create remote directory
ssh $SERVER "mkdir -p $REMOTE_PATH"

# Upload files
sftp -b - $SERVER << !
  cd $REMOTE_PATH
  
  # Upload folders
  put -r app
  put -r components
  put -r lib
  put -r public
  put -r types
  put -r utils
  put -r hooks
  put -r constants
  put -r data
  put -r styles
  
  # Upload config files
  put package.json
  put next.config.mjs
  put tsconfig.json
  put tailwind.config.ts
  put postcss.config.mjs
  put .env.production
  
  quit
!

echo "✅ Upload completed!"
```

### Bước 2: Chạy Script

```bash
# Make script executable
chmod +x deploy.sh

# Run
./deploy.sh
```

---

## 🔧 Phương Pháp 3: Git Deployment (Recommended)

### Bước 1: Tạo Repository

```bash
# Tạo local git repo
git init
git add .
git commit -m "Initial commit"

# Push to GitHub/GitLab
git remote add origin https://github.com/yourusername/repo.git
git push -u origin main
```

### Bước 2: SSH vào Server

```bash
ssh username@example.com
```

### Bước 3: Clone Repository

```bash
cd ~/public_html

# Clone repository
git clone https://github.com/yourusername/repo.git nextjs-app
cd nextjs-app
```

### Bước 4: Cài Đặt Dependencies

```bash
# Cài pnpm (recommended)
npm install -g pnpm

# Cài dependencies
pnpm install
```

---

## 🚀 Setup Trên Server (Sau Upload)

### Bước 1: SSH vào Server

```bash
ssh username@example.com
cd ~/public_html/nextjs-app
```

### Bước 2: Cài Node.js (nếu chưa có)

```bash
# Kiểm tra node version
node --version

# Nếu chưa có, cài từ NodeSource
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Bước 3: Cài pnpm

```bash
npm install -g pnpm
pnpm --version
```

### Bước 4: Cài Dependencies

```bash
pnpm install
```

### Bước 5: Setup Environment

```bash
# Tạo .env.production
nano .env.production

# Nhập:
NEXT_PUBLIC_API_URL=https://api.example.com
DATABASE_URL=postgresql://...
NEXTAUTH_SECRET=your-secret-key
NODE_ENV=production

# Ctrl+X → Y → Enter để lưu
```

### Bước 6: Build Production

```bash
pnpm build

# Kết quả: .next/ folder được tạo
```

### Bước 7: Chạy Application

```bash
# Option 1: Direct (for testing)
pnpm start

# Option 2: Background (PM2 recommended)
npm install -g pm2
pm2 start "pnpm start" --name "nextjs-app"
pm2 startup
pm2 save
```

---

## 🔒 Setup PM2 (Recommended)

### Bước 1: Cài PM2

```bash
npm install -g pm2
```

### Bước 2: Tạo Ecosystem File

**File: `ecosystem.config.js`**
```js
module.exports = {
  apps: [
    {
      name: 'nextjs-app',
      script: 'pnpm',
      args: 'start',
      cwd: '/home/username/public_html/nextjs-app',
      instances: 'max',
      exec_mode: 'cluster',
      env: {
        NODE_ENV: 'production',
        PORT: 3000,
      },
      error_file: '/home/username/logs/err.log',
      out_file: '/home/username/logs/out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
    },
  ],
}
```

### Bước 3: Chạy PM2

```bash
# Start app
pm2 start ecosystem.config.js

# Setup auto-restart trên reboot
pm2 startup
pm2 save

# Monitor
pm2 monit
pm2 logs
```

---

## 🌐 Setup Nginx (Web Server)

### Bước 1: Cài Nginx

```bash
sudo apt-get update
sudo apt-get install -y nginx
```

### Bước 2: Tạo Config File

**File: `/etc/nginx/sites-available/nextjs-app`**
```nginx
upstream nextjs_backend {
  server localhost:3000;
}

server {
  listen 80;
  server_name example.com www.example.com;

  # Redirect HTTP to HTTPS (nếu có SSL)
  return 301 https://$server_name$request_uri;
}

server {
  listen 443 ssl http2;
  server_name example.com www.example.com;

  # SSL certificates (nếu sử dụng HTTPS)
  ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;

  # Proxy settings
  location / {
    proxy_pass http://nextjs_backend;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
    
    # Timeouts
    proxy_connect_timeout 60s;
    proxy_send_timeout 60s;
    proxy_read_timeout 60s;
  }

  # Static files cache
  location /_next/static {
    alias /home/username/public_html/nextjs-app/.next/static;
    expires 365d;
    add_header Cache-Control "public, immutable";
  }

  location /public {
    alias /home/username/public_html/nextjs-app/public;
    expires 30d;
    add_header Cache-Control "public";
  }

  # Gzip compression
  gzip on;
  gzip_comp_level 6;
  gzip_types text/plain text/css text/javascript application/json;
}
```

### Bước 3: Enable Config

```bash
# Create symlink
sudo ln -s /etc/nginx/sites-available/nextjs-app /etc/nginx/sites-enabled/

# Test config
sudo nginx -t

# Restart nginx
sudo systemctl restart nginx
```

---

## 🔐 Setup SSL (Let's Encrypt)

```bash
# Cài Certbot
sudo apt-get install -y certbot python3-certbot-nginx

# Tạo certificate
sudo certbot certonly --nginx -d example.com -d www.example.com

# Auto-renew
sudo systemctl enable certbot.timer
sudo systemctl start certbot.timer
```

---

## 📊 Monitoring & Logs

### View Logs

```bash
# PM2 logs
pm2 logs nextjs-app

# Nginx logs
sudo tail -f /var/log/nginx/error.log
sudo tail -f /var/log/nginx/access.log

# System logs
journalctl -u pm2-username -f
```

### Monitor Resources

```bash
# CPU, Memory usage
pm2 monit

# System stats
htop

# Disk space
df -h
```

---

## 🔄 Update Deployment

### Cách Update Code

```bash
# SSH vào server
ssh username@example.com
cd ~/public_html/nextjs-app

# Pull latest changes
git pull origin main

# Cài dependencies mới (nếu có)
pnpm install

# Build lại
pnpm build

# Restart PM2
pm2 restart nextjs-app
```

---

## ✅ Checklist Triển Khai

- [ ] Node.js v20.x cài đặt
- [ ] pnpm cài đặt
- [ ] Files upload hoàn tất
- [ ] .env.production có giá trị
- [ ] `pnpm install` chạy thành công
- [ ] `pnpm build` thành công
- [ ] PM2 chạy ứng dụng
- [ ] Nginx cấu hình OK
- [ ] Domain/DNS pointing đúng
- [ ] SSL certificate (nếu HTTPS)
- [ ] Firewall cho phép port 80, 443
- [ ] Database connection OK
- [ ] File uploads working
- [ ] Logs monitoring setup

---

## 🆘 Troubleshooting

### Error: "Cannot find module 'next'"

```bash
# Cài dependencies
pnpm install
```

### Error: "Port 3000 already in use"

```bash
# Tìm process đang dùng port
lsof -i :3000

# Kill process
kill -9 <PID>
```

### Build fails

```bash
# Xóa build cũ
rm -rf .next

# Build lại
pnpm build

# Kiểm tra build logs
pnpm build --verbose
```

### Memory issue

```bash
# Tăng memory limit
NODE_OPTIONS="--max-old-space-size=2048" pnpm build
```

---

## 📞 Support

Nếu có vấn đề:

1. Kiểm tra logs: `pm2 logs`
2. Kiểm tra Nginx: `sudo tail -f /var/log/nginx/error.log`
3. Kiểm tra disk space: `df -h`
4. Kiểm tra database connection
5. Kiểm tra environment variables: `cat .env.production`

---

## 🎉 Thành Công!

Nếu tất cả đều ok, ứng dụng của bạn đang chạy trên server! 🚀

Truy cập: `https://example.com`

---

**Happy deployment! 🎊**
