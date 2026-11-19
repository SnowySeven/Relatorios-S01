(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviata: mantenha distancia")
    (otherwise   "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a (~a, ~am) - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper"
                  :bioma "Kelp Forest"
                  :profundidade 45
                  :perigo :inofensiva)
   (make-criatura :nome "Stalker"
                  :bioma "Kelp Forest"
                  :profundidade 90
                  :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan"
                  :bioma "Crash Zone"
                  :profundidade 220
                  :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan"
                  :bioma "Lost River"
                  :profundidade 650
                  :perigo :leviata)))

(defun main ()
  (format t "--- Catalogo Completo ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (let* ((limite 150)
         (filtradas (abaixo-de limite *catalogo*))
         (textos-filtrados (mapcar #'descreve-criatura filtradas)))
    (format t "~%--- Abaixo de ~am ---~%" limite)
    (dolist (texto textos-filtrados)
      (format t "~a~%" texto))
    (format t "Total de criaturas abaixo de ~am: ~a~%"
            limite
            (length filtradas))))

(main)
