# 🚀 Next.js 16 Web Application

Trang web hiện đại sử dụng **Next.js 16**, **React 19**, **TypeScript**, và **Tailwind CSS**, sẵn sàng triển khai trên **Vercel**.

---

## ✨ Tính Năng

- ✅ Next.js 16 App Router (mới nhất)
- ✅ TypeScript hỗ trợ đầy đủ
- ✅ Tailwind CSS styling
- ✅ API Routes (Node.js backend)
- ✅ Authentication ready
- ✅ Database ready (Neon, Supabase, etc.)
- ✅ File uploads support
- ✅ SEO optimized
- ✅ Mobile responsive
- ✅ Dark mode ready

---

## 📁 Cấu Trúc Dự Án

Xem file `FILE_STRUCTURE.md` để biết chi tiết cấu trúc thư mục.

```
project/
├── app/                 # Next.js 16 App Router
├── components/          # React Components
├── lib/                 # Utility functions
├── hooks/               # Custom React Hooks
├── types/               # TypeScript types
├── constants/           # Constants
├── public/              # Static assets
├── data/                # Static data (JSON)
├── styles/              # Global styles
└── ...config files
```

---

## 🚀 Bắt Đầu Nhanh

### 1. Cài Đặt

```bash
# Clone repository
git clone <your-repo-url>
cd project

# Cài dependencies (sử dụng pnpm)
pnpm install

# Hoặc sử dụng npm
npm install

# Hoặc sử dụng yarn
yarn install
```

### 2. Cấu Hình Environment

```bash
# Copy file environment
cp .env.example .env.local

# Chỉnh sửa .env.local với thông tin của bạn
# Ví dụ:
# NEXT_PUBLIC_API_URL=http://localhost:3000/api
# DATABASE_URL=postgresql://...
```

### 3. Chạy Dev Server

```bash
pnpm dev
# Hoặc
npm run dev
```

Mở [http://localhost:3000](http://localhost:3000) trong trình duyệt.

### 4. Build Production

```bash
pnpm build
pnpm start

# Hoặc chỉ build
npm run build
npm start
```

---

## 📦 Các Tính Năng Chính

### API Routes
- Tạo API tại `/app/api/[route]/route.ts`
- Hỗ trợ GET, POST, PUT, DELETE
- Ví dụ: `/app/api/users/route.ts` → `/api/users`

### Authentication
- Sử dụng hooks: `useAuth`, `useLocalStorage`
- Token lưu trong localStorage
- Middleware xác thực có sẵn

### Database
- Tích hợp sẵn Neon PostgreSQL
- Sử dụng Drizzle ORM
- Migrations ready

### File Uploads
- API endpoint: `/api/upload`
- Hỗ trợ images, videos, documents
- Tích hợp S3/Blob storage

---

## 🛠️ Các Lệnh Hữu Ích

```bash
# Development
pnpm dev              # Chạy dev server
pnpm build            # Build production
pnpm start            # Chạy production
pnpm lint             # Kiểm tra linting
pnpm type-check       # Kiểm tra TypeScript

# Database (nếu sử dụng Neon)
pnpm db:push          # Push schema
pnpm db:pull          # Pull schema
pnpm db:migrate       # Run migrations
pnpm db:seed          # Seed database

# Other
pnpm format           # Format code
pnpm clean            # Clean build files
```

---

## 📝 Ví Dụ: Tạo Component

### File: `components/ui/UserCard.tsx`

```tsx
import React from 'react'
import type { User } from '@/types'

interface UserCardProps {
  user: User
  onSelect?: (user: User) => void
}

export function UserCard({ user, onSelect }: UserCardProps) {
  return (
    <div 
      className="p-4 border rounded-lg hover:shadow-lg cursor-pointer"
      onClick={() => onSelect?.(user)}
    >
      <h3 className="font-semibold">{user.name}</h3>
      <p className="text-gray-600">{user.email}</p>
      <span className="text-xs bg-blue-100 px-2 py-1 rounded">
        {user.role}
      </span>
    </div>
  )
}
```

---

## 📝 Ví Dụ: Gọi API

### File: `hooks/useUsers.ts`

```tsx
import { useState, useEffect } from 'react'
import { apiGet } from '@/lib/api-client'
import { API_ENDPOINTS } from '@/constants/api'
import type { User } from '@/types'

export function useUsers() {
  const [users, setUsers] = useState<User[]>([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    const fetchUsers = async () => {
      setLoading(true)
      try {
        const { data } = await apiGet(API_ENDPOINTS.USERS.LIST)
        setUsers(data.data)
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Unknown error')
      } finally {
        setLoading(false)
      }
    }

    fetchUsers()
  }, [])

  return { users, loading, error }
}
```

---

## 🚀 Triển Khai trên Vercel

### Method 1: Connect GitHub (Recommended)

1. Push code lên GitHub
2. Vào [vercel.com](https://vercel.com)
3. Click "New Project"
4. Import repository GitHub
5. Vercel tự động phát hiện Next.js
6. Thêm environment variables
7. Click "Deploy"

### Method 2: Vercel CLI

```bash
# Cài Vercel CLI
npm i -g vercel

# Login
vercel login

# Deploy
vercel

# Deploy production
vercel --prod
```

### Method 3: Manual FTP Upload

```bash
# Build project
pnpm build

# Upload folders to FTP:
# - app/
# - components/
# - lib/
# - public/
# - types/
# - package.json
# - next.config.mjs
# - tsconfig.json
# - tailwind.config.ts

# Run on server:
# pnpm install
# pnpm build
# pnpm start
```

---

## 🔧 Environment Variables

### Public Variables (Dùng trong browser)
```env
NEXT_PUBLIC_API_URL=https://api.example.com
NEXT_PUBLIC_APP_URL=https://example.com
NEXT_PUBLIC_GA_ID=UA-xxx
```

### Private Variables (Chỉ server)
```env
DATABASE_URL=postgresql://...
NEXTAUTH_SECRET=secret-key
API_SECRET_KEY=secret
```

---

## 📚 Tài Liệu Tham Khảo

- [Next.js Docs](https://nextjs.org/docs)
- [React Docs](https://react.dev)
- [TypeScript Docs](https://www.typescriptlang.org/docs)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Vercel Deployment](https://vercel.com/docs)

---

## 🐛 Troubleshooting

### Error: "Cannot find module '@/components'"
- Kiểm tra `tsconfig.json` có alias paths
- Restart dev server
- Clear `.next` folder: `rm -rf .next`

### Error: "NEXT_PUBLIC_API_URL is not set"
- Copy `.env.example` thành `.env.local`
- Thêm giá trị trong `.env.local`
- Restart dev server

### Build fails on Vercel
- Kiểm tra Node version: 20.x trở lên
- Kiểm tra `package.json` scripts
- Xem logs chi tiết trên Vercel dashboard

---

## 📞 Support

Nếu gặp vấn đề:

1. Kiểm tra [FILE_STRUCTURE.md](./FILE_STRUCTURE.md)
2. Xem các ví dụ trong `components/` và `app/api/`
3. Tham khảo Next.js docs
4. Tạo issue trên GitHub

---

## 📄 License

MIT License - Tự do sử dụng

---

## 🎉 Sẵn Sàng?

Bây giờ bạn có thể:

1. ✅ Tạo pages trong `/app`
2. ✅ Tạo components trong `/components`
3. ✅ Tạo API routes trong `/app/api`
4. ✅ Kết nối database
5. ✅ Triển khai trên Vercel

**Happy coding! 🚀**
