# 📁 Cấu Trúc Thư Mục FTP - Trang Web Next.js

## 🏗️ Cấu Trúc Toàn Bộ Dự Án

```
project-root/
│
├── 📂 app/                           # Next.js 16 App Router (Bắt buộc)
│   ├── layout.tsx                   # Layout chính toàn ứng dụng
│   ├── page.tsx                     # Trang chủ (/)
│   ├── globals.css                  # CSS toàn cục + Tailwind
│   │
│   ├── 📂 (auth)/                   # Nhóm route - Xác thực
│   │   ├── login/page.tsx           # Trang đăng nhập
│   │   ├── register/page.tsx        # Trang đăng ký
│   │   └── forgot-password/page.tsx # Quên mật khẩu
│   │
│   ├── 📂 dashboard/                # Trang dashboard
│   │   ├── layout.tsx               # Layout dashboard
│   │   ├── page.tsx                 # Trang chính dashboard
│   │   ├── 📂 profile/              # Thư mục con
│   │   │   └── page.tsx             # Trang profile
│   │   └── 📂 settings/             # Cài đặt
│   │       └── page.tsx             # Trang settings
│   │
│   ├── 📂 api/                      # API Routes (Node.js Backend)
│   │   ├── 📂 auth/                 # API xác thực
│   │   │   ├── login/route.ts       # POST /api/auth/login
│   │   │   ├── logout/route.ts      # POST /api/auth/logout
│   │   │   └── register/route.ts    # POST /api/auth/register
│   │   │
│   │   ├── 📂 users/                # API người dùng
│   │   │   ├── route.ts             # GET/POST /api/users
│   │   │   └── [id]/route.ts        # GET/PUT/DELETE /api/users/[id]
│   │   │
│   │   ├── 📂 posts/                # API bài viết
│   │   │   ├── route.ts             # GET/POST /api/posts
│   │   │   └── [id]/route.ts        # GET/PUT/DELETE /api/posts/[id]
│   │   │
│   │   └── 📂 upload/               # API upload file
│   │       └── route.ts             # POST /api/upload
│   │
│   ├── 📂 not-found/
│   │   └── page.tsx                 # Trang 404
│   │
│   └── 📂 error/
│       └── page.tsx                 # Trang lỗi
│
├── 📂 components/                    # React Components
│   ├── 📂 ui/                       # UI Components từ shadcn/ui
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── input.tsx
│   │   ├── modal.tsx
│   │   ├── navbar.tsx
│   │   └── ... (các component shadcn)
│   │
│   ├── 📂 layouts/                  # Layout Components
│   │   ├── Header.tsx
│   │   ├── Footer.tsx
│   │   ├── Sidebar.tsx
│   │   └── Navigation.tsx
│   │
│   ├── 📂 common/                   # Common Components
│   │   ├── Logo.tsx
│   │   ├── Breadcrumb.tsx
│   │   ├── Pagination.tsx
│   │   └── LoadingSpinner.tsx
│   │
│   ├── 📂 forms/                    # Form Components
│   │   ├── LoginForm.tsx
│   │   ├── RegisterForm.tsx
│   │   ├── ProfileForm.tsx
│   │   └── SearchForm.tsx
│   │
│   ├── 📂 cards/                    # Card Components
│   │   ├── PostCard.tsx
│   │   ├── UserCard.tsx
│   │   └── ProductCard.tsx
│   │
│   └── 📂 sections/                 # Page Sections
│       ├── HeroSection.tsx
│       ├── FeaturesSection.tsx
│       ├── TestimonialsSection.tsx
│       └── CTASection.tsx
│
├── 📂 lib/                           # Utility Functions
│   ├── utils.ts                     # Helper functions (cn, format...)
│   ├── api-client.ts                # HTTP client
│   ├── auth.ts                      # Authentication logic
│   ├── validation.ts                # Form validation
│   └── constants.ts                 # Constant values
│
├── 📂 hooks/                         # Custom React Hooks
│   ├── useAuth.ts                   # Hook xác thực
│   ├── useFetch.ts                  # Hook fetch data
│   ├── useLocalStorage.ts           # Hook localStorage
│   ├── useDarkMode.ts               # Hook dark mode
│   └── useDebounce.ts               # Hook debounce
│
├── 📂 utils/                         # Utility Functions
│   ├── format.ts                    # Format date, number...
│   ├── validators.ts                # Validation functions
│   ├── storage.ts                   # localStorage helpers
│   └── logger.ts                    # Logging utility
│
├── 📂 types/                         # TypeScript Types & Interfaces
│   ├── index.ts                     # Export toàn bộ types
│   ├── user.ts                      # User types
│   ├── post.ts                      # Post types
│   ├── api.ts                       # API response types
│   └── common.ts                    # Common types
│
├── 📂 constants/                     # Constant Values
│   ├── api.ts                       # API endpoints
│   ├── config.ts                    # Application config
│   ├── messages.ts                  # Message templates
│   └── navigation.ts                # Navigation items
│
├── 📂 config/                        # Configuration Files
│   ├── site.config.ts               # Site configuration
│   ├── navigation.config.ts         # Navigation setup
│   └── feature-flags.ts             # Feature flags
│
├── 📂 data/                          # Static Data
│   ├── team.json                    # Team members data
│   ├── faq.json                     # FAQ data
│   ├── products.json                # Products data
│   └── testimonials.json            # Testimonials
│
├── 📂 public/                        # Static Assets (Served directly)
│   ├── 📂 images/
│   │   ├── logo.svg
│   │   ├── hero.png
│   │   ├── favicon.ico
│   │   └── ...
│   │
│   ├── 📂 icons/
│   │   ├── check.svg
│   │   ├── arrow.svg
│   │   └── ...
│   │
│   ├── 📂 fonts/
│   │   ├── inter.ttf
│   │   └── ...
│   │
│   └── 📂 videos/
│       └── demo.mp4
│
├── 📂 styles/                        # Global Styles
│   ├── globals.css                  # Global styles (duplicated in app/)
│   ├── variables.css                # CSS variables
│   └── animations.css               # Animation definitions
│
├── 📂 middleware/                    # Middleware Functions
│   ├── auth.ts                      # Authentication middleware
│   ├── logger.ts                    # Logging middleware
│   └── cors.ts                      # CORS middleware
│
├── 📂 .next/                         # Next.js Build Output (IGNORE)
├── 📂 node_modules/                  # NPM Packages (IGNORE)
│
├── .env.local                        # Environment Variables (LOCAL)
├── .env.example                      # Environment Template
├── .gitignore                        # Git ignore rules
├── next.config.mjs                   # Next.js Configuration
├── tsconfig.json                     # TypeScript Configuration
├── tailwind.config.ts                # Tailwind CSS Configuration
├── postcss.config.mjs                # PostCSS Configuration
├── components.json                   # shadcn/ui Configuration
├── package.json                      # NPM Dependencies
├── pnpm-lock.yaml                    # Lock file (pnpm)
├── README.md                         # Project Documentation
├── FILE_STRUCTURE.md                 # This file
│
└── vercel.json                       # Vercel Deployment Config
```

