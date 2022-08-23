;; Tagu.el is a very simple program in Emacs LISP for managing projects

(setq project-dir "~/Tests/")

(defun project-tags (project)
  "Return PROJECT's list of tags"
  (with-temp-buffer
    (insert-file-contents (file-name-concat project-dir project "tags"))
    (split-string (buffer-string))))

(defun has-tag-p (tag project)
  "Return non-nil if TAG is a tag of PROJECT"
  (member tag (project-tags project)))

(defun list-projects ()
  "List the projects in PROJECT-DIR"
  (cddr (directory-files project-dir)))

(progn
  "Doing some tests"
  (setq dummy-project-name "project-manhattan")
  (project-tags dummy-project-name)
  (if (has-tag-p "confidential" "project-manhattan")
      (message "Affirmative.")
    (message "Negative")))


