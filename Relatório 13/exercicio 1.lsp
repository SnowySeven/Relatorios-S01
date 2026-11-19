(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (let ((tox (erva-toxicidade erva)))
    (cond ((>= tox 7) "veneno")
          ((>= tox 4) "use com cuidado")
          (t "segura"))))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f/g - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      (format nil "AVISO: Maomao vai testar ~a em si mesma antes."
              (erva-nome erva))
      (format nil "OK: ~a liberada para o paciente."
              (erva-nome erva))))

(defun main ()
  (let* ((erva-veneno (make-erva :nome "Raiz de Lua"
                                 :preco-por-grama 45.0
                                 :toxicidade 9))
         (erva-cuidado (make-erva :nome "Flor de Loto Cinza"
                                  :preco-por-grama 18.5
                                  :toxicidade 5))
         (erva-segura (make-erva :nome "Folha de Salvia Imperial"
                                 :preco-por-grama 6.0
                                 :toxicidade 1))
         (ervas (list erva-veneno erva-cuidado erva-segura)))

    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%~%" (aviso e)))

    (let ((gramas 12))
      (format t "Preco de ~a g de ~a: R$~,2f~%"
              gramas
              (erva-nome erva-cuidado)
              (preco-da-dose erva-cuidado gramas)))))

(main)