---

## 📋 Mô Tả Chi Tiết Các Thư Mục

### 1️⃣ **app/** - Next.js 16 App Router
- **Chứa**: Tất cả routes, pages, layouts, API
- **Quy tắc**: Cấu trúc thư mục = URL structure
- **Ví dụ**: `app/dashboard/profile/page.tsx` → `/dashboard/profile`

### 2️⃣ **components/** - React Components
- **ui/**: Reusable UI components (Button, Input, Modal...)
- **layouts/**: Layout wrappers (Header, Footer, Sidebar...)
- **forms/**: Form components
- **cards/**: Card components
- **sections/**: Page sections

### 3️⃣ **api/** - Backend API Routes
- **Không cần thư mục riêng** (nằm trong `app/api/`)
- Tạo files route.ts trong `app/api/`
- Hỗ trợ GET, POST, PUT, DELETE

### 4️⃣ **lib/** - Utility Functions
- Helper functions
- HTTP client
- Validation logic
- Constants

### 5️⃣ **hooks/** - Custom React Hooks
- useAuth: Quản lý xác thực
- useFetch: Gọi API
- useLocalStorage: Lưu trữ local
- useDarkMode: Chế độ tối

### 6️⃣ **types/** - TypeScript Types
- User interfaces
- API response types
- Common types

### 7️⃣ **public/** - Static Assets
- **Được phục vụ trực tiếp từ root**: `/images/logo.svg`
- **Không cần import**: Dùng string path
- **Tối ưu**: Vite tự động tối ưu hóa

### 8️⃣ **.env.local** - Environment Variables
```
NEXT_PUBLIC_API_URL=https://api.example.com
DATABASE_URL=postgresql://...
API_SECRET_KEY=your_secret_key
```

---

## 🚀 Cách Triển Khai trên Vercel

### Step 1: Đẩy lên GitHub
```bash
git add .
git commit -m "Initial commit"
git push origin main
```

### Step 2: Kết nối với Vercel
1. Vào vercel.com
2. Click "New Project"
3. Import repository GitHub
4. Vercel tự động phát hiện Next.js
5. Thêm environment variables
6. Click "Deploy"

### Step 3: Files Triển Khai
- `vercel.json`: Cấu hình Vercel
- `package.json`: Dependencies & scripts
- `.env.production`: Production env vars

---

## 📦 Các File Cấu Hình Quan Trọng

| File | Mục Đích |
|------|---------|
| `package.json` | Dependencies & Scripts |
| `tsconfig.json` | TypeScript Config |
| `next.config.mjs` | Next.js Config |
| `tailwind.config.ts` | Tailwind CSS Config |
| `components.json` | shadcn/ui Config |
| `postcss.config.mjs` | PostCSS Config |
| `.env.local` | Local Variables |
| `vercel.json` | Vercel Deploy Config |

---

## ✅ Checklist Triển Khai

- [ ] Tất cả dependencies trong package.json
- [ ] .env.local và .env.example match
- [ ] API routes hoạt động
- [ ] Database connection OK
- [ ] Images tối ưu
- [ ] Mobile responsive
- [ ] SEO metadata
- [ ] Error handling
- [ ] Security checks
- [ ] Performance optimized

---

## 🔗 Quy Tắc Đặt Tên

| Loại | Quy Tắc | Ví Dụ |
|------|---------|-------|
| Folders | kebab-case | `user-profile` |
| Files | camelCase (Component) | `UserProfile.tsx` |
| Files | snake_case (Utility) | `api_client.ts` |
| URL Routes | kebab-case | `/user-profile` |
| Variables | camelCase | `userName` |
| Constants | UPPER_SNAKE_CASE | `MAX_FILE_SIZE` |

---

## 🎯 Import Paths Tối Ưu

Sử dụng path aliases trong `tsconfig.json`:

```json
{
  "compilerOptions": {
    "paths": {
      "@/*": ["./*"],
      "@/components/*": ["./components/*"],
      "@/lib/*": ["./lib/*"],
      "@/hooks/*": ["./hooks/*"],
      "@/types/*": ["./types/*"],
      "@/utils/*": ["./utils/*"]
    }
  }
}
```

**Cách dùng:**
```tsx
import { Button } from '@/components/ui/button'
import { useAuth } from '@/hooks/useAuth'
import { cn } from '@/lib/utils'
```

---

## 📱 Upload lên FTP

```bash
# Chỉ upload các thư mục cần thiết
ftp_user@ftp.yourserver.com

# Upload toàn bộ (except node_modules, .next)
cd /vercel/share/v0-project
ftp> mput app/ components/ lib/ public/ types/ utils/ hooks/ *.json *.mjs *.ts package.json

# Hoặc dùng SFTP
sftp> put -r app
sftp> put -r components
...
```

---

## 🚀 Deploy trên Vercel (Recommended)

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

---

Dự án này sẵn sàng để triển khai trên Vercel hoặc bất kỳ server Node.js nào! 🎉
