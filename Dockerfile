# 使用官方的 Python 執行環境作為基本的 Docker 影像
FROM python:3.6-slim

# 設定工作目錄為 /app
WORKDIR /app

# 複製目前目錄下的內容，放進 Docker 容器中的 /app
ADD ./api/api.py /app
ADD ./api/requirements.txt /app
# 安裝 requirements.txt 中所列的必要套件
RUN pip install -r requirements.txt
#-r requirements.txt

# 讓 80 連接埠可以從 Docker 容器外部存取
EXPOSE 5000

# 定義環境變數
ENV NAME World

# 當 Docker 容器啟動時，自動執行 app.py
CMD ["python", "api.py"]