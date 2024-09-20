;; Globalna zmienna do przechowywania ostatniego folderu
(setq lastFolder "")

(defun c:2rys ()
  (prompt "\nZaznacz obiekt do zapisania jako DXF.")
  
  ;; Wybór obiektu
  (setq ss (ssget "_:S"))
  
  (if ss
    (progn
      ;; Jeśli zmienna lastFolder jest pusta, ustaw bieżący katalog roboczy
      (if (not lastFolder) (setq lastFolder ""))

      ;; Wywołanie okna dialogowego do wyboru lokalizacji i nazwy pliku,
      ;; z ustawieniem ostatnio wybranego folderu jako domyślnego
      (setq fname (getfiled "Wybierz lokalizację i nazwę pliku DXF" lastFolder "dxf" 1))
      
      ;; Sprawdzenie, czy użytkownik podał nazwę pliku
      (if fname
        (progn
          ;; Zaktualizuj ostatni folder na podstawie ścieżki wybranego pliku
          (setq lastFolder (vl-filename-directory fname))
          
          ;; Wykonanie polecenia wblock, zapis obiektu jako DXF
          (command "_.wblock" fname ss)
          (prompt (strcat "\nBlok zapisano jako " fname))
        )
        (prompt "\nAnulowano zapis pliku.")
      )
    )
    (prompt "\nNie wybrano żadnego obiektu.")
  )
  (princ)
)
