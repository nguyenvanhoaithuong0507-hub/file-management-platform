# 🌐 Hướng Dẫn Triển Khai - Vercel, FTP, Server

Chọn phương pháp triển khai phù hợp với bạn.

---

## 🎯 Chọn Phương Pháp Triển Khai

| Phương Pháp | Dễ/Khó | Tốc Độ | Chi Phí | Khuyên |
|------------|--------|--------|--------|-------|
| **Vercel** (Git) | ⭐ Rất dễ | ⚡ 2 phút | 💰 Free | ✅ Tốt nhất |
| **Vercel CLI** | ⭐ Dễ | ⚡ 5 phút | 💰 Free | ✅ Tốt |
| **GitHub Pages** | ⭐ Dễ | ⚡ 2 phút | 💰 Free | ⚠️ Static only |
| **FTP + PM2** | ⭐⭐⭐ Khó | 🐌 20 phút | 💰 Có server | ❌ Phức tạp |
| **Docker** | ⭐⭐⭐ Khó | 🐌 15 phút | 💰 Tùy | ❌ Cho chuyên gia |

---

## 1️⃣ VERCEL (Recommended ✅)

### Cách 1A: GitHub Auto-Deploy (Tốt Nhất)

**Step 1: Push lên GitHub**
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOU/nextjs-app.git
git push -u origin main
```

**Step 2: Connect Vercel**
1. Vào https://vercel.com
2. Click "New Project"
3. Import GitHub repository
4. Vercel auto-detect Next.js
5. Thêm Environment Variables
6. Click "Deploy"

**Step 3: Done!**
- Vercel deploy tự động sau mỗi push
- URL: `https://nextjs-app.vercel.app`
- Tự động rebuild khi push code mới

---

### Cách 1B: Vercel CLI

**Step 1: Cài Vercel CLI**
```bash
npm install -g vercel
```

**Step 2: Login**
```bash
vercel login
# Mở browser, login, back to terminal
```

**Step 3: Deploy**
```bash
# Dev deployment (preview)
vercel

# Production deployment
vercel --prod
```

**Step 4: Done!**
- Vercel tạo domain
- Mỗi `vercel --prod` là production release

---

## 2️⃣ FTP + Node.js Server

Xem hướng dẫn chi tiết tại: [FTP_DEPLOYMENT.md](./FTP_DEPLOYMENT.md)

### Quick Overview:

**Step 1: Build Locally**
```bash
pnpm build
```

**Step 2: Upload via FTP**
- Dùng FileZilla hoặc SFTP
- Upload: `app/`, `components/`, `lib/`, `public/`, `package.json`, etc.

**Step 3: SSH vào Server**
```bash
ssh user@server.com
cd ~/public_html/nextjs-app
```

**Step 4: Setup Server**
```bash
# Cài Node.js (nếu chưa)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Cài pnpm
npm install -g pnpm

# Cài dependencies
pnpm install

# Setup environment
echo "NEXT_PUBLIC_API_URL=..." > .env.production

# Build
pnpm build
```

**Step 5: Run with PM2**
```bash
npm install -g pm2
pm2 start "pnpm start" --name "nextjs"
pm2 startup
pm2 save
```

**Step 6: Setup Nginx**
```bash
sudo apt install nginx
# Config nginx proxy to localhost:3000
sudo systemctl restart nginx
```

---

## 3️⃣ Docker + Deployment

### Dockerfile

**File: `Dockerfile`**
```dockerfile
FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json pnpm-lock.yaml ./

# Install dependencies
RUN npm install -g pnpm && pnpm install

# Copy source
COPY . .

# Build
RUN pnpm build

# Expose port
EXPOSE 3000

# Start
CMD ["pnpm", "start"]
```

### docker-compose.yml

```yaml
version: '3.8'
services:
  nextjs:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - NEXT_PUBLIC_API_URL=http://localhost:3000
    restart: unless-stopped
```

### Deploy

```bash
# Build image
docker build -t nextjs-app .

# Run container
docker run -p 3000:3000 nextjs-app

# hoặc với docker-compose
docker-compose up -d
```

---

## 4️⃣ Digital Ocean / Linode / AWS

### Basic Steps

1. **Tạo Droplet/Instance**
   - OS: Ubuntu 22.04 LTS
   - RAM: 2GB minimum
   - Storage: 20GB

2. **SSH vào Server**
   ```bash
   ssh root@YOUR_IP
   ```

