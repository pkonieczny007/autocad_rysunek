(defun c:rys1 ()
  (prompt "\nZaznacz obiekt do zapisania jako DXF.")
  
  ;; Wybór obiektu
  (setq ss (ssget "_:S"))
  
  (if ss
    (progn
      ;; Wywołanie okna dialogowego do wyboru lokalizacji i nazwy pliku
      (setq fname (getfiled "Wybierz lokalizację i nazwę pliku DXF" "" "dxf" 1))
      
      ;; Sprawdzenie, czy użytkownik podał nazwę pliku
      (if fname
        (progn
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
