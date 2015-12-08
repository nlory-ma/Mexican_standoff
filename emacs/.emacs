;; ************************************************************************** ;;
;;                                                                            ;;
;;                                                        :::      ::::::::   ;;
;;  .emacs                                              :+:      :+:    :+:   ;;
;;                                                    +:+ +:+         +:+     ;;
;;   By: nlory-ma <nlory-ma@student.42.fr>          +#+  +:+       +#+        ;;
;;                                                +#+#+#+#+#+   +#+           ;;
;;   Created: 2013/11/28 07:04:35 by nlory-ma          #+#    #+#             ;;
;;   Updated: 2013/12/20 17:30:15 by nlory-ma         ###   ########.fr       ;;
;;                                                                            ;;
;; ************************************************************************** ;;

;; chargement complet de la config lisp
(setq config_files "/usr/share/emacs/site-lisp/")
(setq load-path (append (list nil config_files) load-path))
(set-language-environment "UTF-8")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;           PARTIE OBLIGATOIRE           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                EXERCICE 1              ;
;        Fichiers de configuration       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Un code en C est automatiquement indenté avec des tabulations
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'lisp-mode-hook 'set-newline-and-indent)

;; Une paire (parenthèse ou accolade) est automatique fermée
;; lorsque vous saisissez l’élément ouvrant
(electric-pair-mode 1)
(setq electric-pair-pairs '(
							(?\" . ?\")
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\{ . ?\})
                           ))

;; La colonne de position du curseur est affichée
(column-number-mode t)

;; Deux espaces côte-à-côte sont highlightés
(add-hook 'c-mode-common-hook
		  (lambda() (highlight-regexp "  " t)
			))

;; Un whitespace avant un retour à la ligne est highlighté
(setq show-trailing-whitespace t)
(setq-default show-trailing-whitespace t)

;; Les fichiers de sauvegarde (se terminant par ~) sont archivés
;; dans un dossier spécifique à l’intérieur du dossier ~/.emacs.d
(defvar my-auto-save-folder "~/.emacs.d/auto-save"); folder for auto-saves
(setq auto-save-list-file-prefix "~/.emacs.d/auto-save/saved-"); set prefix for auto-saves
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-folder t))); location for all auto-save files
(setq tramp-auto-save-directory my-auto-save-folder); auto-sa

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                EXERCICE 2              ;
;            Raccourcis clavier          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;          CF normalize_emacs          ;;

;(if (file-exists-p "~/.emacs.d/normalize_emacs")
;	(load-file "~/.emacs.d/normalize_emacs")
;)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                EXERCICE 2              ;
;                Header 42               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun 42-header-filename() (concat (format "%-38s" (current-buffer))))
(defun 42-header-mail() (concat (format "%-34s" (concat (getenv "USER") " <" (getenv "MAIL") ">"))))
(defun 42-header-created-time() (concat (format "%-29s" (concat (format-time-string "%Y/%m/%d %T") " by " (getenv "USER")))))
(defun 42-header-updated-time() (concat (format "%-29s" (concat (format-time-string "%Y/%m/%d %T") " by " (getenv "USER")))))


(defun make-42-header()
  (concat
   "/*" " ************************************************************************** */" "\n"
   "/*" "                                                                            */" "\n"
   "/*" "                                                        :::      ::::::::   */" "\n"
   "/*" "   " (42-header-filename)               "             :+:      :+:    :+:   */" "\n"
   "/*" "                                                    +:+ +:+         +:+     */" "\n"
   "/*" "   By: " (42-header-mail)               "         +#+  +:+       +#+        */" "\n"
   "/*" "                                                +#+#+#+#+#+   +#+           */" "\n"
   "/*" "   Created: " (42-header-created-time)  "            #+#    #+#             */" "\n"
   "/*" "   Updated: " (42-header-updated-time)  "           ###   ########.fr       */" "\n"
   "/*" "                                                                            */" "\n"
   "/*" " ************************************************************************** */" "\n"
   )
)
(defun remake-42-header()
  (concat "/*" "   Updated: " (42-header-updated-time)  "           ###   ########.fr       */" "\n")
)

(defun check-if-42-header-exists()
  (if(> (buffer-size) 501)
	  (string-equal (buffer-substring-no-properties 1 501)
					(substring (make-42-header) 0 500)
	  )
	nil
  )
)
(check-if-42-header-exists)

(defun check-if-buffer-updated ()
  (if(> (buffer-size) 801)
	  (string-equal ((buffer-substring-no-properties 721 801))
					(substring (make-42-header) 720 800)
	  )
	nil
	)
)
(check-if-buffer-updated)

(defun update-42-header()
  (interactive)
  (insert (concat "UPDATED " "CALLED"))

  (if (check-if-42-header-exists)
      (
	   (insert (concat "UPDATED " "HEADER EXISTS"))

	   (if (buffer-modified-p)
	       (
		(insert (concat "UPDATED " "BUFFER WAS MODIFIED"))
			save-excursion
			 (goto-char 0)
			(insert (remake-42-header))
		   )
	   )
	   (if (not(buffer-modified-p))
	       (insert (concat "UPDATED " " HBUFFER NOT MODIFIED"))
	   )

      )
  )
UPDATED CALLED  (if (not(check-if-42-header-exists))
      (insert (concat "UPDATED " " HEADER NOT EXISTS"))
    )
  )

(defun 42-header()
  (interactive)
  (if (not(check-if-42-header-exists))
	  (
	    save-excursion
		(goto-char 0)
		(insert (make-42-header))
	  )
  )
)
(add-hook 'before-save-hook 'update-42-header)

(defun 42-apply-norm()
  (interactive)
)

(provide '42-header)

(global-set-key (kbd "C-c h") '42-header)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;              PARTIE BONUS              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Activer la coloration syntaxique
(global-font-lock-mode t)

;; tabulations de 4 chars
;; correction des tabulations
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq-default c-basic-offset 4)

;; n'indente pas les acollades
(setq-default c-default-style "linux")

;; La ligne de position du curseur est affichée
(line-number-mode t)

;; affiche la limite des 80 caracterexs
;; a la fin de chaque ligne
;; en highlightant ce qui depasse
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; les commentaires C++ sont highlightes
(add-hook 'c-mode-common-hook (lambda() (highlight-regexp "//" t)))

;; highlight sur la ligne actuelle
(global-hl-line-mode 1)
(set-face-background 'hl-line "#111111")

;; Load user configuration
(if (file-exists-p "~/.myemacs") (load-file "~/.myemacs"))



;;(setq-default font-lock-global-modes nil)
;;(setq-default line-number-mode nil)
;;(global-set-key (kbd "DEL") 'backward-delete-char)
;;(setq-default c-backspace-function 'backward-delete-char)
