Project: Godot tutorial (fork of tutorial-godot-horror)

- **Note:** Large binary files under `glb_models/` were migrated to Git LFS and the `main` branch history was rewritten to remove large blobs.

- **If you cloned before this change:** either re-clone the repo or reset to the updated `main`:

  ```bash
  git clone https://github.com/Yancovert/tutorial-godot-horror.git
  # or, in an existing clone:
  git fetch origin
  git reset --hard origin/main
  ```

- **To view tracked LFS files:**

  ```bash
  git lfs ls-files
  ```

- **If you stashed local changes before migration:**

  ```bash
  git stash list
  git stash pop  # reapply most recent stash
  ```

- **Why:** GitHub rejects files >100MB. Using Git LFS stores large assets separately and keeps the git history small.

Contact: repo maintainer (Yancovert) for coordination if you share this repository with collaborators.
