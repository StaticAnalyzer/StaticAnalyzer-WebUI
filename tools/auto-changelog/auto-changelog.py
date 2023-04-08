import subprocess
import sys
import datetime
from collections import defaultdict
import os
from shutil import copyfile

repos = {
    "General": "https://github.com/StaticAnalyzer/StaticAnalyzer-WebUI.git",
    "Backend": "https://github.com/StaticAnalyzer/StaticAnalyzer-Backend.git",
    "Frontend": "https://github.com/StaticAnalyzer/StaticAnalyzer-Frontend.git",
    "Algorithm": "https://github.com/StaticAnalyzer/StaticAnalyzer-Algorithm.git"
}

dir_names = {
    "General": "StaticAnalyzer-WebUI",
    "Backend": "StaticAnalyzer-Backend",
    "Frontend": "StaticAnalyzer-Frontend",
    "Algorithm": "StaticAnalyzer-Algorithm"
}

commit_types = {
    "fix": "Bug Fixes",
    "feat": "Features"
}


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python auto-changelog.py <version>")
        exit(1)

    if os.path.exists("../../CHANGELOG.md"):
        copyfile("../../CHANGELOG.md", "CHANGELOG.md")

    # 获取上一次的版本号，每个仓库上次记录的commit
    last_version = ""
    last_commits = defaultdict(lambda: "")
    if os.path.exists("last_version.txt"):
        with open("last_version.txt", "r") as f:
            lines = f.read().split("\n")
            if len(lines) != 0:
                last_version = lines[0]
                for line in lines[1:]:
                    if len(line) == 0:
                        continue
                    repo, commit = line.split(" ")
                    last_commits[repo] = commit


    # 获取当前版本号
    cur_version = sys.argv[1]

    # clone仓库
    for repo in repos.keys():
        if os.path.exists(dir_names[repo]):
            subprocess.call(f"cd {dir_names[repo]} && git pull", shell=True)
        else:
            subprocess.call(f"git clone {repos[repo]}", shell=True)

    # 获取每个仓库的commit
    commits = defaultdict(lambda: defaultdict(lambda: {}))
    for repo in repos.keys():
        git_log_cmd = 'git log --pretty=format:"%h %s"'
        repo_commits = subprocess.check_output(f"cd {dir_names[repo]} && {git_log_cmd}", shell=True).decode("utf-8").strip().split("\n")
        repo_commits = [[commit[:7]]+commit[8:].split(":", 1) for commit in repo_commits]
        
        if last_commits[repo] == "":
            last_commits[repo] = repo_commits[0][0]
        else:
            last_version_commit = list(filter(lambda commit: commit[0] == last_commits[repo], repo_commits))
            last_version_commit = last_version_commit[0]
            last_version_commit_index = repo_commits.index(last_version_commit)
            repo_commits = repo_commits[:last_version_commit_index]
            if len(repo_commits) == 0:
                continue
            else:
                last_commits[repo] = repo_commits[0][0]

        fix_commits = list(filter(lambda commit: len(commit) >= 2 and commit[1] in ["fix"], repo_commits))
        feat_commits = list(filter(lambda commit: len(commit) >= 2 and commit[1] in ["feat"], repo_commits))
        commits[repo] = {
            "fix": fix_commits,
            "feat": feat_commits
        }
    
    # 记录last_version.txt
    with open("last_version.txt", "w") as f:
        f.write(cur_version + "\n")
        for repo in repos.keys():
            f.write(f"{repo} {last_commits[repo]}\n")
    
    # 生成changelog，在文件头部附加
    with open("CHANGELOG.md", "r+", encoding="utf-8") as f:
        content = f.read()
    with open("CHANGELOG.md", "w", encoding="utf-8") as f:
        f.write(f"# {cur_version} ({datetime.datetime.now().strftime('%Y-%m-%d')})\n")
        for repo in repos.keys():
            f.write(f"## {repo}\n")
            for commit_type in commits[repo].keys():
                f.write(f"### {commit_types[commit_type]}\n")
                for commit in commits[repo][commit_type]:
                    f.write(f"* {commit[2].strip()}({commit[0]})\n")
        f.write(content)