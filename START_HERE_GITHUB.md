# START HERE - Đẩy Code Lên GitHub

## 3 Bước Đơn Giản (5 Phút)

### Bước 1: Tạo Repository (1 phút)

1. Đi đến: **https://github.com/new**
2. Điền:
   - Repository name: `Domian-fpt`
   - Description: `Next.js 16 Project`
   - Visibility: `Public`
   - ☑️ Add a README file
3. Click: **Create repository**

✅ Bước 1 xong!

---

### Bước 2: Chạy Script (1 phút)

**Mở Terminal/Command Prompt và chạy:**

```bash
cd /vercel/share/v0-project
bash push-to-github.sh dotcom-03 Domian-fpt
```

**Khi được hỏi:**
- Nhập `y` để confirm
- Username: `your-github-username` (ví dụ: `dotcom-03`)
- Password: **Personal Access Token** (xem bên dưới)

✅ Bước 2 xong! Script tự động push toàn bộ code

---

### Bước 3: Xác Minh (1 phút)

Đi đến: **https://github.com/dotcom-03/Domian-fpt**

Bạn sẽ thấy tất cả files của mình! 🎉

✅ Bước 3 xong!

---

## Nếu Gặp Lỗi - Lấy Personal Access Token

**Lỗi**: `Authentication failed` hoặc `401 Unauthorized`

**Giải quyết:**

1. Đi đến: https://github.com/settings/tokens
2. Click: **Generate new token** → **Generate new token (classic)**
3. Tên: `v0-project`
4. Chọn scope:
   - ☑️ repo
   - ☑️ workflow
5. Click: **Generate token**
6. **COPY** token (không hiển thị lại!)
7. Dùng token thay cho password khi chạy script

Rồi chạy lại script:
```bash
bash push-to-github.sh dotcom-03 Domian-fpt
```

---

## Không Muốn Dùng Script? Manual Way

```bash
# 1. Configure
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/dotcom-03/Domian-fpt.git

# 2. Commit
git branch -M main
git add -A
git commit -m "Initial commit: Next.js 16 project"

# 3. Push
git push -u origin main
```

Khi được hỏi Password: Dùng Personal Access Token (lấy ở trên)

---

## Các File Hướng Dẫn

| File | Nội Dung | Độ Chi Tiết |
|------|---------|-----------|
| **START_HERE_GITHUB.md** | File này - nhanh nhất | ⭐ |
| **GITHUB_QUICK_SETUP.md** | 3 cách push, troubleshoot | ⭐⭐ |
| **GITHUB_SETUP.md** | Chi tiết toàn bộ | ⭐⭐⭐ |

---

## Common Issues

| Vấn Đề | Giải Pháp |
|-------|---------|
| **Repository not found** | Tạo repo mới tại https://github.com/new |
| **Remote already exists** | Chạy: `git remote remove origin` |
| **Authentication failed** | Lấy Personal Access Token (link trên) |
| **Permission denied** | Dùng HTTPS (không SSH) |
| **Script không chạy** | Dùng Manual Way (cách 2) |

---

## Sau Khi Push Xong

✅ Code đã trên GitHub
✅ Có thể chia sẻ link
✅ Deploy to Vercel (optional): https://vercel.com/new
✅ Có thể làm việc từ máy khác
✅ Có thể share với team

---

## Hữu Ích - Git Commands Sau Push

```bash
# Kiểm tra status
git status

# Xem commits
git log --oneline -5

# Xem remote
git remote -v

# Push code mới (lần sau)
git add -A
git commit -m "Your message"
git push
```

---

## Verify Everything

Sau push, chạy:
```bash
git remote -v
# Kết quả:
# origin  https://github.com/dotcom-03/Domian-fpt.git (fetch)
# origin  https://github.com/dotcom-03/Domian-fpt.git (push)

git log --oneline -3
# Sẽ thấy commits
```

Và visit: https://github.com/dotcom-03/Domian-fpt
Sẽ thấy tất cả files!

---

## Troubleshooting Script

Nếu script không hoạt động:

1. Kiểm tra bash cài đặt: `bash --version`
2. Kiểm tra git: `git --version`
3. Chạy manual way (bên trên)
4. Hoặc read GITHUB_SETUP.md

---

## Ready?

Choose:

**EASY**: 
```bash
bash push-to-github.sh dotcom-03 Domian-fpt
```

**Manual**:
Read GITHUB_QUICK_SETUP.md & follow steps

**Detailed**:
Read GITHUB_SETUP.md

---

**LET'S GO! 🚀**
