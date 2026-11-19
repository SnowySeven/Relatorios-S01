(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro  1.5)
    (:hydro    1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d)
     (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((acessiveis
           (remove-if-not
            (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
            lista))
         (textos
           (mapcar
            (lambda (d)
              (format nil "~a - Mora final: ~,1f"
                      (dominio-nome d)
                      (recompensa-final d)))
            acessiveis)))
    textos))

(defun main ()
  (let* ((d1 (make-dominio :nome "Templo do Leao"
                           :elemento :pyro
                           :dificuldade 1
                           :mora 1500))
         (d2 (make-dominio :nome "Canhao dos Esquecidos"
                           :elemento :electro
                           :dificuldade 3
                           :mora 2500))
         (d3 (make-dominio :nome "Vale da Lembranca"
                           :elemento :anemo
                           :dificuldade 2
                           :mora 2000))
         (d4 (make-dominio :nome "Pico de Vindagnyr"
                           :elemento :cryo
                           :dificuldade 4
                           :mora 3500))
         (d5 (make-dominio :nome "Jardim da Cecilia"
                           :elemento :hydro
                           :dificuldade 5
                           :mora 4000))
         (dominios (list d1 d2 d3 d4 d5)))

    (format t "--- Rota (dificuldade maxima 3) ---~%")
    (dolist (linha (rota dominios 3))
      (format t "~a~%" linha))

    (format t "~%Total de mora da lista inteira: ~,1f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)
                    :initial-value 0))

    (let ((copia (copy-dominio d2)))
      (setf (dominio-mora copia) 9999)
      (format t "~%Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original (~a): ~a~%"
              (dominio-nome d2)
              (dominio-mora d2)))))

(main)