3. **Update & Install**
   ```bash
   sudo apt update && sudo apt upgrade -y
   sudo apt install -y nodejs npm nginx
   npm install -g pnpm
   ```

4. **Clone/Upload Code**
   ```bash
   git clone YOUR_REPO
   cd nextjs-app
   pnpm install
   pnpm build
   ```

5. **Setup PM2**
   ```bash
   npm install -g pm2
   pm2 start "pnpm start"
   pm2 startup
   ```

6. **Setup Nginx**
   - Config reverse proxy
   - Point domain
   - Setup SSL

7. **Setup SSL (Free)**
   ```bash
   sudo apt install certbot python3-certbot-nginx
   sudo certbot --nginx -d yourdomain.com
   ```

---

## 5️⃣ Railway / Render / Fly.io

### Railway (Easiest VPS)

1. Vào https://railway.app
2. New project → Deploy from GitHub
3. Connect repository
4. Auto-detect Next.js
5. Add environment variables
6. Deploy
7. Custom domain (tùy chọn)

### Render

1. Vào https://render.com
2. New → Web Service
3. Connect GitHub
4. Environment: `Node`
5. Build: `pnpm build`
6. Start: `pnpm start`
7. Deploy

### Fly.io

```bash
# Cài Fly CLI
curl -L https://fly.io/install.sh | sh

# Login
flyctl auth login

# Deploy
flyctl launch
flyctl deploy
```

---

## 📊 So Sánh Các Phương Pháp

### Dễ Dùng

```
Vercel (GitHub)    ⭐⭐⭐⭐⭐ Easiest
Vercel (CLI)       ⭐⭐⭐⭐
Railway            ⭐⭐⭐⭐
Render             ⭐⭐⭐
Docker             ⭐⭐⭐
FTP + SSH          ⭐⭐
```

### Chi Phí

```
Vercel Free       💰 $0
Railway Free      💰 $0
Render Free       💰 $0
Fly.io Free       💰 $0
DigitalOcean      💰 $5-10/month
Linode            💰 $5-20/month
AWS               💰 $10-50/month (varies)
```

### Performance

```
Vercel            ⚡⚡⚡⚡⚡ CDN Global
Railway           ⚡⚡⚡⚡ Multiple regions
Render            ⚡⚡⚡⚡ Good
Fly.io            ⚡⚡⚡⚡ Edge computing
DigitalOcean      ⚡⚡⚡ Single region
```

---

## ✅ Checklist Trước Deploy

### Code
- [ ] All tests pass
- [ ] No console errors
- [ ] TypeScript type check OK
- [ ] Linting OK
- [ ] Build successful locally

### Environment
- [ ] `.env.production` configured
- [ ] Database connection tested
- [ ] API endpoints working
- [ ] Secrets safely configured

### Deployment
- [ ] Choose deployment method
- [ ] Domain/DNS ready
- [ ] SSL certificate (if needed)
- [ ] Monitoring setup
- [ ] Backup plan

---

## 🆘 Troubleshooting

### Deploy fails

```bash
# Check build locally
pnpm build

# Check logs on deployment platform
# Vercel: vercel logs
# Railway: railway logs
```

### App won't start

```bash
# SSH to server
ssh user@server.com

# Check processes
pm2 logs
systemctl status nginx
```

### Slow performance

```bash
# Check resources
htop
df -h

# Check logs for errors
pm2 logs --tail
```

---

## 🎓 Recommended Learning Path

1. **Start**: Vercel + GitHub (easiest)
2. **Next**: Learn FTP/SSH deployment
3. **Advanced**: Docker + server management
4. **Expert**: Kubernetes, CI/CD pipelines

---

## 🎯 My Recommendation

### For Most People: **Vercel + GitHub** ✅
- Zero configuration
- Free tier generous
- Auto-deploy on push
- Edge functions ready
- Best for Next.js

### For Learning: **DigitalOcean/Linode**
- Learn server management
- Full control
- ~$5/month
- Good for portfolio

### For Production SaaS: **Railway/Render**
- Easy but more control than Vercel
- Free tier with auto-scaling
- Good scaling options

---

## 📚 Resources

- [Vercel Docs](https://vercel.com/docs)
- [Next.js Deployment](https://nextjs.org/docs/deployment)
- [Railway Docs](https://railway.app/docs)
- [Render Docs](https://render.com/docs)
- [DigitalOcean Tutorials](https://www.digitalocean.com/community/tutorials)

---

**Choose a method and deploy now! 🚀**
