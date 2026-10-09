# Python for MIT 6.100L

A small workspace for [MIT 6.100L on OCW](https://ocw.mit.edu/courses/6-100l-introduction-to-cs-and-programming-using-python-fall-2022/). GitHub Codespaces provides the computer; VS Code is the editor; uv installs Python packages automatically. No local Python installation is needed.

## First time — with your mentor

1. Open this repository on GitHub, click **Fork**, and create your own copy. Your mentor can help if the repository does not allow forks.
2. In **your copy**, choose **Code → Codespaces → Create codespace**. Wait for setup to finish. Codespaces clones the files and installs everything for you.
3. To use desktop VS Code, install Microsoft's **GitHub Codespaces** extension and sign in to GitHub. Open the Command Palette and choose **Codespaces: Connect to Codespace**, then select this Codespace. Working in the browser also works.
4. Open a new file, save it as `hello.py`, and type `print("Hello!")`. Click the triangle at the top right (**Run Python File in Terminal**). You should see `Hello!` below the editor.
5. Click **Save my work** in the bottom status bar. Wait for **Saved and backed up to GitHub.** Confirm that `hello.py` appears in your repository on GitHub.

## Each study session

- Resume your existing Codespace from [github.com/codespaces](https://github.com/codespaces); you do not need a new one each time.
- Download the starter files from OCW and put each problem set in its own folder here. Keep the provided data files beside the Python files.
- Open a `.py` file and click **Run Python File in Terminal**. Type answers to `input()` prompts in the terminal. **Ctrl+C** stops a running program.
- Click **Save my work** whenever you want a backup, especially before finishing. It saves all files, records all changes (including deletions), and uploads them to **your** GitHub copy. Only the success message confirms the upload; an error leaves your files here for your mentor to help with.
- Stop the Codespace when finished using **Codespaces: Stop Current Codespace** in the Command Palette. Codespaces has usage limits; closing the VS Code window alone may leave it running until its idle timeout.

If the save button is missing, use **Terminal → Run Task → Save my work**.

## Following along with Spyder demonstrations

| In the course | In this workspace |
| --- | --- |
| Write and run a Python file | VS Code editor and **Run Python File in Terminal** |
| Try an expression in the console | In a terminal, run `uv run python`; type `exit()` to leave |
| Inspect variables | Click beside a line number to add a breakpoint, press **F5**, then view **Variables** |
| View a Matplotlib plot | When `show()` runs, open **Ports → Python plots → Open in Browser**. Press **Ctrl+C** in the terminal before running another plotting script |
| View an image saved by a problem set | Click the image file in VS Code's Explorer |

Each normal script run starts fresh, matching the course's recommendation to clear old variables. This environment has no desktop GUI: if Pillow's `image.show()` cannot open a viewer, save with `image.save("result.png")` and open that file instead.

Some lecture snippets rely on Spyder to display plots automatically. When running those as a file, add `plt.show()` at the end (after `import matplotlib.pyplot as plt`).

## Mentor notes

The container installs Python 3.12, uv 0.12.19, Git, and basic connection tools. The Python environment contains **NumPy, Matplotlib, Pillow, and python-dateutil**, plus **Tornado** to display Matplotlib plots in a browser. NumPy stays on 1.26 for compatibility with older course examples. VS Code manages its own editor runtime; no Anaconda, Spyder, Jupyter, or application Node.js setup is needed.

Based on MIT's official [syllabus](https://ocw.mit.edu/courses/6-100l-introduction-to-cs-and-programming-using-python-fall-2022/pages/syllabus/), [Problem Set 0 setup handouts](https://ocw.mit.edu/courses/6-100l-introduction-to-cs-and-programming-using-python-fall-2022/resources/mit6_100l_f22_ps0_code_zip/), and imports across all 26 [lecture-code downloads](https://ocw.mit.edu/courses/6-100l-introduction-to-cs-and-programming-using-python-fall-2022/lists/lecture-code/) and [problem-set starter files](https://ocw.mit.edu/courses/6-100l-introduction-to-cs-and-programming-using-python-fall-2022/lists/problem-sets/). The handout uses Anaconda/Python 3.9; this setup uses maintained Python 3.12. The shared A/B/L VS Code handout also lists pandas and scikit-learn, but the supplied 6.100L code does not import them, so they are deferred. Lecture 20 uses python-dateutil; Problem Set 5 uses Pillow.

`pyproject.toml` lists the packages, `uv.lock` records exact versions, and `.venv` is the disposable local environment. Setup runs `uv sync --locked` automatically. Useful commands from this repository's terminal:

```sh
uv sync --locked              # restore the recorded environment
uv run python                # interactive Python prompt
uv add pandas scikit-learn    # only if a later exercise needs them
```

To run a supplied test script, open that file and use the same Run button. From a terminal, change into the problem-set folder first, then use `uv run python test_ps2_student.py` (substitute the actual filename). uv finds the environment in the parent folder.

For a new student, repeat the fork-and-create steps above. After changing `.devcontainer` configuration, run **Codespaces: Rebuild Container**. If VS Code picks the wrong interpreter, run **Python: Select Interpreter** and select `.venv/bin/python`.

The save button uses a small [VS Code Tasks extension](https://github.com/actboy168/vscode-tasks) and `.devcontainer/save-work.sh`. It never force-pushes or automatically merges conflicts. Codespaces normally supplies Git identity and authentication. If identity is missing, set the student's actual name/email with `git config user.name "Name"` and `git config user.email "Email"`. Failed uploads may need reconnection, write access to the student's copy, or help reconciling changes.

Validated in a local Docker container: clean/repeated installation, MIT's plotting example, lecture 20, and image handling. The backup script passed eight local Git scenarios. A live GitHub Codespace and its VS Code buttons still need the first-time check above.
