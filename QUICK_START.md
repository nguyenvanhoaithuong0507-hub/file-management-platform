# ⚡ Quick Start - Bắt Đầu Nhanh

Hướng dẫn này sẽ giúp bạn chạy dự án trong **5 phút**.

---

## 🚀 Start Local (5 phút)

### Step 1: Cài Dependencies

```bash
pnpm install
# hoặc: npm install
```

### Step 2: Setup Environment

```bash
cp .env.example .env.local
# Chỉnh sửa .env.local nếu cần
```

### Step 3: Run Dev Server

```bash
pnpm dev
# hoặc: npm run dev
```

### Step 4: Mở Trình Duyệt

```
http://localhost:3000
```

**✅ Done!** Ứng dụng chạy trên local.

---

## 📁 Cấu Trúc Nhanh

```
app/                # Routes & Pages
├── page.tsx        # Trang chủ
└── api/           # API endpoints
  └── users/route.ts

components/         # React Components
├── ui/            # UI components
└── forms/         # Form components

lib/                # Utilities
├── api-client.ts  # HTTP client
└── utils.ts       # Helpers

public/             # Images, icons
types/              # TypeScript types
```

---

## 💡 Ví Dụ: Tạo Trang Mới

### File: `app/about/page.tsx`

```tsx
export default function About() {
  return (
    <main className="container mx-auto p-8">
      <h1 className="text-4xl font-bold mb-4">About Us</h1>
      <p>Nội dung trang about</p>
    </main>
  )
}
```

**URL:** `http://localhost:3000/about`

---

## 💡 Ví Dụ: Tạo API

### File: `app/api/hello/route.ts`

```ts
import { NextResponse } from 'next/server'

export async function GET() {
  return NextResponse.json({ message: 'Hello!' })
}
```

**URL:** `http://localhost:3000/api/hello`

---

## 💡 Ví Dụ: Tạo Component

### File: `components/Button.tsx`

```tsx
export function Button({ children }: { children: string }) {
  return (
    <button className="px-4 py-2 bg-blue-500 text-white rounded">
      {children}
    </button>
  )
}
```

**Dùng:**
```tsx
import { Button } from '@/components/Button'

export default function Page() {
  return <Button>Click me</Button>
}
```

---

## 📝 Build & Deploy

### Build Production

```bash
pnpm build
pnpm start
```

### Deploy trên Vercel

#### Method 1: GitHub (Tự động)
1. Push code lên GitHub
2. Vào vercel.com
3. Import repository
4. Vercel tự động deploy

#### Method 2: Vercel CLI

```bash
npm i -g vercel
vercel login
vercel --prod
```

---

## 🔗 Common Tasks

| Task | Command |
|------|---------|
| Dev server | `pnpm dev` |
| Build | `pnpm build` |
| Production | `pnpm start` |
| Lint | `pnpm lint` |
| Type check | `pnpm type-check` |

---

## 📚 Tài Liệu Chi Tiết

- **Cấu trúc đầy đủ**: Xem [FILE_STRUCTURE.md](./FILE_STRUCTURE.md)
- **Triển khai FTP**: Xem [FTP_DEPLOYMENT.md](./FTP_DEPLOYMENT.md)
- **Hướng dẫn đầy đủ**: Xem [README.md](./README.md)

---

## ❓ Thắc Mắc Thường Gặp

**Q: Cách thêm page mới?**
A: Tạo folder trong `app/` và add `page.tsx`

**Q: Cách gọi API?**
A: Dùng `apiGet()`, `apiPost()` từ `lib/api-client.ts`

**Q: Cách thêm component UI?**
A: Tạo file trong `components/` và import dùng

**Q: Làm sao deploy?**
A: Push GitHub → Connect Vercel → Auto deploy

---

## 🎯 Next Steps

1. ✅ Chạy dev server
2. ✅ Explore cấu trúc
3. ✅ Tạo pages mới
4. ✅ Thêm components
5. ✅ Tạo API routes
6. ✅ Deploy lên Vercel

---

**Mọi thắc mắc xem FILE_STRUCTURE.md hoặc README.md! 🚀**
