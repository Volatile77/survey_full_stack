# Deployment Guide

This guide explains how to deploy the Feedback Portal to **Render.com**.

## Prerequisites
1.  **GitHub Account**: Push this code to a GitHub repository.
2.  **Render Account**: Sign up at [render.com](https://render.com).
3.  **Database**: A PostgreSQL database (Neon.tech is recommended and already configured).

## Step 1: Push Code to GitHub
1.  Initialize git (if not already):
    ```bash
    git init
    git add .
    git commit -m "Ready for deployment"
    ```
2.  Create a new repository on GitHub.
3.  Push your code:
    ```bash
    git remote add origin <your-repo-url>
    git push -u origin main
    ```

## Step 2: Deploy on Render (Blueprint Method)
*Requires a Credit Card for verification.*

... (Render steps remain same) ...

## Alternative: Deploy on Hugging Face Spaces (No Credit Card)
If you don't have a credit card, **Hugging Face Spaces** is a great free alternative.

1.  **Sign Up**: Go to [huggingface.co](https://huggingface.co) and create an account.
2.  **Create Space**:
    - Click **New Space**.
    - Name: `feedback-portal`.
    - License: `MIT`.
    - SDK: **Docker**.
    - Template: **Blank**.
    - Visibility: **Public** or **Private**.
    - Click **Create Space**.
3.  **Upload Code**:
    - You can clone the Space repository and copy your files into it, OR
    - Use the web interface to upload files (drag and drop `backend`, `frontend`, `Dockerfile`, `requirements.txt`, `.env` etc.), OR
    - Add the Space as a remote to your existing git repo:
      ```bash
      git remote add space https://huggingface.co/spaces/<your-username>/feedback-portal
      git push space main
      ```
4.  **Environment Variables**:
    - Go to **Settings** tab in your Space.
    - Scroll to **Variables and secrets**.
    - Add your secrets (same as `.env`):
        - `DATABASE_URL`
        - `ADMIN_USERNAME`
        - `ADMIN_PASSWORD`
        - `MAIL_USERNAME`, `MAIL_PASSWORD`, etc.
    - **Note**: For `DATABASE_URL`, ensure your Neon DB allows connections.
5.  **Run**: The Space will build and start automatically. The URL will be `https://huggingface.co/spaces/<your-username>/feedback-portal` (or the direct embed link).

## Step 3: Verify
...

## Step 3: Verify
1.  Once the deployment is marked **Live**, click the URL provided by Render (e.g., `https://feedback-portal.onrender.com`).
2.  **Test Feedback**: Submit a feedback form.
3.  **Test Admin**: Go to `/admin.html` (e.g., `https://feedback-portal.onrender.com/admin.html`) and login with your credentials.

## Troubleshooting
- **Build Failed**: Check the Logs. Ensure `requirements.txt` is present.
- **Application Error**: Check Logs. Often due to missing environment variables or database connection issues.
- **Database Connection**: Ensure your Neon database allows connections from anywhere (0.0.0.0/0) or is correctly configured.
