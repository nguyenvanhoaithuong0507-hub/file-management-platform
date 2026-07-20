# GitHub Quick Setup - 3 Bước Đơn Giản

## Bước 1️⃣: Tạo Repository trên GitHub

1. Đi đến: https://github.com/new
2. Điền thông tin:
   - Repository name: `Domian-fpt` (hoặc tên khác)
   - Description: Next.js 16 Project
   - Visibility: **Public** (dễ hơn) hoặc **Private**
   - Check: ✅ Add a README file
3. Click **Create repository**

✅ DONE! Bạn có repository trên GitHub!

---

## Bước 2️⃣: Chạy Script Tự Động (EASY WAY)

```bash
cd /vercel/share/v0-project
bash push-to-github.sh dotcom-03 Domian-fpt
```

Script sẽ tự động:
- Kiểm tra tất cả files
- Kết nối với GitHub
- Push code lên

---

## Bước 3️⃣: Manual Push (Nếu Script Không Hoạt Động)

```bash
cd /vercel/share/v0-project

# A. Configure remote
git remote add origin https://github.com/dotcom-03/Domian-fpt.git

# B. Commit
git branch -M main
git add -A
git commit -m "Initial commit: Next.js 16 project"

# C. Push
git push -u origin main
```

Bạn sẽ được yêu cầu nhập:
- **Username**: GitHub username (dotcom-03)
- **Password**: Personal Access Token (KHÔNG phải mật khẩu!)

---

## Lấy Personal Access Token

Nếu bạn gặp lỗi xác thực:

1. Đi đến: https://github.com/settings/tokens
2. Click **Generate new token** → **classic**
3. Tên: `v0-project`
4. Chọn: ✅ repo ✅ workflow
5. Click **Generate**
6. Copy token (không hiển thị lại!)
7. Sử dụng token làm password

---

## Kiểm Tra Sau Push

```bash
# 1. Kiểm tra remote
git remote -v

# 2. Kiểm tra commits
git log --oneline -5

# 3. Đi đến GitHub
# https://github.com/dotcom-03/Domian-fpt
```

---

## Troubleshooting

| Lỗi | Giải Pháp |
|-----|----------|
| Repository not found | Tạo repo mới tại https://github.com/new |
| Authentication failed | Dùng Personal Access Token, không phải mật khẩu |
| Remote already exists | Chạy: `git remote remove origin` |
| Permission denied | Dùng HTTPS (không SSH) hoặc tạo SSH key |

---

## Done! 🎉

Sau khi push thành công:
- Code của bạn trên GitHub
- Có thể chia sẻ link với người khác
- Có thể deploy to Vercel
- Có thể tạo backup

Enjoy! 🚀
