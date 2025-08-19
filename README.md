# GitSync 🚀🦸‍♂️

😱 Ever had nightmares about losing your precious GitHub repos? Or just want to flex with a backup on GitLab? GitSync is here to save your code (and your sanity)! It mirrors all your GitHub repositories to GitLab, keeping every commit, every embarrassing typo, and every moment of genius. 💾✨

> **Note:** 🖼️ GitLab may show your activity a bit differently, so your contribution graph might look like modern art. But don’t worry, your commit history is safe! 🛡️

## Features ✨

- Mirrors all your GitHub repositories to GitLab, including every commit (even the ones you regret). 🕵️‍♂️
- Works for personal and group namespaces on GitLab. Share the love (or the blame). 🤝
- Provides progress and logs with a rich UI, so you can watch your backup in style. 📊🎬
- Compatible with macOS and Linux. Windows? Maybe someday. (We like 🐧 penguins and 🍏 apples.)

## Installation 🛠️

1. **Clone this masterpiece:**

   ```sh
   git clone https://github.com/scienmanas/GitSync.git
   cd GitSync
   ```
2. **Install dependencies (because Python loves packages):**

   ```sh
   pip install -r requirements.txt
   ```
3. **Set up your secret sauce:**

   Create a `.env` file in the project root with:

   ```
   GITHUB_USER=your-github-username
   GITHUB_TOKEN=your-github-token
   GITLAB_USER=your-gitlab-username
   GITLAB_TOKEN=your-gitlab-token
   GITLAB_GROUP=your-gitlab-group   # Optional, for group namespace
   REPO_VISIBILITY=auto   # Optional. Set to 'public' to make all mirrored repos public on GitLab, 'private' to make all mirrored repos private, or 'auto' to match each repo's visibility to its original setting on GitHub.
   ```

   - Get a GitHub token with repo read access (don’t share it with strangers). 🤫
   - Get a GitLab token with `api` and `write_repository` scopes (superpowers required). 🦸‍♀️
   - `REPO_VISIBILITY` lets you control the visibility of your mirrored repos: set it to `public`, `private`, or `auto` to match the original.

## Usage 🎩

Run the script and watch the magic happen:

```sh
python main.py
```

Your GitHub repositories will be mirrored to GitLab, with logs and progress displayed in the terminal. Grab some popcorn 🍿 and enjoy the show!

## Notes 📝

- Works on macOS and Linux. Windows users, you’re on your own (for now). 🐧🍏
- Your commit history is preserved, so you can relive your coding journey. GitLab’s activity graph may look different, but your code is safe! 🧑‍💻
- The script can take a long time to run, depending on the number of repositories and their sizes. Patience is a virtue! ⏳ You can take your pet dog for a walk while it runs 🐶. For real developers, it typically takes 15-20 minutes.
- You can deploy it on a server and run it in the background, so you can continue your work while it does its magic. 🖥️✨

## Deploy and Automate (Local PC or Server) 🚀

**Cloud**: (I suggest using a cron-job service instead of getting an EC2 or compute instance.)

**Local**: Automate backups with the provided deploy script:

1. Make the script executable:

   ```
   chmod +x build.sh deploy.sh
   ```
2. Run the build script to set up your environment:

   ```sh
   bash build.sh
   ```
3. Run the deploy script to schedule automated backups:

   ```sh
   bash deploy.sh
   ```

   - You will be prompted for a cron schedule (e.g., `0 2 * * *` for daily at 2 AM).
   - The script will activate your `.venv` and schedule a cron job to run `main.py` automatically. Each time the cron job is triggered, a timestamped message is written to `shell_logs.txt`, followed by the output of the script.
4. **Managing your cron jobs:**

   - View your cron jobs:
     ```sh
     crontab -l
     ```
   - Remove all cron jobs:
     ```sh
     crontab -r
     ```
   - Edit or remove specific jobs:
     ```sh
     crontab -e
     ```
5. **Logs:**

   - All output and errors from each run are written to `shell_logs.txt` in the project root. Each run starts with a line like `Cron job triggered at ...` so you can see exactly when the job was executed.
   - Detailed logs for each backup session are also saved in the `Logs/` folder, with timestamped filenames (e.g., `logs_YYYYMMDD_HHMMSS.txt`).
   - Check these files for progress, errors, and troubleshooting.

## Troubleshooting 🛠

The logs are available in the `shell_logs.txt` file and in the `Logs/` folder. If you encounter any issues, check these logs for clues. If you need help, feel free to open an issue on GitHub.
If you run into issues, check the logs in `shell_logs.txt` and the timestamped files in the `Logs/` folder. They’re like breadcrumbs leading you to the solution. 🕵️‍♀️

## Screenshots


## Contributing 🤝

- I only have macOS and Linux, so it is tested on those platforms and works. I’d love it if someone could test it on a Windows machine. If any errors come up, please open an issue detailing them. I will fix them when I can. 🐧🍏
- If some issues are opened and not assigned (except to me), just jump to the discussion section and ping me there if you are interested in fixing them. I will assign you the issue, and you can work on it. 🛠️

## License 📄

MIT License. Use, share, and enjoy! 😄
